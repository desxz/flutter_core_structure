import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/pathConstants.dart';
import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

class CircularGoogleSigninButton extends StatelessWidget {
  CircularGoogleSigninButton({Key? key, this.width}) : super(key: key);
  double? width;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: const Color(0xffffffff),
      shape: BoxShape.circle,
      child: _buttonWidget(context),
      width: width ?? 48,
      onPressed: () => FirebaseAuthService.instance.signInWithGoogle,
    );
  }

  Widget _buttonWidget(BuildContext context) => Center(
        child: SvgPicture.asset(
          PathConstants.instance.googleLightButtonSvg,
          fit: BoxFit.cover,
        ),
      );
}
