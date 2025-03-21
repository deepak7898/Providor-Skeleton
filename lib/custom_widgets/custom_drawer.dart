
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

import '../core/constant/colors.dart';
import '../route/route_paths.dart';
import 'Custom_gap.dart';
import 'custom_text.dart';
import '../widgets/gradient_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: backgroundGradient
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Column(
              children: [
                CustomGap(
                  height: size.height*0.03,
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: 'Admin',
                            fontSize: 14,
                          ),
                          CustomText(
                            text: 'admin@exmaple.com',
                            fontSize: 12,
                          ),
                        ],
                      )

                    ],
                  ),
                ),
                CustomGap(
                  height: size.height*0.03,
                ),
                 CustomRow(
                  onTap: () {
                    context.pushNamed(Routs.user);
                  },
                  title: 'User',
                  iconData: Icons.person,
                ),
                const CustomRow(
                  title: 'Profile',
                  iconData: Icons.precision_manufacturing,
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
                  child:  CustomText(
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
  const CustomRow({super.key,this.iconData,this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  Column(
      children: [
        GestureDetector(
        onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent)
              ),
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
                       child:  Icon(iconData,color:whiteColor ,),
                     ),
                     CustomGap(
                       width: size.width*0.07,
                     ),
                     CustomText(
                       text: title,
                       fontSize: 18,
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
  const CustomIconBox({super.key,this.iconData,this.onTap,this.backgroundColor,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: backgroundColor??primaryDarkColor,
        ),
        child:  Icon(iconData,color:iconColor??whiteColor ,size: 17,),
      ),
    );
  }
}


