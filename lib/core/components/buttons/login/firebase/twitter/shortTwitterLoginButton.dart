import 'package:flutter/material.dart';

import '../../../../../constants/pathConstants.dart';
import '../../../../../constants/stringConstants.dart';
import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

class ShortTwitterLoginButton extends StatelessWidget {
  ShortTwitterLoginButton({Key? key, this.width}) : super(key: key);

  double? width;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: const Color(0xff1DA1F2),
      borderRadius: 2,
      child: _buttonWidget(context),
      width: width ?? MediaQuery.of(context).size.width * .3,
      height: 44,
      onPressed: () => FirebaseAuthService.instance.signInWithTwitter,
    );
  }

  Widget _buttonWidget(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            PathConstants.instance.twitterButtonWhiteSvg,
            scale: 40,
          ),
          Text(
            StringConstants.instance.twitterText,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ],
      );
}
