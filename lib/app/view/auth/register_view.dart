
import 'package:The_Book_Corporation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import '../../../controller/dashboard_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/Custom_gap.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_loader.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../custom_widgets/custom_text_form_field.dart';
import '../../../custom_widgets/custome_dropdown.dart';
import '../../../services/theme/theme_controller.dart';
import '../../../widgets/gradient_colors.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}
class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController mobileController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController addressController =TextEditingController();
  bool showIcon = true;
  String ? role ='';

  Future fetchRole() async {
    return await context
        .read<AuthController>()
        .getRole(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // sectionNo = widget.sectionNo;
      fetchRole();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Consumer<DashboardController>(
      builder: (context, dashboardController, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onDoubleTap: () {
              dashboardController.darkTheme1(value: !dashboardController.darkTheme);
            },
            child: Container(
              decoration: BoxDecoration(
                gradient:backgroundGradient,
              ),
              child: ListView(
                padding: const EdgeInsets.only(left: 16, right: 16),
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
                    text:'Register',
                    textAlign: TextAlign.start,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    darkTheme: dashboardController.darkTheme,
                  ),
                  const CustomGap(),
                  CustomText(
                    text:'Register yourself by providing your name, mobile number, and other required details for verification.',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    darkTheme: dashboardController.darkTheme,
                  ),
                  CustomGap(
                    height: size.height * 0.03,
                  ),
                  Consumer<AuthController>(
                    builder: (context, controller, child) {
                      return  Row(
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
                              list:controller.getRoleModel?.data?.map((e) {
                                return e.roleName;
                              },).toList(),
                              onChanged: (v) {
                               var id  =  controller.getRoleModel?.data?.firstWhere((element) {
                                  return element.roleName==v;
                                },).roleId;
                                setState(() {
                                  role=id.toString();
                                });
                              },
                              darkTheme: dashboardController.darkTheme,
                              hintText: 'Select Admin',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  CustomGap(
                    height: size.height * 0.03,
                  ),
                  CustomTextFormField(
                    controller:nameController ,
                    hintText: 'Enter Name',
                    prefixIcon: Ionicons.ios_person_outline,
                    darkTheme: dashboardController.darkTheme,
                  ),
                  CustomGap(
                    height: size.height * 0.03,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter Email',
                    controller:emailController ,
                    prefixIcon: MaterialIcons.alternate_email,
                    darkTheme: dashboardController.darkTheme,
                  ),
                  CustomGap(
                    height: size.height * 0.03,
                  ),
                  CustomTextFormField(
                    controller:mobileController ,
                    hintText: 'Enter Mobile No.',
                    prefixIcon: Zocial.call,
                    darkTheme: dashboardController.darkTheme,
                  ),
                  CustomGap(
                    height: size.height * 0.03,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    shadowColor: Colors.black12,
                    hintText: 'Enter Password',
                    maxLines: 1,
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
                        maxLines: null,
                        shadowColor: Colors.black12,
                        controller: addressController,
                        hintText: 'Enter Address...',
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
                        onTap: () {
                          // context.pushNamed(Routs.dashBoard,extra:const Dashboard(name: 'Deepak Das Mahant',) );
                          customLoader(context);
                          context.read<AuthController>().register(
                              context: context,
                              name: nameController.text, email: emailController.text,
                              password: passwordController.text, roleId: '1', contact: mobileController.text, address: addressController.text);

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
