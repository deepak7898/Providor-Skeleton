
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
  final String? bookId;
  final bool? editType;
  final String? name;
  final String? className;
  final String? district;
  final String? bookType;
  const AddSubject({super.key,this.bookId,this.name,this.className,this.district,this.bookType,this.editType=false});
  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  TextEditingController subjectNameController =TextEditingController();
  TextEditingController bookTypeController =TextEditingController();
  String? district ='';
  String? className ='';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     if(widget.editType==true){
       subjectNameController.text=widget.name??'';
       bookTypeController.text =widget.bookType??'';
       className=widget.className;
       district=widget.district;
       setState(() {});
     }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('chekc edit Type ${widget.editType}');
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
              text:
              "The user with the role of 'Admin' has the subject 'Hindi ', the book type 'Study', and select class name 11,and district 'Korba'.",
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
                      borderRadius:
                      const BorderRadius.all(Radius.circular(7)),
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
                  child: CustomDropdown(
                    list: const ['1','2','3','4','5','6','7','8','9','10'],
                    onChanged: (v) {
                      className =v;
                      setState(() {

                      });
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
                      borderRadius:
                      const BorderRadius.all(Radius.circular(7)),
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
                  child: CustomDropdown(
                    list: const ['Korba','Bilaspur'],
                    onChanged: (v) {
                      district =v;
                      setState(() {

                      });
                    },
                    hintText: 'Select District',
                  ),
                ),
              ],
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
             CustomTextFormField(
              controller: subjectNameController,
              hintText: 'Enter Subject Name',
              prefixIcon: MaterialIcons.subject,
            ),
            CustomGap(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child:  CustomTextFormField(
                controller: bookTypeController,
                hintText: 'Enter Book Type',

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
                      context.read<SubjectController>().addSubject(context: context,
                          subjectName: subjectNameController.text, district: district??'', className: className??'', bookType: bookTypeController.text);
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
