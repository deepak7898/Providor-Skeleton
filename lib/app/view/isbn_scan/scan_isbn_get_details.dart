import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:vibration/vibration.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../../../controller/isbn_scan_controller.dart';
import '../../../core/config/app_images.dart';
import 'isbn_model/isbn_details_model.dart';
//
// class ISBNDetailsByScanScreen extends StatefulWidget {
//   const ISBNDetailsByScanScreen({super.key});
//
//   @override
//   _ISBNDetailsByScanScreenState createState() =>
//       _ISBNDetailsByScanScreenState();
// }
//
// class _ISBNDetailsByScanScreenState extends State<ISBNDetailsByScanScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   OriginalData? ISBNDetails;
//   String scanISBNCode = "";
//   Color color = Colors.blue;
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (controller != null) {
//       if (mounted) {
//         controller!.pauseCamera();
//         controller!.resumeCamera();
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         // toolbarHeight: 35,
//         title: FadeInRight(child: headingTextColor(title: "ISBN Scanner",color: Colors.white,size: 17,)),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,
//               size: 20, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context, true);
//           },
//         ),
//         actions: [
//           FadeInRight(
//             child: Container(
//               width: 30,
//               height: 27,
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(image: AssetImage(AppImages.smgLogo),),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.white,
//                       spreadRadius: 1,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ]
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: BlocProvider(
//         create: (context) => ISBNDetailsByScanBloc(),
//         child: BlocConsumer<ISBNDetailsByScanBloc, ISBNDetailsByScanState>(
//           listener: (context, state) {
//             if (state is ISBNDetailsByScanSuccessState) {
//               print('check   successfully ============> ');
//               setState(() {
//                 ISBNDetails = state.data.originalData;
//               });
//               // Fluttertoast.showToast(msg: state.data.message);
//             } else if (state is ISBNDetailsByScanErrorState) {
//               print('check else part  successfully ============> ${state.errorMessage} ');
//               // showSnackBar(context: context, text: state.errorMessage , color: color ?? Colors.green);
//               // Fluttertoast.showToast(msg: state.errorMessage,backgroundColor: Colors.red);
//             }
//           },
//           builder: (context, state) {
//             return Stack(
//               children: [
//                 Positioned.fill(
//                   child: QRView(
//                     key: qrKey,
//                     onQRViewCreated: (controller) {
//                       print('check scanner');
//                       _onQRViewCreated(controller, context);
//                     },
//                     overlay: QrScannerOverlayShape(
//                         borderColor: Colors.white,
//                         borderRadius: 10,
//                         borderLength: 30,
//                         borderWidth: 8,
//                         cutOutSize: 250,
//                         overlayColor: Colors.deepPurple.shade400.withOpacity(0.5),
//                     ),
//                   ),
//                 ),
//                Align(
//                  alignment: Alignment.bottomCenter,
//                  child: FadeInUp(
//                    child: Container(
//                      width: MediaQuery.of(context).size.width,
//                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                      decoration: BoxDecoration(
//                        color: Colors.deepPurple.shade400.withOpacity(0.7),
//                        border: Border.all(color: Colors.white),
//                        borderRadius: const BorderRadius.only(
//                          topLeft: Radius.circular(20),
//                          topRight: Radius.circular(20),
//                        ),
//                      ),
//                      child:  ISBNDetails != null ? scanISBNCode.length == 13 ?  Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                         const SizedBox(height: 10),
//                         FadeInRight(
//                             duration: const Duration(milliseconds: 200),
//                             child: headingText2(title: "Publisher Name: ${ISBNDetails?.publisherName ?? 'N/A'}")),
//                         const SizedBox(height: 10),
//                           FadeInRight(
//                               duration: const Duration(milliseconds: 600),
//                               child: headingText2(title: "Class: ${ISBNDetails?.classNumber ?? 'N/A'}")),
//                         const SizedBox(height: 10),
//                           FadeInRight(
//                               duration: const Duration(milliseconds: 800),
//                               child: headingText2(title: "Subject: ${ISBNDetails?.subject ?? 'N/A'}")),
//                         const SizedBox(height: 10),
//                           FadeInRight(
//                               duration: const Duration(milliseconds: 1000),
//                               child: headingText2(title: "Medium: ${ getMedium(ISBNDetails!.medium.toString()) ?? 'N/A'}")),
//                         const SizedBox(height: 10),
//                         ],
//                         ):
//                      Column(
//                        mainAxisSize: MainAxisSize.min,
//                           children: [
//                             FadeInRight(child: Center(child: headingTextColor(title: 'Please Scan Correct ISBN Code To Get Valid Details',color: Colors.white,size: 16,),)),
//                           ],
//                         ) :  Column(
//                        mainAxisSize: MainAxisSize.min,
//                        children: [
//                          FadeInRight(child: Center(child: headingTextColor(title: 'Please Scan ISBN Code To Get Valid Details',color: Colors.white,size: 16,),)),
//                        ],
//                      ),
//                    ),
//                  ),
//                )
//
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//   void _onQRViewCreated(QRViewController controller, BuildContext context) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       String scannedData = scanData.code ?? "No data";
//       log("Scanned Code: $scannedData");
//
//       if (scannedData.isNotEmpty) {
//         FlutterRingtonePlayer().play(
//           fromAsset: 'assets/images/beep.mp3',
//           looping: false,
//           volume: 1.0,
//           asAlarm: false,
//         );
//
//         if (await Vibration.hasVibrator() ?? false) {
//           Vibration.vibrate(duration: 100);
//         }
//
//         setState(() {
//           scanISBNCode = scannedData;
//         });
//
//         BlocProvider.of<ISBNDetailsByScanBloc>(context).add(
//             FetchISBNDetailsByScanEvent(isbnCode: scanISBNCode));
//       }
//     });
//   }
//
//   String getMedium(String medium) {
//     if (medium == "4") {
//       return "Hindi";
//     } else if (medium == "19") {
//       return "English";
//     }else if (medium == "99") {
//       return "Other's";
//     }else if (medium == "100") {
//       return "Hindi and English";
//     }
//     return "None";
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }



class ISBNDetailsByScanScreen extends StatefulWidget {
  const ISBNDetailsByScanScreen({super.key});

  @override
  _ISBNDetailsByScanScreenState createState() =>
      _ISBNDetailsByScanScreenState();
}

class _ISBNDetailsByScanScreenState extends State<ISBNDetailsByScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  OriginalData? ISBNDetails;
  String scanISBNCode = "";
  Color color = Colors.blue;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (mounted) {
        controller!.pauseCamera();
        controller!.resumeCamera();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // toolbarHeight: 35,
        title: FadeInRight(child: headingTextColor(title: "ISBN Scanner",color: Colors.white,size: 17,)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              size: 20, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        actions: [
          FadeInRight(
            child: Container(
              width: 30,
              height: 27,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(AppImages.smgLogo),),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
      body: Consumer<IsbnScanController>(
        builder: (context, controller, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) {
                    print('check scanner');
                    _onQRViewCreated(controller, context);
                  },
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.white,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 8,
                    cutOutSize: 250,
                    overlayColor: Colors.deepPurple.shade400.withOpacity(0.5),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FadeInUp(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade400.withOpacity(0.7),
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child:  controller.bookVerification?.originalData != null ? scanISBNCode.length == 13 ?  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        FadeInRight(
                            duration: const Duration(milliseconds: 200),
                            child: headingText2(title: "Publisher Name: ${controller.bookVerification?.originalData?.publisherName ?? 'N/A'}")),
                        const SizedBox(height: 10),
                        FadeInRight(
                            duration: const Duration(milliseconds: 600),
                            child: headingText2(title: "Class: ${controller.bookVerification?.originalData?.classNumber ?? 'N/A'}")),
                        const SizedBox(height: 10),
                        FadeInRight(
                            duration: const Duration(milliseconds: 800),
                            child: headingText2(title: "Subject: ${controller.bookVerification?.originalData?.subject ?? 'N/A'}")),
                        const SizedBox(height: 10),
                        FadeInRight(
                            duration: const Duration(milliseconds: 1000),
                            child: headingText2(title: "Medium: ${ getMedium(controller.bookVerification?.originalData?.medium.toString()??'') ?? 'N/A'}")),
                        const SizedBox(height: 10),
                      ],
                    ):
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeInRight(child: Center(child: headingTextColor(title: 'Please Scan Correct ISBN Code To Get Valid Details',color: Colors.white,size: 16,),)),
                      ],
                    ) :  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeInRight(child: Center(child: headingTextColor(title: 'Please Scan ISBN Code To Get Valid Details',color: Colors.white,size: 16,),)),
                      ],
                    ),
                  ),
                ),
              )

            ],
          );
        },
      ),
    );
  }
  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      String scannedData = scanData.code ?? "No data";
      log("Scanned Code: $scannedData");

      if (scannedData.isNotEmpty) {
        FlutterRingtonePlayer().play(
          fromAsset: 'assets/images/beep.mp3',
          looping: false,
          volume: 1.0,
          asAlarm: false,
        );

        if (await Vibration.hasVibrator() ?? false) {
          Vibration.vibrate(duration: 100);
        }

        setState(() {
          scanISBNCode = scannedData;
        });
           context.read<IsbnScanController>().getIsbnId(context: context, isbnCode: scanISBNCode);
        // BlocProvider.of<ISBNDetailsByScanBloc>(context).add(
        //     FetchISBNDetailsByScanEvent(isbnCode: scanISBNCode));
      }
    });
  }

  String getMedium(String medium) {
    if (medium == "4") {
      return "Hindi";
    } else if (medium == "19") {
      return "English";
    }else if (medium == "99") {
      return "Other's";
    }else if (medium == "100") {
      return "Hindi and English";
    }
    return "None";
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
class headingTextColor extends StatelessWidget {
  headingTextColor({Key? key, required this.title,required this.color,this.size = 15}) : super(key: key);
  String title;
  Color color;
  int? size;


  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
        text: title,style: GoogleFonts.lato(
        textStyle: TextStyle(fontWeight:FontWeight.w600,color:color,
            fontSize:10,letterSpacing:1)
    )
    ), maxLines: 50,
      overflow: TextOverflow.ellipsis,
    );
  }
}


class headingText2 extends StatelessWidget {
  headingText2({Key? key, required this.title}) : super(key: key);
  String title;


  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
        text: title,style: GoogleFonts.lato(
      textStyle: TextStyle(fontWeight:FontWeight.w600,color:Colors.white,
          fontSize:16,letterSpacing:1),
    )
    ),maxLines: 5,);
  }


}