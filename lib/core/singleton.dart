class Singleton {
  Singleton._();
  static final Singleton _instance = Singleton._();

  factory Singleton() => _instance;

  late String _firebaseToken;

  String? getFirebaseToken() => _firebaseToken;

  void setFirebaseToken(String token) {
    _firebaseToken = token;
  }
}
