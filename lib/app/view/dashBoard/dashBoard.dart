import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../services/database/local_database.dart';
class Dashboard extends StatefulWidget {
 final String?name;
  const Dashboard({super.key,this.name});

  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    context.read<LocalDatabase>().setIsLogin(isLogin: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

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
