import 'package:flutter/material.dart';

import '../../../../../constants/pathConstants.dart';
import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

class CircularFacebookLoginButton extends StatelessWidget {
  CircularFacebookLoginButton({Key? key, this.width}) : super(key: key);
  double? width;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: Colors.white,
      child: _buttonWidget,
      shape: BoxShape.circle,
      width: width ?? 50,
      onPressed: () => FirebaseAuthService.instance.signInWithFacebook,
    );
  }

  Widget get _buttonWidget => Center(
        child: Image.asset(
          PathConstants.instance.facebookButtonBluePng,
          scale: 4,
        ),
      );
}
