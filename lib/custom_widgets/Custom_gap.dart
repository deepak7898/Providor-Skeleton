import 'package:flutter/cupertino.dart';

class CustomGap extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomGap({
    this.height,
    this.width,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      height: height??size.height*0.01,
      width: width??size.width*0.02,
    );
  }
}
class CustomHeightGap extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomHeightGap({
    this.height,
    this.width,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      height:size.height*0.02,
    );
  }
}
class CustomWidthGap extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomWidthGap({
    this.height,
    this.width,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      width:size.width*0.02,
    );
  }
}