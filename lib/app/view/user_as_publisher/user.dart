import 'package:The_Book_Corporation/core/constant/colors.dart';
import 'package:The_Book_Corporation/custom_widgets/Custom_gap.dart';
import 'package:The_Book_Corporation/custom_widgets/custom_app_bar.dart';
import 'package:The_Book_Corporation/custom_widgets/custom_circuler_icon.dart';

import 'package:The_Book_Corporation/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../controller/user_controller.dart';
import '../../../core/enum_model/enum_model.dart';
import '../../../custom_widgets/confirmation_dailog.dart';
import '../../../custom_widgets/custom_drawer.dart';
import '../../../custom_widgets/custom_only_loader.dart';
import '../../../custom_widgets/no_data_found.dart';
import '../../../route/route_paths.dart';
import '../../../services/database/local_database.dart';
import '../../../widgets/gradient_colors.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {

  Future fetchUserList({bool? isRefresh}) async {
    return await context.read<UserController>().getUserList(context: context,isRefresh:isRefresh );
  }

  Future updateUser({required int id,String? status}) async {
    return await context.read<UserController>().updateUser(context: context, id: id, status: status??'').whenComplete(() {
      fetchUserList();
    },);
  }
  Future deleteUser({required int id,}) async {
    return await context.read<UserController>().deleteUser(context: context, id: id,).whenComplete(() {
      fetchUserList();
    },);
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
    Size size = MediaQuery.of(context).size;
    LocalDatabase localDatabase =Provider.of<LocalDatabase>(context);

    return Consumer<UserController>(
      builder: (context, controller, child) {
        return Scaffold(
            appBar: const CustomAppBar(
              title: 'User',
              showLeadingIcon: false,
            ),
            body: RefreshIndicator(
              color: whiteColor,
              backgroundColor: primaryColor,
              onRefresh: () async {
                fetchUserList(isRefresh: true);
              },
              child: Container(
                  decoration: BoxDecoration(gradient: backgroundGradient),
                  child: controller.userLoader == false
                      ? const Center(child: OnlyLoader())
                      :controller.getUserModel?.data==null?const NoDataFound(): ListView.builder(
                          itemCount: controller.getUserModel?.data?.length,
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 80, right: 8, left: 8),
                          itemBuilder: (context, index) {

                            var data =
                                controller.getUserModel?.data?.elementAt(index);

                            return Padding(
                              padding: const EdgeInsets.only(bottom:10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black87.withOpacity(0.5),
                                          blurRadius: 4,
                                          spreadRadius: 1,
                                          offset: const Offset(0, 2))
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(7),
                                              topLeft: Radius.circular(7))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 3,
                                            bottom: 3),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 1,
                                                  bottom: 1),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7),
                                                color: data?.status == ApprovedAndReject.approved.value ? whiteColor : Colors.red,
                                              ),
                                              child: CustomText(
                                                text: data?.status,
                                                getTextColor:data?.status == ApprovedAndReject.approved.value? textColor:whiteColor,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                CustomIconBox(
                                                  iconData: Icons.delete,
                                                  backgroundColor: whiteColor,
                                                  iconColor: Colors.red,
                                                  onTap: () {
                                                    showConfirmationDialog(context: context, title: 'Delete User !!', description: 'Do you want to delete this user?', proceedButton:
                                                        TextButton(onPressed: () {
                                                          deleteUser(id: data?.userId??0);
                                                          context.pop();

                                                        }, child: const CustomText(text: 'Delete',fontSize: 15,))

                                                    );
                                                  },
                                                ),
                                                const CustomWidthGap(),
                                                PopupMenuButton(
                                                  clipBehavior: Clip.antiAlias,
                                                  onSelected: (value) async{

                                                    if(UserRoleExtension.fromInt(int.parse(localDatabase.getRole().toString() ?? '1')).roleName ==UserRoleComparison.admin.value){
                                                    }else{
                                                      updateUser(status:value,id: data?.userId??0 );
                                                    }
                                                    updateUser(status:value,id: data?.userId??0 );

                                                  },

                                                  // icon:CustomIconBox(iconData: Icons.edit,backgroundColor: whiteColor,iconColor: primaryColor,),
                                                  itemBuilder:
                                                      (BuildContext context) =>
                                                          <PopupMenuEntry>[
                                                      PopupMenuItem(
                                                        value:UserRoleExtension.fromInt(int.parse(
                                                            localDatabase.getRole().toString() ??
                                                                '1')).roleName ==UserRoleComparison.admin.value?'Approved':'Approve',
                                                        child:  Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Row(
                                                              children: [
                                                               CustomCircularIcon(
                                                                 icon: Feather.check,
                                                                 backgroundColor: primaryColor,
                                                               ),
                                                                const CustomWidthGap(),
                                                                CustomText(
                                                                  text: 'Approved',
                                                                  getTextColor:UserRoleExtension.fromInt(int.parse(
                                                                      localDatabase.getRole().toString() ??
                                                                          '1')).roleName ==UserRoleComparison.admin.value?Colors.grey:textColor ,
                                                                  fontSize: 14,
                                                                ),
                                                              ],
                                                            ),
                                                            const Divider()
                                                          ],
                                                        )),
                                                     const PopupMenuItem(
                                                        value:'Rejected',
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                CustomCircularIcon(
                                                                  icon: AntDesign.close,
                                                                  backgroundColor: Colors.red,
                                                                ),
                                                                 CustomWidthGap(),
                                                                CustomText(
                                                                  text:'Reject',
                                                                  fontSize: 14,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider()
                                                          ],
                                                        )),
                                                  ],
                                                  child: CustomIconBox(
                                                    iconData: Icons.edit,
                                                    backgroundColor: whiteColor,
                                                    iconColor: primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomRowBox(
                                      title: 'Name',
                                      value: data?.name,
                                    ),
                                    CustomRowBox(
                                      title: 'Email',
                                      value: data?.email,
                                    ),
                                    CustomRowBox(
                                      title: 'Role',
                                      // value: data?.roleId.toString(),
                                      value: data?.roleId == null
                                          ? '---:---'
                                          : UserRoleExtension.fromInt(int.parse(
                                                  data?.roleId.toString() ??
                                                      '1'))
                                              .roleName,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
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
                    context.pushNamed(Routs.addUser).whenComplete(
                      () {
                        fetchUserList();
                      },
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: whiteColor,
                    size: 45,
                  )),
            ));
      },
    );
  }
}

class CustomRowBox extends StatelessWidget {
  final String? title;
  final String? value;
  const CustomRowBox({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontSize: 13,
          ),
          CustomText(
            text: value,
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
