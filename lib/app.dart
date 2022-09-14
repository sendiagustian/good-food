import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/router.dart';

class App extends StatelessWidget {
  const App({super.key});

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
