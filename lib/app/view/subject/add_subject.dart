import 'package:The_Book_Corporation/controller/common_controller.dart';
import 'package:The_Book_Corporation/controller/subject_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/Custom_gap.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_loader.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../custom_widgets/custom_text_form_field.dart';
import '../../../custom_widgets/custome_dropdown.dart';
import '../../../widgets/gradient_colors.dart';

class AddSubject extends StatefulWidget {
  final int? bookId;
  final bool? editType;
  final String? name;
  final String? className;
  final String? mediumName;
  final String? district;
  final String? bookType;
  const AddSubject(
      {super.key,
      this.bookId,
      this.name,
      this.className,
      this.district,
      this.bookType,
      this.mediumName,
      this.editType = false});
  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  TextEditingController subjectNameController = TextEditingController();
  TextEditingController bookTypeController = TextEditingController();
  String? district = '';
  String? districtEdit = '';
  String? className = '';
  String? medium = '';
  String? mediumEdit = '';

  Future fetchDistrictList({bool? isRefresh}) async {
    return await context
        .read<CommonController>()
        .getsDistrictList(context: context, isRefresh: isRefresh);
  }

  Future fetchMediumList({bool? isRefresh}) async {
    return await context
        .read<CommonController>()
        .getsMediumList(context: context, isRefresh: isRefresh);
  }
  Future<String?> getDistrict({required String districtId}) async {
    final districtModel = context.read<CommonController>().getDistrictModel;

    if (districtModel?.data != null) {
      try {
        return districtModel!.data!
            .firstWhere((element) => element.districtCd== districtId)
            .districtName;
      } catch (e) {
        debugPrint("Medium not found: $e");
      }
    }
    return null;
  }



  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchDistrictList();
      fetchMediumList();
      if (widget.editType == true) {
        subjectNameController.text = widget.name ?? '';
        bookTypeController.text = widget.bookType ?? '';
        className = widget.className;
        district = widget.district;
        districtEdit =await getDistrict(districtId:widget.district??"" );
        mediumEdit =  widget.mediumName;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CommonController commonController = Provider.of<CommonController>(context);
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
              text: 'Add Subject',
              textAlign: TextAlign.start,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            const CustomGap(),
            const CustomText(
              text: "The user with the role of 'Admin' has the subject 'Hindi', the book type 'Study', and select class name 11,and district 'Korba'.",
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: primaryColor),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: Icon(
                    MaterialCommunityIcons.google_classroom,
                    color: primaryColor,
                  ),
                ),
                const CustomWidthGap(),
                Expanded(
                  child: widget.editType == true
                      ? CustomDropdown(
                          selectedItem: className,
                          list: const [
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10'
                          ],
                          onChanged: (v) {
                            className = v;
                            setState(() {});
                          },
                          hintText: 'Select Class',
                        )
                      : CustomDropdown(
                          list: const [
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10'
                          ],
                          onChanged: (v) {
                            className = v;
                            setState(() {});
                          },
                          hintText: 'Select Class',
                        ),
                ),
              ],
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: primaryColor),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: Icon(
                    Entypo.medium,
                    color: primaryColor,
                  ),
                ),
                const CustomWidthGap(),
                Expanded(
                    child: widget.editType == true
                        ? CustomDropdown(
                            selectedItem: mediumEdit,
                            list: commonController.getMediumModel?.data?.map(
                              (e) {
                                return e.mediumName;
                              },
                            ).toList(),
                            onChanged: (v) {
                              medium = commonController.getMediumModel?.data
                                  ?.firstWhere(
                                    (element) {
                                      return element.mediumName == v;
                                    },
                                  )
                                  .mediumCd
                                  .toString();
                              mediumEdit=v;

                              setState(() {});
                            },
                            hintText: 'Select Medium',
                          )
                        : CustomDropdown(
                            list: commonController.getMediumModel?.data?.map(
                              (e) {
                                return e.mediumName;
                              },
                            ).toList(),
                            onChanged: (v) {
                              medium = commonController.getMediumModel?.data
                                  ?.firstWhere(
                                    (element) {
                                      return element.mediumName == v;
                                    },
                                  )
                                  .mediumCd
                                  .toString();

                              setState(() {});
                            },
                            hintText: 'Select Medium',
                          )),
              ],
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: primaryColor),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: Icon(
                    Feather.home,
                    color: primaryColor,
                  ),
                ),
                const CustomWidthGap(),
                Expanded(
                    child: widget.editType == true
                        ? CustomDropdown(
                            selectedItem: districtEdit,
                            list: commonController.getDistrictModel?.data?.map(
                              (e) {
                                return e.districtName;
                              },
                            ).toList(),
                            onChanged: (v) {
                              district = commonController.getDistrictModel?.data
                                  ?.firstWhere(
                                (element) {
                                  return element.districtName == v;
                                },
                              ).districtCd;   districtEdit = v;

                              setState(() {});
                            },
                            hintText: 'Select District',
                          )
                        : CustomDropdown(
                            list: commonController.getDistrictModel?.data?.map(
                              (e) {
                                return e.districtName;
                              },
                            ).toList(),
                            onChanged: (v) {
                              district = commonController.getDistrictModel?.data
                                  ?.firstWhere(
                                (element) {
                                  return element.districtName == v;
                                },
                              ).districtCd;

                              setState(() {});
                            },
                            hintText: 'Select District',
                          )),
              ],
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            CustomTextFormField(
              controller: subjectNameController,
              hintText: 'Enter Subject Name',
              maxLines: 1,
              prefixIcon: MaterialIcons.subject,
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: CustomTextFormField(
                controller: bookTypeController,
                hintText: 'Enter Book Type',
                maxLines: 1,
                prefixIcon: Feather.book,
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
                      if (widget.editType == true) {
                        context.read<SubjectController>().editSubject(
                            context: context,
                            id: widget.bookId ?? 0,
                            subjectName: subjectNameController.text,
                            className: className ?? '',
                            district: district ?? '',
                            medium:medium??"" ,
                            bookType: bookTypeController.text);
                      } else {
                        context.read<SubjectController>().addSubject(
                            context: context,
                            subjectName: subjectNameController.text,
                            district: district??"" ,
                            className: className??"" ,
                            medium: medium??"",
                            bookType: bookTypeController.text);
                      }
                    },
                    text: 'Add Subject',
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
