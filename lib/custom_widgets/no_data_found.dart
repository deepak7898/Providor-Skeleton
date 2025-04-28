import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';



import '../../../core/config/app_images.dart';
import '../widgets/image_view.dart';
import 'Custom_gap.dart';
import 'custom_text.dart';

class NoDataFound extends StatelessWidget {
 final double? height;
  const NoDataFound({super.key,this.height});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppImages.noDataFound,height: size.height*0.14,fit: BoxFit.contain,width: double.infinity),

        const CustomText(
          text: 'No Data Found !!',
          fontWeight: FontWeight.w500,
        ),

        CustomGap(
          height: size.height*0.2,
        )
      ],
    );
  }
}
