//
//
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../../core/config/app_images.dart';
// import '../../../utils/widgets/image_view.dart';
//
// class CustomCarouselSlider extends StatefulWidget {
//  final  List? imageList ;
//   const CustomCarouselSlider({super.key,this.imageList});
//
//   @override
//   State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
// }
//
// class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
//   late List item = [
//     // AppImages.dashboardBanner1,
//     AppImages.dashboardBanner2,
//     AppImages.dashboardBanner3,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return CarouselSlider(
//         items: List.generate(widget.imageList!.length, (bannerIndex) {
//           return Builder(
//             builder: (BuildContext context) {
//               return ImageView(
//                 width: double.infinity,
//                 assetImage: widget.imageList?[bannerIndex],
//                 borderRadius: BorderRadius.circular(5),
//                 fit: BoxFit.cover,
//               );
//             },
//           );
//         }),
//         options: CarouselOptions(
//           height: size.height * 0.22,
//           initialPage: 0,
//           enableInfiniteScroll: true,
//           reverse: false,
//           autoPlay: true,
//           enlargeCenterPage: false,
//           // enlargeFactor: 1,
//           viewportFraction: 1,
//           scrollDirection: Axis.horizontal,
//         ));
//   }
// }
