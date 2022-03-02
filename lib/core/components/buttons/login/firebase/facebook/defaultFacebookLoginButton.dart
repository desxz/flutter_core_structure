import 'package:flutter/material.dart';

import '../../../../../constants/pathConstants.dart';
import '../../../../../constants/stringConstants.dart';
import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

// ignore: must_be_immutable
class DefaultFacebookLoginButton extends StatelessWidget {
  DefaultFacebookLoginButton({Key? key}) : super(key: key);
  double? width;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: const Color(0xff4267b2),
      borderRadius: 2,
      child: _buttonWidget(context),
      width: width ?? MediaQuery.of(context).size.width * .6,
      height: 44,
      onPressed: () => FirebaseAuthService.instance.signInWithFacebook,
    );
  }

  Widget _buttonWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 25,
                child:
                    Image.asset(PathConstants.instance.facebookButtonWhitePng)),
            const Spacer(),
            Text(
              StringConstants.instance.defaultFacebookSigninText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.end,
            ),
            const Spacer(),
          ],
        ),
      );
}
