enum ButtonType {
  loginWithOTP,
  loginWithPassword,
  registerWithPassword,
}

enum RegistrationType {
  email,
  phoneNumber,
}

enum NotificationRedirection { loginPassword, registerPassword, registerOTP }

//! firebase crash types
enum ExceptionType {
  serverException,
  catchErrorException,
  unauthorisedException,
  other
}
