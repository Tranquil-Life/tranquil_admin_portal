import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/navigation_controller.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';

NavigationController navigationController = NavigationController.instance;

Navigator localNavigator() => Navigator(
  key: navigationController.navigatorKey,
  onGenerateRoute: generateRoute,
  initialRoute: MenController.instance.activePageRoute.value,
  //Routes.dashboardRoute
);