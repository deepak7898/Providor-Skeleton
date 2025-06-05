import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/constant/colors.dart';
import '../route/route_paths.dart';
import '../services/database/local_database.dart';
import '../widgets/widgets.dart';
import 'Custom_gap.dart';
import 'custom_text.dart';
import '../widgets/gradient_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LocalDatabase localDatabase =Provider.of<LocalDatabase>(context);
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width*0.66,
      child: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomGap(
                  height: size.height * 0.03,
                ),
                Container(
                  color: primaryDarkColor,
                  padding: const EdgeInsets.all(7),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(Fontisto.person),
                      ),
                      const CustomWidthGap(),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: localDatabase.box.read('name'),
                            fontSize: 14,
                          ),
                          CustomText(
                            text: localDatabase.box.read('email'),
                            fontSize: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CustomGap(
                  height: size.height * 0.03,
                ),
                // CustomRow(
                //   onTap: () {
                //     context.pushNamed(Routs.publisher);
                //   },
                //   title: 'Assign Publisher',
                //   iconData: MaterialCommunityIcons.file_send_outline,
                // ),
                //
                // CustomRow(
                //   onTap: () {
                //     context.pushNamed(Routs.user);
                //   },
                //   title: 'User',
                //   iconData: Icons.person,
                // ),
                //
                // CustomRow(
                //   onTap: () {
                //     context.pushNamed(Routs.subjectList);
                //   },
                //   title: 'Subject',
                //   iconData: Feather.book,
                // ),
                //  CustomRow(
                //   title: 'Order History',
                //   onTap: () {
                //     context.pushNamed(Routs.orderHistory);
                //   },
                //   iconData: MaterialCommunityIcons.history,
                // ),

                 if(localDatabase.box.read('role').toString()=='1')
                 CustomRow(
                  title: 'Scan ISBN',
                  onTap: () {
                    context.pushNamed(Routs.ISBNDetailsByScanScreen);
                  },
                  iconData: MaterialCommunityIcons.history,
                ),
                CustomRow(
                  onTap: () {
                    showSnackBar(
                        context: context, text: 'Log Out !!', color: textColor);
                    context.go(Routs.loginView);
                  },
                  title: 'Log Out',
                  iconData: Ionicons.log_out_outline,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: 'TBC 📚',
                  getTextColor: textColor,
                  fontSize: 30,
                ),
                SizedBox(
                  width: size.width * 0.65,
                  child: CustomText(
                    getTextColor: textColor,
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
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final void Function()? onTap;
  const CustomRow({super.key, this.iconData, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: primaryDarkColor,
                        ),
                        child: Icon(
                          iconData,
                          size: 18,
                          color: whiteColor,
                        ),
                      ),
                      CustomGap(
                        width: size.width * 0.07,
                      ),
                      CustomText(
                        text: title,
                        fontSize: 16,
                      )
                    ],
                  ),
                  Icon(
                    color: textColor,
                    CupertinoIcons.right_chevron,
                    size: 12,
                  )
                ],
              ),
            ),
          ),
        ),
        Divider(
          color: primaryDarkColor,
        ),
      ],
    );
  }
}

class CustomIconBox extends StatelessWidget {
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? iconColor;
  final void Function()? onTap;
  const CustomIconBox(
      {super.key,
      this.iconData,
      this.onTap,
      this.backgroundColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: backgroundColor ?? primaryDarkColor,
        ),
        child: Icon(
          iconData,
          color: iconColor ?? whiteColor,
          size: 17,
        ),
      ),
    );
  }
}
