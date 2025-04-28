import 'package:The_Book_Corporation/custom_widgets/custom_text.dart';
import 'package:The_Book_Corporation/custom_widgets/custome_dropdown.dart';
import 'package:The_Book_Corporation/custom_widgets/no_data_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/publisher_controller.dart';
import '../../../controller/subject_controller.dart';
import '../../../core/config/api_config.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/Custom_gap.dart';
import '../../../custom_widgets/confirmation_dailog.dart';
import '../../../custom_widgets/custom_app_bar.dart';
import '../../../custom_widgets/custom_drawer.dart';
import '../../../custom_widgets/custom_loader.dart';
import '../../../custom_widgets/custom_only_loader.dart';

import '../../../widgets/gradient_colors.dart';
import '../../../widgets/widgets.dart';
import '../../model/publisher_model/getIsbnBarCode.dart';
import '../../model/publisher_model/publisherModel.dart';
import '../user_as_publisher/user.dart';

class Publisher extends StatefulWidget {
  const Publisher({super.key});

  @override
  State<Publisher> createState() => _PublisherState();
}

class _PublisherState extends State<Publisher> {
  Future fetchSubjectList({bool? isRefresh}) async {
    return await context
        .read<SubjectController>()
        .getSubjectList(context: context, isRefresh: isRefresh);
  }

  getName({int? id}) {
    PublisherModel? model = context.read<PublisherController>().publisherModel;
    if (model?.data == null || id == null) {
      return '';
    }
    String? name = model?.data?.firstWhere(
          (element) {
            return element.userId == id;
          },
        ).name ??
        '';
    return name;
  }

  Future fetchPublisherList({bool? isRefresh, int? id}) async {
    return await context.read<PublisherController>().getPublisherList(
          context: context,
          isRefresh: isRefresh,
        );
  }


  void downloadImage({String? imageUrl}) async {
    Uri url = Uri.parse(imageUrl??"");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $imageUrl';
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchSubjectList();
      fetchPublisherList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PublisherController publisherController =
        Provider.of<PublisherController>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Assign Publisher',
        showLeadingIcon: false,
      ),
      body: RefreshIndicator(
        color: whiteColor,
        backgroundColor: primaryColor,
        onRefresh: () async {
          // fetchSubjectList(isRefresh: true);
        },
        child: RefreshIndicator(
          color: whiteColor,
          backgroundColor: primaryColor,
          onRefresh: () async {
            fetchSubjectList(isRefresh: true);
          },
          child: Consumer<SubjectController>(
            builder: (context, controller, child) {
              return Container(
                  decoration: BoxDecoration(gradient: backgroundGradient),
                  child: controller.subjectLoader == false
                      ? const Center(child: OnlyLoader())
                      : controller.getSubjectListModel?.data== null
                          ? const NoDataFound()
                          : ListView.builder(
                              itemCount: controller.getSubjectListModel?.data?.length,
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 80, right: 8, left: 8),
                              itemBuilder: (context, index) {
                                var data = controller.getSubjectListModel?.data
                                    ?.elementAt(index);
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black87
                                                  .withOpacity(0.5),
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                              offset: const Offset(0, 2))
                                        ]),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(7),
                                                      topLeft:
                                                          Radius.circular(7))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 3,
                                                bottom: 3),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                          top: 1,
                                                          bottom: 1),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    color: whiteColor,
                                                  ),
                                                  child: CustomText(
                                                    text:
                                                        '#${data?.id.toString()}',
                                                    getTextColor: textColor,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    CustomIconBox(
                                                      iconData: Icons.delete,
                                                      backgroundColor:
                                                          whiteColor,
                                                      iconColor: Colors.red,
                                                      onTap: () {
                                                        showConfirmationDialog(
                                                            context: context,
                                                            title:
                                                                'Delete Subject !!',
                                                            description:
                                                                'Do you want to delete this subject?',
                                                            proceedButton:
                                                                TextButton(
                                                                    onPressed:
                                                                        () async {
                                                                      await context.read<PublisherController>().deleteUser(context: context, id: data?.assignmentId ?? 0,
                                                                          )
                                                                          .whenComplete(
                                                                        () {
                                                                          fetchSubjectList();
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        const CustomText(
                                                                      text:
                                                                          'Delete',
                                                                      fontSize:
                                                                          15,
                                                                    )));
                                                      },
                                                    ),
                                                    const CustomWidthGap(),
                                                    CustomIconBox(
                                                      onTap: () async {
                                                        String? publisherID =
                                                            '';
                                                        String? session = '';
                                                        showCustomDialog(
                                                          context: context,
                                                          subjectName:
                                                              data?.name ?? '',
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              CustomDropdown(
                                                                list: publisherController
                                                                    .publisherModel
                                                                    ?.data
                                                                    ?.map(
                                                                  (e) {
                                                                    return e
                                                                        .name;
                                                                  },
                                                                ).toList(),
                                                                onChanged: (v) {
                                                                  publisherID = publisherController
                                                                          .publisherModel
                                                                          ?.data
                                                                          ?.firstWhere(
                                                                            (element) {
                                                                              return element.name == v;
                                                                            },
                                                                          )
                                                                          .userId
                                                                          .toString() ??
                                                                      '';
                                                                },
                                                                hintText:
                                                                    'Select Publisher',
                                                                showSearchBox:
                                                                    true,
                                                              ),
                                                              const CustomHeightGap(),
                                                              CustomDropdown(
                                                                list: [
                                                                  DateTime.now()
                                                                      .year,
                                                                  DateTime.now()
                                                                          .year +
                                                                      1
                                                                ],
                                                                hintText:
                                                                    'Select Session',
                                                                onChanged: (v) {
                                                                  session = v
                                                                      .toString();
                                                                },
                                                                showSearchBox:
                                                                    true,
                                                              ),
                                                            ],
                                                          ),
                                                          onPressed: () async {
                                                            customLoader(
                                                                context);
                                                            await context
                                                                .read<
                                                                    PublisherController>()
                                                                .subjectAssigned(
                                                                  context:
                                                                      context,
                                                                  subjectId: data
                                                                      ?.id
                                                                      .toString(),
                                                                  publisherId:
                                                                      publisherID,
                                                                  classLevel: data
                                                                      ?.classLevel,
                                                                  session:
                                                                      session,
                                                                )
                                                                .whenComplete(
                                                              () {
                                                                fetchSubjectList();
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                      iconData: Icons.add,
                                                      backgroundColor:
                                                          whiteColor,
                                                      iconColor: primaryColor,
                                                    ),
                                                    const CustomWidthGap(),
                                                    if (data?.assignmentId != null)
                                                      CustomIconBox(
                                                        onTap: () async {

                                                          customLoader(context);
                                                          await context.read<PublisherController>().generateISBN(
                                                            context: context,
                                                            id: data?.assignmentId.toString(),
                                                          ).whenComplete(() {
                                                            fetchSubjectList();
                                                          },);

                                                        },
                                                        iconData: Ionicons
                                                            .qr_code_outline,
                                                        backgroundColor:
                                                            whiteColor,
                                                        iconColor: primaryColor,
                                                      ),
                                                    if (data?.bookIsbnPath
                                                        ?.isNotEmpty ==
                                                        true)
                                                    const CustomWidthGap(),
                                                    if (data?.bookIsbnPath?.isNotEmpty == true)
                                                    CustomIconBox(
                                                      onTap: () async {
                                                        GetIsbnBarCode?
                                                            getIsbnBarCodeModel =
                                                            await context.read<PublisherController>().getIsbnBarcode(
                                                                    context: context,
                                                                    assignmentId: '${data?.assignmentId}');
                                                        if(getIsbnBarCodeModel?.barcodePath?.isNotEmpty==true){
                                                          downloadImage(imageUrl:'${ApiConfig.forImage}${getIsbnBarCodeModel?.barcodePath}') ;
                                                        }else{
                                                          showSnackBar(
                                                              context: context,
                                                              text:'Barcode image not found !!',
                                                              color: textColor);
                                                        }

                                                      },
                                                      iconData: Entypo.arrow_with_circle_down,
                                                      backgroundColor:
                                                          whiteColor,
                                                      iconColor: primaryColor,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        CustomRowBox(
                                          title: 'Subject',
                                          value: data?.name,
                                        ),
                                        CustomRowBox(
                                          title: 'Class Level',
                                          value: data?.classLevel,
                                        ),
                                        CustomRowBox(
                                          title: 'District',

                                          value: data?.districtId ==null? '---:---':data?.districtId.toString(),
                                        ),
                                        CustomRowBox(
                                          title: 'Book Type',

                                          value: data?.bookType ?? '---:---',
                                        ),
                                        CustomRowBox(
                                          title: 'Publisher',

                                          value: getName(id: data?.publisherId)
                                                      .toString()
                                                      .isEmpty ==
                                                  true
                                              ? '---:---'
                                              : getName(id: data?.publisherId),
                                        ),
                                        CustomRowBox(
                                          title: 'Session',
                                          value:
                                              data?.currentSession ?? '---:---',
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ));
            },
          ),
        ),
      ),
    );
  }
}
