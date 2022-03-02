import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/pathConstants.dart';
import '../../../../../constants/stringConstants.dart';
import '../../../../../services/auth/firebase_auth.dart';
import '../../../default/defaultButton.dart';

enum ButtonThemeType { LIGHT, DARK }

class ButtonTypeModel {
  final String svg;
  final Color color;
  final Color textColor;

  ButtonTypeModel(this.svg, this.color, this.textColor);
}

extension on ButtonThemeType {
  ButtonTypeModel get raw {
    switch (this) {
      case ButtonThemeType.LIGHT:
        return ButtonTypeModel(
          PathConstants.instance.googleLightButtonSvg,
          const Color(0xffffffff),
          const Color(0xff000000).withOpacity(.60),
        );
      case ButtonThemeType.DARK:
        return ButtonTypeModel(
          PathConstants.instance.googleDarkButtonSvg,
          const Color(0xff4285F4),
          const Color(0xffffffff),
        );
      default:
        return ButtonTypeModel(
          PathConstants.instance.googleLightButtonSvg,
          const Color(0xffffffff),
          const Color(0xff000000).withOpacity(.60),
        );
    }
  }
}

// ignore: must_be_immutable
class DefaultGoogleSigninButton extends StatelessWidget {
  DefaultGoogleSigninButton({Key? key, this.width, required this.type})
      : super(key: key);
  double? width;
  final ButtonThemeType type;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: type.raw.color,
      borderRadius: 2,
      child: _buttonWidget(context),
      width: width ?? MediaQuery.of(context).size.width * .6,
      height: 44,
      onPressed: () => FirebaseAuthService.instance.signInWithGoogle,
    );
  }

  Widget _buttonWidget(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: type == ButtonThemeType.LIGHT,
            child: const Spacer(
              flex: 1,
            ),
          ),
          SvgPicture.asset(
            type.raw.svg,
            fit: BoxFit.cover,
          ),
          const Spacer(
            flex: 2,
          ),
          Text(
            StringConstants.instance.defaultGoogleSigninText,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: type.raw.textColor),
            textAlign: TextAlign.center,
          ),
          const Spacer(
            flex: 4,
          )
        ],
      );
}
