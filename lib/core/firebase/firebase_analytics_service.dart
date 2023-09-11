import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import '/core/constant/signup_login_methods.dart';

/*
* Class handling Firebase Analytics Observer & Methods
* */
class FirebaseAnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Observer triggering default events
  FirebaseAnalyticsObserver appAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  /// log sign_up event
  /// required parameter- sign up method
  /// default can be passed as EMAIL
  Future logSignUp({String signUpMethod = SignUpLogInMethods.kEmail}) async {
    await _analytics.logSignUp(signUpMethod: signUpMethod);
  }

  /// log log_in event
  /// required parameter- sign up method
  /// default can be passed as EMAIL
  Future logLogin({String loginMethod = SignUpLogInMethods.kEmail}) async {
    await _analytics.logLogin(loginMethod: loginMethod);
  }

  /// set user_id as user property
  /// required parameter- userId
  Future setUserId({required String? userId}) async {
    await _analytics.setUserId(id: userId);
  }

  /// set any custom user property
  /// required parameter- key,value (usually as _ separated string)
  Future setUserProperties(
      {required String key, required String? value}) async {
    await _analytics.setUserProperty(name: key, value: value);
  }

  /// trigger custom event
  /// required parameters - name (name of the event), parameters (Map<String,Object>
  /// containing Key/Value pairs of data)
  /// Example --
  /// serviceLocator<FirebaseAnalyticsService>().logCustomEvent(
  ///   name: 'EVENT',
  ///   parameters: {
  ///     'e_1': 'v_1',
  ///   },
  /// );
  Future logCustomEvent(
      {required String name, required Map<String, Object>? parameters}) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }
}
