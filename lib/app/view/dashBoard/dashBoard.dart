
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';
import '../../../custom_widgets/custom_app_bar.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../services/database/local_database.dart';
import '../../../custom_widgets/custom_drawer.dart';
import '../../../widgets/gradient_colors.dart';
class Dashboard extends StatefulWidget {
 final String?name;
  const Dashboard({super.key,this.name});

  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<LocalDatabase>().setIsLogin(isLogin: true);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        showLeadingIcon: true,
        title: 'THE BOOK CORPORATION',
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient
        ),
        child: const Center(
          child: CustomText(
            text: 'DashBoard',
          ),
        ),
      ),
    );
  }
}
