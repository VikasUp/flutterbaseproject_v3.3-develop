import 'dart:async';

import 'package:base_project/gen/colors.gen.dart';
import 'package:base_project/gen/fonts.gen.dart';
import 'package:base_project/presentation/breakers_paradise/screen/breakers_page.dart';
import 'package:base_project/presentation/register_with_otp/screen/register_with_otp_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/firebase/index.dart';
import 'core/index.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'presentation/authentication/bloc/authentication.dart';
import 'presentation/edit_profile/screen/edit_profile_page.dart';
import 'presentation/forgot_password/screen/forgot_password_page.dart';
import 'presentation/home/bloc/home.dart';
import 'presentation/login/bloc/login.dart';
import 'presentation/login_type_selection/screen/login_type_selection_page.dart';
import 'presentation/otp_validation/screens/otp_validation_page.dart';
import 'presentation/profile/screen/profile_page.dart';
import 'presentation/registration/screens/registration_page.dart';
import 'presentation/splash/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loggerConfigure();
  NetworkInfo();
  await di.init();

  await Firebase.initializeApp();
  FirebaseMessagingHelper().configure();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterLocalNotificationHelper().initializeSettings();

  bool isAppConfigured = await AppConfig.configure();

  if (await FlutterAppBadger.isAppBadgeSupported() == true) {
    FlutterAppBadger.removeBadge();
  }

  if (isAppConfigured == true) {
    //! initializing api services
    ApiClient.initServices();
    startApp();
  } else {
    // TODO - Working on this
    runApp(
      MaterialApp(
        home: Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              "No able to find app, Please restart the app",
              style: TextStyle(
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

void startApp() async {
  //Pass all uncaught errors to Crashlytics.
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runZonedGuarded<Future<void>>(() async {
    runApp(const MyApp());
  }, (e, s) {
    onCrash(e, s);
  });
}

void onCrash(Object exception, StackTrace stackTrace) {
  FirebaseCrashlytics.instance.recordError(exception, stackTrace);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    setupInteractedMessage();
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      FlutterLocalNotificationHelper()
          .handleNotificationRedirection(initialMessage.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (_) {
        return di.serviceLocator<AuthenticationBloc>()..add(AppStarted());
      },
      child: buildMaterialApp(),
    );
  }

  MaterialApp buildMaterialApp() => MaterialApp(
        navigatorKey: serviceLocator<AppNavigator>().navigatorKey,
        theme: ThemeData(
          fontFamily: FontFamily.montserrat,
          primarySwatch: ColorName.primarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: buildBlocListener(),
        routes: {
          LoginPage.tag: (context) => const LoginPage(),
          HomePage.tag: (context) => const HomePage(),
          ForgotPasswordPage.tag: (context) => const ForgotPasswordPage(),
          ProfilePage.tag: (context) => const ProfilePage(),
          RegistrationPage.tag: (context) => const RegistrationPage(),
          OtpValidationPage.tag: (context) => const OtpValidationPage(),
          EditProfilePage.tag: (context) => const EditProfilePage(),
          RegisterWithOTPPage.tag: (context) => const RegisterWithOTPPage()
        },
        navigatorObservers: [
          serviceLocator<FirebaseAnalyticsService>().appAnalyticsObserver(),
        ],
      );

  BlocListener buildBlocListener() {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          SizeConfig().init(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginTypeSelectionPage()),
              (route) => false);
        }
      },
      child: buildBlocBuilder(),
    );
  }

  BlocBuilder buildBlocBuilder() =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          // SizeConfig().init(context);
          // if (state is AuthenticationUninitialized) {
          //   return const SplashScreen();
          // } else if (state is AuthenticationUnauthenticated) {
          //   return const LoginTypeSelectionPage();
          // } else if (state is AuthenticationAuthenticated) {
          //   return const HomePage();
          // }
          return const BreakersPage();
        },
      );

  ///Used for Screen Transitions with Animation
/*Route _createRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      );*/
}
