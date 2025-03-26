import 'package:The_Book_Corporation/controller/user_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/Custom_gap.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_loader.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../custom_widgets/custom_text_form_field.dart';
import '../../../custom_widgets/custome_dropdown.dart';
import '../../../widgets/gradient_colors.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String role = '';
  bool showIcon = true;
  Future fetchRole() async {
    return await context.read<AuthController>().getRole(context: context);
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          children: [
            CustomGap(
              height: size.height * 0.05,
            ),
            const CustomText(
              text: 'Add User',
              textAlign: TextAlign.start,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            const CustomGap(),
            const CustomText(
              text:
                  "The user with the role of 'Admin' has the name 'publisher ', the email 'user@example.com', and the password 'user123'.",
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            Consumer<AuthController>(
              builder: (context, controller, child) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: primaryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 4,
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: Icon(
                        MaterialCommunityIcons.account_supervisor_outline,
                        color: primaryColor,
                      ),
                    ),
                    const CustomWidthGap(),
                    Expanded(
                      child: CustomDropdown(
                        list: controller.getRoleModel?.data?.map(
                          (e) {
                            return e.roleName;
                          },
                        ).toList(),
                        onChanged: (v) {
                          var id = controller.getRoleModel?.data?.firstWhere(
                            (element) {
                              return element.roleName == v;
                            },
                          ).roleId;

                          setState(() {
                            role = id.toString();
                          });
                        },
                        hintText: 'Select Role',
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
              controller: nameController,
              hintText: 'Enter Name',
              prefixIcon: Ionicons.ios_person_outline,
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            CustomTextFormField(
              controller: emailController,
              hintText: 'Enter Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: MaterialIcons.alternate_email,
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
            CustomTextFormField(
              controller: mobileController,
              hintText: 'Enter Mobile No.',
              maxLength: 10,
              prefixIcon: Zocial.call,
              shadowColor: Colors.black12,
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                height: size.height * 0.13,
                child: CustomTextFormField(
                  controller: addressController,
                  maxLines: null,
                  shadowColor: Colors.black12,
                  hintText: 'Enter Address...',
                  prefixIcon: Ionicons.home_outline,
                ),
              ),
            ),
            CustomGap(
              height: size.height * 0.03,
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
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: CustomButton(
                    onTap: () {
                      customLoader(context);
                      context.read<UserController>().addUser(
                          context: context,
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          roleId: role,
                          contact: mobileController.text,
                          address: addressController.text);
                    },
                    text: 'Add User',
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
  }
}
