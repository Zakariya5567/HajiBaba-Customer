import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomWidget extends StatelessWidget {

  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular({
    this.width = double.infinity,
    this.height
  }): this.shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular({
    this.width = double.infinity,
    this.height,
    this.shapeBorder = const CircleBorder()
  });

  @override
  Widget build(BuildContext context)  => Shimmer.fromColors(
    baseColor:  Colors.blueGrey.withOpacity(0.25),
    highlightColor: Colors.blueGrey.withOpacity(0.1),
    period: const Duration(seconds: 2),
    direction: ShimmerDirection.btt,
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: shapeBorder,

      ),
    ),
  );
}