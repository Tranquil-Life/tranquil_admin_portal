import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final bool isLoggedIn = getStore.get('isLoggedIn') ?? false;
    return isLoggedIn ? null : const RouteSettings(name: Routes.authenticationPageRoute);
  }
}
