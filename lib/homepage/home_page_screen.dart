import 'package:flutter/material.dart';
import '../basics/app_colors.dart';
import 'custom_drawer.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {


    return Directionality(
        textDirection: TextDirection.rtl,
        child:  Scaffold(
          backgroundColor: AppColors.background_color,
          appBar: AppBar(

            backgroundColor: AppColors.primaryColor,
          ),
          drawer: const CustomDrawer(),

        ),);


  }
}
