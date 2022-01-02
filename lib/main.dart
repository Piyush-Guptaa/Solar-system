import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/planet_detail_screen/widgets/landing_page.dart';

import 'home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Solar System',
        theme: ThemeData(
          fontFamily: 'CircularStd',
        ),
        routes: {
          "/":(context)=> LandingPage(),
          "/home":(context)=> HomeScreen(),
        },
      
      ),
    );
  }
}
