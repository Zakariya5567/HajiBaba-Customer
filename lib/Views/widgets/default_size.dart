import 'package:flutter/material.dart';

import 'package:baba/utils/size_config.dart';

class DefaultSize extends StatelessWidget {
  const DefaultSize({
    Key key,
    this.size,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? SizeConfig.screenHeight * .02,
    );
  }
}
