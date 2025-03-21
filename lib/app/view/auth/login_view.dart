
import 'package:The_Book_Corporation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../controller/dashboard_controller.dart';
import '../../../core/config/app_images.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/Custom_gap.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_loader.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../custom_widgets/custom_text_form_field.dart';
import '../../../route/route_paths.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/widgets.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  bool showIcon = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<DashboardController>(
      builder: (context, dashboardController, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onDoubleTap: () {
              dashboardController.darkTheme1(
                  value: !dashboardController.darkTheme);
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,  // Start from the top
                  end: Alignment.topCenter, // End at the bottom
                  colors: [
                    primaryColor,
                    primaryColor,
                    primaryColorLight,
                    primaryColorSecond,

                  ],
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.only(left: 16, right: 16),
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
                  CustomGap(
                    height: size.height * 0.03,
                  ),
                  CustomText(
                    text: 'Login',
                    textAlign: TextAlign.start,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    darkTheme: dashboardController.darkTheme,
                  ),
                  const CustomGap(),
                  CustomText(
                    text: 'Enter credentials securely,accurately,and carefully. Protect your account with strong passwords. Stay safe!',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    darkTheme: dashboardController.darkTheme,
                  ),
                  CustomGap(
                    height: size.height * 0.04,
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.all(12),
                  //       decoration:   BoxDecoration(
                  //           color:dashboardController.darkTheme?null:Colors.white,
                  //           border: Border.all(width: 1,color: dashboardController.darkTheme==true?LocalThemes.darkThemeButtonContainerColor :primaryColor),
                  //           borderRadius: const BorderRadius.all(Radius.circular(7)),
                  //           boxShadow:dashboardController.darkTheme? [
                  //
                  //           ]:[
                  //             BoxShadow(
                  //                 spreadRadius: 1,
                  //                 blurRadius: 4,
                  //                 color: Colors.grey.withOpacity(0.5)
                  //             )
                  //           ]
                  //       ),
                  //       child:  Icon(MaterialCommunityIcons.account_supervisor_outline,color:dashboardController.darkTheme==true?LocalThemes.darkThemeButtonContainerColor :primaryColor ,),
                  //     ),
                  //     const CustomWidthGap(),
                  //     Expanded(
                  //       child:CustomDropdown(
                  //         list: const ['ADMIN'],
                  //         darkTheme: dashboardController.darkTheme,
                  //         hintText: 'Select Role',
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // CustomGap(
                  //   height: size.height * 0.02,
                  // ),
                  // CustomTextFormField(
                  //   hintText: 'Enter Mobile No.',
                  //   prefixIcon: Ionicons.call_outline,
                  //   darkTheme: dashboardController.darkTheme,
                  // ),
                  CustomTextFormField(
                    hintText: 'Enter Mobile No. / Email',
                    shadowColor: Colors.black12,
                    controller: emailController,
                    prefixIcon: MaterialIcons.alternate_email,
                    keyboardType: TextInputType.emailAddress,

                  ),
                  CustomGap(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: CustomTextFormField(
                      shadowColor: Colors.black12,
                      hintText:'Enter Password',
                      maxLines: 1,
                      controller: passwordController,
                      prefixIcon: Ionicons.lock_closed_outline,
                      obscureText: showIcon,

                      iconOnPressed: () {
                        setState(() {
                          showIcon = !showIcon;
                        });
                      },
                      suffixIcon: !showIcon ? Octicons.eye : Octicons.eye_closed,
                    ),
                  ),
                  CustomGap(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                        width: size.width * 0.05,
                        child: Checkbox(
                          activeColor: Colors.black87,
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
                        buttonTextColor: Colors.white,
                        onTap: () async{
                          if(emailController.text.isEmpty==true){
                              showSnackBar(
                                context: context,
                                text: 'Please Enter Email !!',
                                );
                              return ;
                          }else if(passwordController.text.isEmpty==true){
                            showSnackBar(
                                context: context,
                                text: 'Please Enter Password !!',
                               );
                            return ;
                          }else{
                            customLoader(context);
                          await context.read<AuthController>().login(context: context, email: emailController.text, password: passwordController.text);
                          }
                        },
                        text: 'Login',
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routs.register);
                },
                child: Row(
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
