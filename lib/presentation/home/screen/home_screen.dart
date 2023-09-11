import 'dart:async';
import 'package:animations/animations.dart';
import 'package:base_project/core/index.dart';
import 'package:base_project/core/navigator.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/gen/colors.gen.dart';
import 'package:base_project/presentation/home/bloc/home_bloc.dart';
import 'package:base_project/presentation/home/bloc/home_event.dart';
import 'package:base_project/presentation/home/bloc/home_state.dart';
import 'package:base_project/presentation/profile/screen/profile_page.dart';
import 'package:base_project/ui_components/custom_listview/custom_listview.dart';
import 'package:base_project/ui_components/custom_loader/custom_loader.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfl_widgets/sfl_widgets.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//option menu choices
//class
class Choice {
  const Choice({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

//list of choices
const List<Choice> choices = <Choice>[
  Choice(title: 'Car', icon: Icons.directions_car),
  Choice(title: 'Bicycle', icon: Icons.directions_bike),
  Choice(title: 'Boat', icon: Icons.directions_boat),
  Choice(title: 'Bus', icon: Icons.directions_bus),
  Choice(title: 'Train', icon: Icons.directions_railway),
  Choice(title: 'Walk', icon: Icons.directions_walk),
];

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Choice _selectedChoice = choices[0];
  late String token;
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  late HomeBloc homeBloc;
  List<User> userList = [];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
    log.info('Selected option is ${_selectedChoice.title}');
  }

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    _fetchedUserList(isLoadMore: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Initialized to handle Firebase Notification when app is in foreground
      FlutterLocalNotificationHelper().initializeSettings();
    });
  }

  @override
  Widget build(BuildContext context) => buildScaffold(context);

  Widget buildScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.directions_car),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            IconButton(
              icon: const Icon(Icons.directions_bike),
              onPressed: () {
                _select(choices[1]);
              },
            ),
            _buildOptionMenu(),
          ],
        ),
        drawer: _buildDrawer(),
        body: UpgradeAlert(
          upgrader: Upgrader(
              showIgnore: false, showLater: false, canDismissDialog: false),
          child: Container(
            padding: const EdgeInsets.only(top: 8.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[50],
            child: buildList(context),
          ),
        ),
      );

  Widget _buildDrawer() => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                _navigateToProfile();
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Resources'),
              onTap: () {
                // Navigator.pushNamed(context, ResourceScreen.tag);
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_blocking_rounded),
              title: const Text('Manual Firebase Crash'),
              onTap: () {
                _performFetalCrash();
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                AppNavigator.instance.goBack();
                Timer(
                  const Duration(milliseconds: 300),
                  () {
                    showModal<void>(
                      context: context,
                      configuration: const FadeScaleTransitionConfiguration(),
                      builder: (BuildContext context) =>
                          _LogoutAlertDialog(homeBloc),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );

  Widget buildList(BuildContext context) =>
      BlocListener<HomeBloc, HomeState>(listener: (context, state) {
        if (state is HomeGetUserListFail) {
          SFLToast.display(context: context, message: state.error);
        }
        if (state is HomeGetUserListSuccess) {
          setState(() {
            userList = state.userList;
          });
        }
      }, child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeStateLoading || state is HomeStateInitial) {
          return const Center(
            child: CustomLoader(
              radius: 20.0,
              dotRadius: 8,
            ),
          );
        }
        return CustomListView(
            onRefresh: _onRefresh,
            onScroll: () => _fetchedUserList(isLoadMore: true),
            itemBuilder: (context, index) {
              User user = userList[index];
              return _buildUserCard(user);
            },
            hasMaxReached: homeBloc.hasMaxReached,
            itemCount: userList.length);
      }));

  Future<void> _onRefresh() async {
    _fetchedUserList(isLoadMore: false);
  }

  void _fetchedUserList({bool isLoadMore = false}) {
    homeBloc.add(HomeGetUserPaginatedEvent(isLoadMore: isLoadMore));
  }

  Widget _buildUserCard(User user) => OpenContainer(
      transitionType: _transitionType,
      openBuilder: (BuildContext _, VoidCallback openContainer) =>
          _DetailsPage(),
      tappable: true,
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        String _fName = user.firstName ?? "NA";
        String _lName = user.lastName ?? "NA";
        return Card(
          elevation: 3.0,
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              child: Text(
                '${_fName[0].toUpperCase()}${_lName[0].toUpperCase()}',
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            title: Text(
              '$_fName $_lName',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            subtitle: Text(
              '${user.email}',
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        );
      });

  Widget _buildOptionMenu() => PopupMenuButton<Choice>(
        itemBuilder: (context) => choices
            .skip(2)
            .map((Choice choice) => PopupMenuItem<Choice>(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        choice.icon,
                        color: ColorName.primary,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(choice.title),
                    ],
                  ),
                  value: choice,
                ))
            .toList(),
      );

  Widget _buildDrawerHeader() => DrawerHeader(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white24,
                    spreadRadius: 3.0,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                maxRadius: 35.0,
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.getScaledValue(15.0, context)),
            const Text(
              'Drawer Header',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ],
        ),
        decoration: const BoxDecoration(color: ColorName.primary),
      );

  void _performFetalCrash() async {
    FirebaseCrashlytics.instance.crash();
  }

  void _navigateToProfile() {
    AppNavigator.instance.goBack();
    AppNavigator.instance.navigateTo(ProfilePage.tag)?.whenComplete(() {
      _onRefresh();
    });
  }
}

class _LogoutAlertDialog extends StatelessWidget {
  final HomeBloc _bloc;

  const _LogoutAlertDialog(this._bloc);

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              AppNavigator.instance.goBack();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              AppNavigator.instance.goBack();
              _bloc.add(LogoutPressed());
            },
            child: const Text('Yes'),
          ),
        ],
      );
}

class _DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Details page')),
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.deepOrange,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Image.asset(
                  'assets/images/placeholder_image.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black54,
                          fontSize: 30.0,
                        ),
                  ),
                  SizedBox(height: SizeConfig.getScaledValue(10.0, context)),
                  Text(
                    SFLStrings.message.kLoremIpsumParagraph,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.black54,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
