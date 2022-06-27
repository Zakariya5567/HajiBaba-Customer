import 'package:flutter/material.dart';

import 'package:baba/utils/size_config.dart';

class HeadingText extends StatelessWidget {
  final String title;
  const HeadingText({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      title,
      style: TextStyle(
        fontSize: SizeConfig.screenWidth * .05,
        fontWeight: FontWeight.bold,
        
      ),
      textAlign: TextAlign.center,
    );
  }
}
