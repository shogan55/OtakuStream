import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakustream/utils/app_color.dart';
import 'routes/app_routes.dart';
import 'bindings/app_bindings.dart'; // ✅ Import bindings

class OtakuStreamApp extends StatelessWidget {
  const OtakuStreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OtakuStream',
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.black,
      ),
      initialBinding: AppBindings(), // ✅ Apply Bindings Here
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}

void main() {
  runApp(const OtakuStreamApp());
}
