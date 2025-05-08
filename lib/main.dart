import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes/app_routes.dart';
import 'bindings/app_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const OtakuStreamApp());
}

class OtakuStreamApp extends StatelessWidget {
  const OtakuStreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OtakuStream',
      theme: ThemeData.dark(),
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
