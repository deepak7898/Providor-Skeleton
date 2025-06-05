
import 'package:The_Book_Corporation/custom_widgets/Custom_gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/order_history_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/custom_app_bar.dart';
import '../../../custom_widgets/custom_drawer.dart';
import '../../../custom_widgets/custom_only_loader.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../custom_widgets/no_data_found.dart';
import '../../../widgets/gradient_colors.dart';
import '../user_as_publisher/user.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Future fetchOrderHistory({bool? isRefresh}) async {
    return await context
        .read<OrderHistoryController>()
        .getOrderHistory(context: context, isRefresh: isRefresh);
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchOrderHistory();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return   Scaffold(
      appBar: const CustomAppBar(
        title: 'History',
        showLeadingIcon: false,
      ),
      body:RefreshIndicator(
        color: whiteColor,
        backgroundColor: primaryColor,
        onRefresh: () async{
          fetchOrderHistory();
        },
        child: Consumer<OrderHistoryController>(
          builder: (context, controller, child) {
            return Container(
              decoration: BoxDecoration(gradient: backgroundGradient),
              child:controller.orderHistoryLoader == false
                  ? const Center(child: OnlyLoader())
                  : controller.orderHistoryList.isEmpty==true
                  ? const NoDataFound()
                  : ListView.builder(
                itemCount:controller.orderHistoryList.length,
                padding: const EdgeInsets.only(top: 8, bottom: 80, right: 8, left: 8),
                itemBuilder: (context, index) {
                  var data =controller.orderHistoryList.elementAt(index);
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
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(7), topLeft: Radius.circular(7))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Row(
                                    children: [

                                      Container(
                                        padding: const EdgeInsets.only(left: 8, right: 8, top: 1, bottom: 1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: whiteColor,
                                        ),
                                        child: CustomText(
                                          text:
                                          '#${data.id}',
                                          getTextColor: textColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                      CustomGap(
                                        width: size.width*0.01,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 8, right: 8, top: 1, bottom: 1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: whiteColor,
                                        ),
                                        child: CustomText(
                                          text:data.verify==true?'verified':
                                          'Not verified',
                                          getTextColor: textColor,
                                          fontSize: 13,
                                        ),
                                      ),

                                    ],
                                  ),
                                  CustomIconBox(
                                    iconData: Icons.edit,
                                    backgroundColor:
                                    whiteColor,
                                    iconColor: Colors.red,
                                    onTap: () {
                                      // showConfirmationDialog(
                                      //     context: context,
                                      //     title:
                                      //     'Delete Subject !!',
                                      //     description:
                                      //     'Do you want to delete this subject?',
                                      //     proceedButton:
                                      //     TextButton(
                                      //         onPressed:
                                      //             () async {
                                      //           await context.read<PublisherController>().deleteUser(context: context, id: data?.assignmentId ?? 0,
                                      //           )
                                      //               .whenComplete(
                                      //                 () {
                                      //               fetchSubjectList();
                                      //             },
                                      //           );
                                      //         },
                                      //         child:
                                      //         const CustomText(
                                      //           text:
                                      //           'Delete',
                                      //           fontSize:
                                      //           15,
                                      //         )));
                                    },

                                  ),


                                ],
                              ),
                            ),
                          ),
                          CustomRowBox(
                            title: 'isbn_code',
                            value: data.isbnCode,
                          ),
                          CustomRowBox(
                            title: 'Subject',
                            value: data.subjectName,
                          ),
                          CustomRowBox(
                            title: 'Class Level',
                            value: data.classLevel,
                          ),
                          CustomRowBox(
                            title: 'Medium',
                            value: data.mediumName,
                          ),
                          CustomRowBox(
                            title: 'Publisher',
                            value: data.publisherName,
                          ),

                          CustomRowBox(
                            title: 'Quantity',
                            value: data.quantity.toString(),
                          ),
                          CustomRowBox(
                            title: 'Assigned Date',
                            value: data.assignedDate,
                          ),
                          CustomRowBox(
                            title: 'CDR Given',
                            value:data.contentPubRcv=='0'?'Given':'Not Given',
                          ),
                          CustomRowBox(
                            title: 'CRD Received',
                            value:data.contentRcvYn=='0'?'Not Received':data.contentRcvYn=='1'?'Received':"Pending",
                          ),

                        ],
                      ),
                    ),
                  );
                },),
            );
          },
        ) ,
      ),

    );
  }
}
