class PathConstants {
  static PathConstants? _instance;
  static PathConstants get instance => _instance ??= PathConstants._init();
  PathConstants._init();

  final String googleLightButtonSvg =
      "assets/svg/btn_google_light_normal_ios.svg";
  final String googleDarkButtonSvg =
      "assets/svg/btn_google_dark_normal_ios.svg";
  final String facebookButtonBluePng = "assets/png/facebook_logo_blue.png";
  final String facebookButtonWhitePng = "assets/png/facebook_logo_white.png";
  final String twitterButtonWhiteSvg = "assets/png/twitter_logo_white.png";
  final String twitterButtonBlueSvg = "assets/png/twitter_logo_blue.png";

  //----------//
  final String deliveryLottie = "assets/lottie/9644-delivery-riding.json";
}
