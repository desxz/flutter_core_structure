import 'package:flutter/material.dart';

import '../../../../../constants/pathConstants.dart';
import '../../../../../constants/stringConstants.dart';
import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

class DefaultTwitterLoginButton extends StatelessWidget {
  DefaultTwitterLoginButton({Key? key, this.width}) : super(key: key);
  double? width;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: const Color(0xff1DA1F2),
      borderRadius: 2,
      child: _buttonWidget(context),
      width: width ?? MediaQuery.of(context).size.width * .6,
      height: 44,
      onPressed: () => FirebaseAuthService.instance.signInWithTwitter,
    );
  }

  Widget _buttonWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              PathConstants.instance.twitterButtonWhiteSvg,
              fit: BoxFit.contain,
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              StringConstants.instance.defaultTwitterSigninText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 3),
          ],
        ),
      );
}
