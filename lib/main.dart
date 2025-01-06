import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/presentation/app.dart';
import 'package:chatapp/presentation/controllers/app_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

await initServices();

  runApp(const App());
}

initServices() async {
  await Get.put<AppController>(AppController(), permanent: true).init();
}
