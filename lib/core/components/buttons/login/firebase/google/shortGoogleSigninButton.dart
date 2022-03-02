import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/pathConstants.dart';
import '../../../../../constants/stringConstants.dart';
import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

// ignore: must_be_immutable
class ShortGoogleSignInButton extends StatelessWidget {
  ShortGoogleSignInButton({Key? key, this.width}) : super(key: key);

  double? width;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: const Color(0xffffffff),
      borderRadius: 2,
      child: _buttonWidget(context),
      width: width ?? MediaQuery.of(context).size.width * .3,
      height: 44,
      onPressed: () => FirebaseAuthService.instance.signInWithGoogle,
    );
  }

  Widget _buttonWidget(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            PathConstants.instance.googleLightButtonSvg,
            fit: BoxFit.cover,
          ),
          Text(
            StringConstants.instance.googleText,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black.withOpacity(.54)),
            textAlign: TextAlign.left,
          ),
        ],
      );
}
