
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/order_history_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../custom_widgets/custom_app_bar.dart';
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
    return   Scaffold(
      appBar: const CustomAppBar(
        title: 'History',
        showLeadingIcon: false,
      ),
      body:Consumer<OrderHistoryController>(
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
                                CustomText(
                                  text: 'Pending',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  getTextColor: whiteColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        CustomRowBox(
                          title: 'isbn_code',
                          value: data.isbnCode,
                        ),
                        CustomRowBox(
                          title: 'isbn_code',
                          value: data.isbnCode,
                        ),
                      ],
                    ),
                  ),
                );
              },),
          );
        },
      ) ,

    );
  }
}
