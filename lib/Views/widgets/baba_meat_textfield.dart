import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final bool isReadable;
  final VoidCallback onTap;
  final ValueChanged<String> onChange;
  final ValueChanged<String> onSubmitted;
  final Widget suffixIcon;
  final TextEditingController textEditingController;
  final String hintText;
  final bool obsecure;
  final bool isPasswordText;
  final int maxLines;
  final Widget prefixIcon;
  final TextInputType textInputType;

  const CustomTextField({
    Key key,
    @required this.textEditingController,
    @required this.hintText,
    this.obsecure = false,
    this.isPasswordText = false,
    this.maxLines = 1,
    this.isReadable = false,
    this.prefixIcon,
    this.textInputType,
    this.onChange,
    this.onTap,
    this.suffixIcon,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Icon icon = const Icon(Icons.remove_red_eye);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * .08,
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(
          SizeConfig.kDefaultSize * 7,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 5,
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1,
            ),
            child: TextField(
              controller: widget.textEditingController,
              maxLines: widget.maxLines,
              textCapitalization: TextCapitalization.sentences,
              // contentPadding: EdgeInsets.all(20.0),

              decoration: InputDecoration(

                hintStyle: TextStyle(
                  fontSize: SizeConfig.kDefaultSize * 3.5,
                ),
                hintText: widget.hintText ?? '',
                // contentPadding: EdgeInsets.all( 20.w),
                border: InputBorder.none,
                prefixIconConstraints: BoxConstraints(
                  maxHeight: SizeConfig.kDefaultSize * 6,
                  maxWidth: SizeConfig.kDefaultSize * 6,
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: SizeConfig.kDefaultSize * 6,
                  maxWidth: SizeConfig.kDefaultSize * 6,
                ),
                prefixIcon: Padding(padding: EdgeInsets.only(right: 10),child: widget.prefixIcon,) ?? const SizedBox(),
                suffixIcon: widget.suffixIcon ?? const SizedBox(),

              ),
              onSubmitted: (_) {
                if (widget.onSubmitted != null) {
                  widget.onSubmitted(_);
                }
              },
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap();
                }
              },
              keyboardType: widget.textInputType ?? TextInputType.text,
              readOnly: widget.isReadable,
              onChanged: (_) {
                setState(() {});
                if (widget.onChange != null) {
                  widget.onChange(_);
                }
              },
              obscureText: widget.obsecure ? widget.obsecure : false,
              style: TextStyle(
                fontSize: SizeConfig.kDefaultSize * 4,
                color: widget.isReadable ? Constant.darkGreyColor : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
