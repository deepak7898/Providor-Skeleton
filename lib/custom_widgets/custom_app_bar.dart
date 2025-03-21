
import 'package:The_Book_Corporation/widgets/gradient_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../core/constant/colors.dart';
import '../widgets/image_view.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final bool? showAction;
  final bool? showLeadingIcon;
  final double? fontSize;
  final bool? showActionLogo;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
   final void Function()? checkOnPress;
   final void Function()? leadingOnPress;
  const CustomAppBar( {super.key,
    this.title,
    this.showAction=false,
    this.showActionLogo=false,
    this.showLeadingIcon=false,
    this.checkOnPress,
    this.leadingOnPress,
    this.fontSize,
    this.bottom,
    this.actions,
});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      elevation: 3,
      leading: showLeadingIcon==false?null :IconButton(onPressed: () {
        Scaffold.of(context).openDrawer();
      },icon:const Icon(Icons.menu_sharp),color: textColor,),
      shadowColor: primaryColor,
      title:  CustomText(
        text: title,
      ),
      actions:actions?? [
        if(showAction==true)
         Padding(
          padding: const EdgeInsets.only(right:18),
          child: IconButton( color: Colors.white, onPressed: checkOnPress, icon: const Icon(AntDesign.check),),
        ),
        if(showActionLogo==true)
           Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ImageView(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const TestingDagsboadr()),
                // );
              },

            ),
          )


      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
         color: primaryColorLight
        ),
      ),
    );
  }
}
class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final bool? showAction;
  final double? fontSize;
  final bool? showActionLogo;
  final bool? showLeadingIcon;
  final PreferredSizeWidget? bottom;
   final void Function()? checkOnPress;
   final void Function()? leadingOnPress;
  const CustomAppBar1( {super.key,
    this.title,
    this.showAction=false,
    this.showActionLogo=false,
    this.checkOnPress,
    this.leadingOnPress,
    this.fontSize,
    this.bottom,
    this.showLeadingIcon=true});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      elevation: 3,
      automaticallyImplyLeading: showLeadingIcon??false,
      leading:showLeadingIcon==true?null: IconButton(
        icon: const Icon(Fontisto.arrow_left_l),
        onPressed:leadingOnPress?? () {

        },
      ),
      //     :Builder(
      //   builder: (context) {
      //     return IconButton(
      //       icon: const Icon(Icons.menu),
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //     );
      //   },
      // ),
      centerTitle: true,
      title:  CustomText1(
        text: title,
        textAlign: TextAlign.center,
        fontSize:fontSize?? 24,
        textColor: Colors.white,
      ),
      actions: [
        if(showAction==true)
         Padding(
          padding: const EdgeInsets.only(right:18),
          child: IconButton( color: Colors.white, onPressed: checkOnPress, icon: const Icon(AntDesign.check),),
        ),
        if(showActionLogo==true)
           Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ImageView(
              onTap: () {
              },
            ),
          )


      ],
      bottom: bottom,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue.shade800,
            // Colors.blue.shade400,
            Colors.blue.shade200
          ]),
        ),
      ),
    );
  }
}
