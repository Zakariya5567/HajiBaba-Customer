import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final double textSize;
  final Color color;
  final Color textColor;
  final TextStyle textStyle;
  final Icon icon;
  final BorderRadius borderRadius;

  const CustomButton({
    Key key,
    @required this.callback,
    @required this.title,
    this.textSize,
    this.color,
    this.textColor,
    this.textStyle,
    this.icon,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return SizedBox(
        width: double.infinity,
        height: SizeConfig.kDefaultSize * 15,
        child: TextButton(

          child: Text(
            title,
            style: textStyle ??
                TextStyle(
                  fontSize: textSize ?? SizeConfig.kDefaultSize * 3.8,
                  color: textColor ?? Colors.white,
                ),
            textScaleFactor: 1,
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith(
              (states) {
                return RoundedRectangleBorder(
                  borderRadius: borderRadius ??
                      BorderRadius.circular(
                        SizeConfig.kDefaultSize * 7,
                      ),
                );
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => color ?? Constant.primaryColor,
            ),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) => Colors.black26,
            ),
          ),
          onPressed: () {
            callback();
          },
        ),
      );
    } else {
      double width = MediaQuery.of(context).size.width;
      return SizedBox(
        width: double.infinity,
        height: SizeConfig.kDefaultSize * 12,
        child: TextButton(
          child: Row(
            children: [
              icon,
              SizedBox(
                width: width * .02,
              ),
              Text(
                title,
                style: textStyle ??
                    TextStyle(
                      fontSize: textSize ?? SizeConfig.kDefaultSize * 3.8,
                      color: textColor ?? Colors.white,
                    ),
                textScaleFactor: 1,
              ),
            ],
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith(
              (states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.kDefaultSize * 7,
                  ),
                );
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => color ?? Constant.primaryColor,
            ),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) => Colors.black26,
            ),
          ),
          onPressed: () {
            callback();
          },
        ),
      );
    }
  }
}
