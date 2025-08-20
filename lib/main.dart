import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hireme_v2/providers/bloc_provider.dart';
import 'package:hireme_v2/screens/homescreen.dart';

void main(){
  runApp(appSettings());
}

class appSettings extends StatelessWidget {
  const appSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProviders(
            child: MaterialApp(
              title: "Todo",
              debugShowCheckedModeBanner: false,
              home: Homescreen(),
            )
        );
      },
    );
  }
}
