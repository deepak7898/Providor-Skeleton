import 'package:flutter/cupertino.dart';



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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         ImageView(
          height: height,
          assetImage:AppImages.noDataFound ,
        ),
        CustomGap(
          height:size.height*0.01 ,
        ),
        const CustomText(
          text: 'No Data Found !',
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
