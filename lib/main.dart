import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goodfood/config/router.dart';
import 'package:goodfood/features/presentations/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Good Food',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        onGenerateRoute: AppRouter.onRute,
      ),
    );
  }
}
