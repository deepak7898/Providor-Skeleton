import 'package:The_Book_Corporation/core/constant/colors.dart';
import 'package:The_Book_Corporation/custom_widgets/custom_app_bar.dart';
import 'package:The_Book_Corporation/custom_widgets/custom_loader.dart';
import 'package:The_Book_Corporation/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../controller/user_controller.dart';
import '../../../custom_widgets/custom_drawer.dart';
import '../../../custom_widgets/custom_only_loader.dart';
import '../../../route/route_paths.dart';
import '../../../widgets/gradient_colors.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {

  Future fetchUserList() async {
    return await context
        .read<UserController>()
        .getUserList(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      fetchUserList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<UserController>(
      builder: (context, controller, child) {
        return Scaffold(
            appBar: const CustomAppBar(
              title: 'User',
            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: backgroundGradient
              ),
              child:controller.userLoader==false?const Center(child: OnlyLoader()):ListView.builder(
                itemCount: controller.getUserModel?.data?.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  var data =controller.getUserModel?.data?.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(

                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: const Offset(0,2)
                            )
                          ]
                      ),
                      child:Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color:primaryColor,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(7),topLeft: Radius.circular(7))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: whiteColor,
                                    ),
                                    child: CustomText(
                                      text:data?.status,
                                      getTextColor: textColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                  CustomIconBox(iconData: Icons.edit,backgroundColor: whiteColor,iconColor: primaryColor,)
                                ],
                              ),
                            ),
                          ),
                          CustomRow(
                            title: 'Name',
                            value: data?.name,
                          ),
                          CustomRow(
                            title: 'email',
                            value: data?.email,
                          ),
                          CustomRow(
                            title: 'Role',
                            value: data?.roleId.toString(),
                          )


                        ],
                      ),
                    ),
                  );
                },)
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(10),
              child: FloatingActionButton(
                  backgroundColor: primaryDarkColor,
                  elevation: 10,
                  hoverColor: Colors.black87,
                  disabledElevation: 10,
                  hoverElevation: 10,
                  onPressed: () {
                    context.pushNamed(Routs.addUser);
                  },
                  child:  Icon(Icons.add,color: whiteColor,size: 45,)

              ),
            )
        );
      },

    );
  }
}
class CustomRow extends StatelessWidget {
 final  String? title;
 final String? value;
  const CustomRow({super.key,this.title,this.value});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 5,bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text:title,
            fontSize: 13,
          ),
          CustomText(
            text:value,
            fontSize: 13,
          ),

        ],
      ),
    );
  }
}

