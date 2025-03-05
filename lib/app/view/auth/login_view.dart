
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teacherTMS/core/config/app_images.dart';
import 'package:teacherTMS/custom_widgets/Custom_gap.dart';
import 'package:teacherTMS/custom_widgets/custom_button.dart';
import 'package:teacherTMS/custom_widgets/custom_text.dart';
import 'package:teacherTMS/services/theme/theme_controller.dart';
import 'package:teacherTMS/widgets/image_view.dart';
import '../../../controller/dashboard_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/custom_text_form_field.dart';
import '../../../route/route_paths.dart';
import '../dashBoard/dashBoard.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  bool showIcon = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<DashboardController>(
      builder: (context, dashboardController, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: dashboardController.darkTheme == false
              ? Colors.white
              : darkThemeApp,
          body: GestureDetector(
            onDoubleTap: () {
              dashboardController.darkTheme1(
                  value: !dashboardController.darkTheme);
            },
            child: ListView(
              padding: const EdgeInsets.only(left: 16, right: 16),
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomGap(
                  height: size.height * 0.05,
                ),
                ImageView(
                  assetImage: dashboardController.darkTheme == true
                      ? AppImages.loginBannerGreen
                      : AppImages.loginBanner,
                  fit: BoxFit.cover,
                  height: size.height * 0.33,
                ),
                const CustomHeightGap(),
                CustomText(
                  text: 'Login',
                  textAlign: TextAlign.start,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  darkTheme: dashboardController.darkTheme,
                ),
                const CustomGap(),
                CustomText(
                  text: 'Enter credentials securely, accurately, and carefully. Protect your account with strong passwords. Stay safe!',
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  darkTheme: dashboardController.darkTheme,
                ),
                CustomGap(
                  height: size.height * 0.03,
                ),
                CustomTextFormField(
                  hintText: 'Enter Mobile No.',
                  prefixIcon: Zocial.call,
                  darkTheme: dashboardController.darkTheme,
                ),
                CustomGap(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: CustomTextFormField(
                    hintText: 'Enter Password',
                    prefixIcon: Ionicons.lock_closed_outline,
                    obscureText: showIcon,
                    darkTheme: dashboardController.darkTheme,
                    iconOnPressed: () {
                      setState(() {
                        showIcon = !showIcon;
                      });
                    },
                    suffixIcon: !showIcon ? Octicons.eye : Octicons.eye_closed,
                  ),
                ),
                CustomGap(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                      width: size.width * 0.05,
                      child: Checkbox(
                        activeColor: dashboardController.darkTheme == true
                            ? Colors.white
                            : LocalThemes.lightTextColor,
                        checkColor: Colors.white,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(color: Colors.white)),
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    const CustomWidthGap(),
                    Expanded(
                      child: CustomText(
                        textAlign: TextAlign.start,
                        fontSize: 12,
                        darkTheme: dashboardController.darkTheme,
                        fontWeight: FontWeight.w400,
                        text:
                            'Please accept the terms and conditions to proceed with your request.',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          bottomSheet: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 10),
                      child: CustomButton(
                        containerColor: primaryColor,
                        buttonTextColor: Colors.white,
                        darkTheme: dashboardController.darkTheme,
                        onTap: () {
                          context.pushNamed(Routs.dashBoard,extra:Dashboard(name: 'Deepak Das Mahant',) );
                        },
                        text: 'Login',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don't have an account ?",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    darkTheme: dashboardController.darkTheme,
                  ),
                  const CustomWidthGap(),
                  CustomText(
                    text: 'SignUp',
                    fontSize: 17,
                    darkTheme: dashboardController.darkTheme,
                  ),
                ],
              ),
              CustomGap(
                height: size.height * 0.02,
              ),
            ],
          ),
        );
      },
    );
  }
}
