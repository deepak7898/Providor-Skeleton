import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_images.dart';

import '../../../core/constant/colors.dart';
import '../../../custom_widgets/Custom_gap.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_text.dart';

import '../../../route/route_paths.dart';

import '../../../widgets/gradient_colors.dart';
import '../../../widgets/image_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();







  List<Item> item = [
    Item(
        image: AppImages.onBoardingFirst,
        title: 'Welcome to BookFlow!',
        subTitle:
            'Effortlessly manage book distribution, track orders, and connect with buyers to grow your business with ease and efficiency.'),
    Item(
        image: AppImages.onBoardingSecond,
        title: 'Effortless Book Management',
        subTitle:
            'Easily organize your book inventory, manage bulk orders, track sales, and streamline distribution with a powerful, user-friendly system designed for efficiency and growth.'),
    Item(
        image: AppImages.onBoardingThird,
        title: 'Fast & Reliable Delivery',
        subTitle:
            "Ensure timely book deliveries with automated tracking, efficient logistics, and real-time updates for a seamless distribution experience."),
  ];
  int? swipIndex = 0;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.0035,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      width: index == swipIndex
                          ? size.width * 0.07
                          : size.width * 0.01,
                      decoration: BoxDecoration(
                          color:
                              index == swipIndex ? Colors.black87 : Colors.black45,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routs.loginView);
                  },
                  child: const CustomText(
                    text: 'Skip  ',
                    fontSize: 14,
                    getTextColor: Colors.black87,
                    darkTheme: true,
                  ),
                ),
                const Icon(
                  color: Colors.black87,
                  CupertinoIcons.right_chevron,
                  size: 12,
                )
              ],
            )
          ],
        ),
        flexibleSpace:  Container(
          decoration: BoxDecoration(
            color: primaryColorLight
          ),
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: item.length,
        onPageChanged: (value) {
          setState(() {
            swipIndex = value;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomGap(
                  height: size.height * 0.03,
                ),
                FadeInRight(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: CustomText(
                      text: item[index].title,
                      fontSize: 30,
                      darkTheme: true,
                      getTextColor: textColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                CustomGap(
                  height: size.height * 0.02,
                ),
                FadeInRight(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: CustomText(
                      text: item[index].subTitle,
                      fontSize: 15,
                      darkTheme: true,
                      getTextColor: textColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                CustomGap(
                  height: size.height * 0.07,
                ),
                FadeInLeft(
                  child: ImageView(
                    assetImage: item[index].image,
                    height: size.height * 0.4,
                    fit: BoxFit.contain,
                    // color: swipIndex==1?Colors.white:null,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: CustomButton(

                onTap: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 550),
                      curve: Curves.linear);
                  if (swipIndex == 2) {
                    context.pushNamed(Routs.loginView);
                  }
                },

                text: swipIndex == 2 ? 'Continue' : 'Next',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  String? image;
  String? title;
  String? subTitle;

  Item({this.image, this.title, this.subTitle});
}

class GlobalSnackBar {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static void show({
    String? message,
    Color? textColor,
    Color? color,
    IconData? icon,
  }) {
    final snackbar = SnackBar(
      margin: const EdgeInsets.all(10),
      shape: const StadiumBorder(),
      duration: const Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
      content: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const CustomGap(
            width: 10,
          ),
          Expanded(
            child: Text(
              message ?? '',
              style: TextStyle(color: textColor ?? Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: color ?? Colors.blue.shade700,
    );

    scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
  }
}
