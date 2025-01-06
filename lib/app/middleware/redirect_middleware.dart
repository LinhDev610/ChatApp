import 'package:chatapp/app/routes/app_routes.dart';
import 'package:chatapp/presentation/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedirectMiddleware extends GetMiddleware {
  RedirectMiddleware() : super(priority: 1);

  @override
  RouteSettings? redirect(String? route) {
    final appController = Get.find<AppController>();

    if (!appController.isLoggedIn && route != AppRoutes.login) {
      return RouteSettings(name: AppRoutes.login);
    }
    if (route != AppRoutes.chat) {
      return RouteSettings(name: AppRoutes.chat);
    }
    return null;
  }
}
