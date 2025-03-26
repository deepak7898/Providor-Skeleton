import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../core/constant/colors.dart';

class OnlyLoader extends StatelessWidget {
  final Color? color;
  final double? radius;
  const OnlyLoader({super.key, this.color, this.radius});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return   LoadingAnimationWidget.fourRotatingDots(
      color: primaryDarkColor,
      size:size.height*0.04 ,
    );
  }
}