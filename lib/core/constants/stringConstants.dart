class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._init();
  StringConstants._init();

  final String defaultGoogleSigninText = "Sign in with Google";
  final String defaultFacebookSigninText = "Sign in with Facebook";
  final String defaultTwitterSigninText = "Sign in with Twitter";
  final String defaultEmailSigninText = "Sign in with Email";
  final String signinText = "Sign in";
  final String loginText = "Log In";
  final String googleText = "Google";
  final String facebookText = "Facebook";
  final String twitterText = "Twitter";
  final String emailText = "Email";
}
