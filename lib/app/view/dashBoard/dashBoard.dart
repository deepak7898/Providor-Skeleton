
import 'package:flutter/material.dart';



import 'package:provider/provider.dart';

import '../../../custom_widgets/custom_app_bar.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../services/database/local_database.dart';
import '../../../custom_widgets/custom_drawer.dart';
import '../../../widgets/gradient_colors.dart';

class Dashboard extends StatefulWidget {
  final String? name;
  const Dashboard({super.key, this.name});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<LocalDatabase>().setIsLogin(isLogin: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        showLeadingIcon: true,
        title: 'THE BOOK CORPORATION',
      ),
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: const Center(
          child: CustomText(
            text: 'DashBoard',
          ),
        ),
      ),
      // bottomSheet: Padding(
      //   padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
      //   child: Container(
      //     padding: EdgeInsets.only(left: 7,right: 7,bottom: 13,top: 13),
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(5),
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.topRight,
      //             colors: [
      //               primaryColorSecond,
      //               primaryColor,
      //               primaryColor,
      //               primaryColor,
      //               primaryColorSecond,
      //
      //             ]),
      //         boxShadow: [
      //           BoxShadow(
      //               color: Colors.black87.withOpacity(0.5),
      //               blurRadius: 4,
      //               spreadRadius: 1,
      //               offset: const Offset(0, 2))
      //         ],
      //         color: primaryColorSecond),
      //     child: const Row(
      //       children: [
      //         Expanded(child: CustomBottomBar(
      //           icon: MaterialCommunityIcons.file_send_outline,
      //           title: "Assign",
      //           onTab: false,
      //         )),
      //         Expanded(
      //             child: CustomBottomBar(icon: Icons.person,title: 'Assign',    onTab: true,)),
      //         Expanded(
      //             child: CustomBottomBar(icon: Icons.person,title: "User",    onTab: false,)),
      //         Expanded(
      //             child: CustomBottomBar(icon: Icons.person,title: "User",    onTab: false,)),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
class CustomBottomBar extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final bool? onTab;

  const CustomBottomBar({
    super.key,
    this.icon,
    this.title,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
    padding: EdgeInsets.only(top: 7,bottom: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: onTab == false ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: onTab == false
              ? null
              : const BorderRadius.all(Radius.circular(25)),
        ),
        child: onTab == false
            ? Icon(
          icon,
          size: 25,
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding:const EdgeInsets.only(left: 2),child:  Icon(
              icon,
              size: 20,
            ),),
            const SizedBox(width: 6),
            Padding(padding: const EdgeInsets.only(right: 2),child:     CustomText(
              text: title,
              fontSize: 12,
              getTextColor: textColor,
            ),)

          ],
        ),
      ),
    );
  }
}



