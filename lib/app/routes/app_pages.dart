import 'package:chatapp/app/middleware/redirect_middleware.dart';
import 'package:chatapp/app/routes/app_routes.dart';
import 'package:chatapp/presentation/controllers/auth/login/login_binding.dart';
import 'package:chatapp/presentation/controllers/auth/signup/signup_binding.dart';
import 'package:chatapp/presentation/controllers/chat/chat_binding.dart';
import 'package:chatapp/presentation/pages/auth/login/login_page.dart';
import 'package:chatapp/presentation/pages/auth/signup/signup_page.dart';
import 'package:chatapp/presentation/pages/chat/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: AppRoutes.root,
      middlewares: [RedirectMiddleware()],
      page: () => Container(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    ),
  ];
}