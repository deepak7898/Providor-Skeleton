
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../controller/dashboard_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/Custom_gap.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../custom_widgets/custom_text_form_field.dart';
import '../../../custom_widgets/custome_dropdown.dart';
import '../../../services/theme/theme_controller.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool showIcon = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Consumer<DashboardController>(
      builder: (context, dashboardController, child) {
        return Scaffold(
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
                // ImageView(
                //   assetImage: dashboardController.darkTheme == true
                //       ? AppImages.loginBannerGreen
                //       : AppImages.loginBanner,
                //   fit: BoxFit.cover,
                //   height: size.height * 0.33,
                // ),


                const CustomHeightGap(),
                CustomText(
                  text: 'Register',
                  textAlign: TextAlign.start,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  darkTheme: dashboardController.darkTheme,
                ),
                const CustomGap(),
                CustomText(
                  text: 'Register yourself by providing your name, mobile number, and other required details for verification.',
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  darkTheme: dashboardController.darkTheme,
                ),
                CustomGap(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration:   BoxDecoration(
                          color:dashboardController.darkTheme?null:Colors.white,
                          border: Border.all(width: 1,color: dashboardController.darkTheme==true?LocalThemes.darkThemeButtonContainerColor :primaryColor),
                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                          boxShadow:dashboardController.darkTheme? [

                          ]:[
                            BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 4,
                                color: Colors.grey.withOpacity(0.5)
                            )
                          ]
                      ),
                      child:  Icon(MaterialCommunityIcons.account_supervisor_outline,color:dashboardController.darkTheme==true?LocalThemes.darkThemeButtonContainerColor :primaryColor ,),
                    ),
                    const CustomWidthGap(),
                     Expanded(
                      child:CustomDropdown(
                        list: const ['ADMIN'],
                        darkTheme: dashboardController.darkTheme,
                        hintText: 'Select Admin',
                      ),
                    ),
                  ],
                ),
                CustomGap(
                  height: size.height * 0.03,
                ),
                CustomTextFormField(
                  hintText: 'Enter Name',
                  prefixIcon: Ionicons.ios_person_outline,
                  darkTheme: dashboardController.darkTheme,
                ),
                CustomGap(
                  height: size.height * 0.03,
                ),
                CustomTextFormField(
                  hintText: 'Enter Email',
                  prefixIcon: MaterialIcons.alternate_email,
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
                CustomTextFormField(
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
                CustomGap(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SizedBox(
                    height: size.height*0.13,
                    child: CustomTextFormField(
                      hintText: 'Enter Address',
                      prefixIcon: Ionicons.home_outline,
                      darkTheme: dashboardController.darkTheme,
                    ),
                  ),
                ),
                CustomGap(
                  height: size.height * 0.03,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       height: size.height * 0.02,
                //       width: size.width * 0.05,
                //       child: Checkbox(
                //         activeColor: dashboardController.darkTheme == true
                //             ? Colors.white
                //             : LocalThemes.lightTextColor,
                //         checkColor: Colors.white,
                //         shape: ContinuousRectangleBorder(
                //             borderRadius: BorderRadius.circular(4),
                //             side: const BorderSide(color: Colors.white)),
                //         value: true,
                //         onChanged: (value) {},
                //       ),
                //     ),
                //     const CustomWidthGap(),
                //     Expanded(
                //       child: CustomText(
                //         textAlign: TextAlign.start,
                //         fontSize: 12,
                //         darkTheme: dashboardController.darkTheme,
                //         fontWeight: FontWeight.w400,
                //         text:
                //         'Please accept the terms and conditions to proceed with your request.',
                //       ),
                //     )
                //   ],
                // ),
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
                          // context.pushNamed(Routs.dashBoard,extra:const Dashboard(name: 'Deepak Das Mahant',) );
                          context.pop();
                        },
                        text: 'Register',
                      ),
                    ),
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
