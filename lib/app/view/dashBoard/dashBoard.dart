import 'package:flutter/material.dart';
import 'package:teacherTMS/custom_widgets/custom_text.dart';

class Dashboard extends StatefulWidget {
 final String?name;
  const Dashboard({super.key,this.name});

  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    print('check naem ${widget.name}');
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(
          text: 'DashBoard',
          textColor: Colors.white,
        ),
      ),
      body: const Center(
        child: CustomText(
          text: 'DashBoard',
        ),
      ),
    );
  }
}
