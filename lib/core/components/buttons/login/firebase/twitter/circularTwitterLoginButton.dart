import 'package:flutter/material.dart';
import 'package:flutter_core_structure/core/constants/pathConstants.dart';

import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

class CircularTwitterLoginButton extends StatelessWidget {
  CircularTwitterLoginButton({Key? key, this.width}) : super(key: key);
  double? width;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: const Color(0xffffffff),
      shape: BoxShape.circle,
      child: _buttonWidget(context),
      width: width ?? 48,
      onPressed: () => FirebaseAuthService.instance.signInWithTwitter,
    );
  }

  Widget _buttonWidget(BuildContext context) => Center(
          child: Image.asset(
        PathConstants.instance.twitterButtonBlueSvg,
        fit: BoxFit.cover,
        scale: 40,
      ));
}
