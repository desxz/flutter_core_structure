import 'package:flutter/material.dart';

import '../../../../../constants/pathConstants.dart';
import '../../../../../constants/stringConstants.dart';
import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

class ShortFacebookLoginButton extends StatelessWidget {
  ShortFacebookLoginButton({Key? key, this.width}) : super(key: key);
  double? width;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: const Color(0xff4267b2),
      borderRadius: 2,
      child: _buttonWidget(context),
      width: width ?? MediaQuery.of(context).size.width * .3,
      height: 44,
      onPressed: () => FirebaseAuthService.instance.signInWithFacebook,
    );
  }

  Widget _buttonWidget(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            PathConstants.instance.facebookButtonWhitePng,
            scale: 5,
          ),
          Text(
            StringConstants.instance.facebookText,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ],
      );
}
