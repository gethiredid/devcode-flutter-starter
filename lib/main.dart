import 'package:devcode_flutter_starter/routes/pages.dart';
import 'package:devcode_flutter_starter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devcode Flutter Starter',
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
