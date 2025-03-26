import 'package:The_Book_Corporation/controller/subject_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/colors.dart';
import '../../../custom_widgets/Custom_gap.dart';
import '../../../custom_widgets/confirmation_dailog.dart';
import '../../../custom_widgets/custom_app_bar.dart';

import '../../../custom_widgets/custom_drawer.dart';
import '../../../custom_widgets/custom_only_loader.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../route/route_paths.dart';
import '../../../widgets/gradient_colors.dart';
import '../user_as_publisher/user.dart';
import 'add_subject.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({super.key});

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  Future fetchSubjectList({bool? isRefresh}) async {
    return await context.read<SubjectController>().getSubjectList(context: context,isRefresh:isRefresh );
  }

  // Future updateUser({required int id,String? status}) async {
  //   return await context.read<UserController>().updateUser(context: context, id: id, status: status??'').whenComplete(() {
  //     fetchUserList();
  //   },);
  // }
  // Future deleteUser({required int id,}) async {
  //   return await context.read<UserController>().deleteUser(context: context, id: id,).whenComplete(() {
  //     fetchUserList();
  //   },);
  // }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchSubjectList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Subject',
        showLeadingIcon: false,
      ),
        body: RefreshIndicator(
          color: whiteColor,
          backgroundColor: primaryColor,
          onRefresh: () async {

          },
          child: Consumer<SubjectController>(
            builder: (context, controller, child) {
              return  Container(
                  decoration: BoxDecoration(gradient: backgroundGradient),
                  child: controller.subjectLoader == false
                      ? const Center(child: OnlyLoader())
                      : ListView.builder(
                    itemCount: controller.getSubjectListModel?.data?.length,
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 80, right: 8, left: 8),
                    itemBuilder: (context, index) {
                      var data = controller.getSubjectListModel?.data?.elementAt(index);
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
                                          color: whiteColor,
                                        ),
                                        child: CustomText(
                                          text: data?.currentSession??'---:---',
                                          getTextColor:textColor,
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
                                                // deleteUser(id: data?.userId??0);
                                                context.pop();

                                              }, child: const CustomText(text: 'Delete',fontSize: 15,))

                                              );
                                            },
                                          ),
                                          const CustomWidthGap(),
                                          CustomIconBox(
                                            onTap: () async{
                                           await   context.pushNamed(Routs.addSubject,extra: AddSubject(
                                                editType:true ,
                                                district: data?.districtId,
                                                bookType: data?.bookType,
                                                bookId: data?.id.toString(),
                                                className: data?.classLevel,
                                                name: data?.name,
                                              ) );
                                            },
                                            iconData: Icons.edit,
                                            backgroundColor: whiteColor,
                                            iconColor: primaryColor,
                                          )
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
                                title: 'Class Level',
                                value: data?.classLevel,
                              ),
                              CustomRowBox(
                                title: 'District',
                                // value: data?.roleId.toString(),
                                value: data?.districtId??'---:---',
                              ),
                              CustomRowBox(
                                title: 'Book Type',
                                // value: data?.roleId.toString(),
                                value: data?.bookType??'---:---',
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ));
            },

          ),
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
                context.pushNamed(Routs.addSubject).whenComplete(
                      () {
                        fetchSubjectList();
                  },
                );
              },
              child: Icon(
                Icons.add,
                color: whiteColor,
                size: 45,
              )),
        ));

  }
}
