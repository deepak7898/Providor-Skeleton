import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/config/app_images.dart';
import '../../../custom_widgets/Custom_gap.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../route/route_paths.dart';
import '../../../services/database/local_database.dart';
import '../../../widgets/gradient_colors.dart';
import '../../../widgets/image_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.read<LocalDatabase>().getIsLogin()==true?context.pushReplacement(Routs.dashBoard):context.pushReplacement(Routs.onBoarding)
        ;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: backgroundGradient
          ),
          child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.antiAlias,
                children: [
          const ImageView(
            assetImage: AppImages.splashImage,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CustomText(
                text: 'TBC',
                darkTheme: true,
                fontSize: 30,
              ),
              SizedBox(
                width: size.width * 0.65,
                child: const CustomText(
                  text:
                      'Training Name; Training Date; Duration (days and Hours); Objectives; Discription; Location Training Coordinator’s Name and Contact No.',
                  fontSize: 9,
                  darkTheme: true,
                ),
              ),
              CustomGap(
                height: size.height * 0.02,
              ),
            ],
          )
                ],
              ),
        ));
  }
}
