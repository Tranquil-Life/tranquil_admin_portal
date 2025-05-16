//part of app_pages;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/auth_middleware.dart';
import 'package:tranquil_admin_portal/features/auth/presentation/pages/sign_in.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/pages/dashboard.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/pages/site_layout.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/pages/therapists_page.dart';

abstract class AppPages{
  AppPages._();


  static final bool isLoggedIn = getStore.get('isLoggedIn') ?? false;

  static final String initial = isLoggedIn
      ? Routes.rootRoute
      : Routes.authenticationPageRoute;

  static final pages = [
    GetPage(name: Routes.rootRoute, page: () => SiteLayout(), middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.authenticationPageRoute, page: () => const SignIn()),
  ];

  static final List<Widget> menuPages = [
    const Dashboard(),
    const TherapistsPage(),
  ];

}


Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case Routes.dashboardRoute:
      return _getPageRoute(Dashboard());
    case Routes.therapistsPageRoute:
      return _getPageRoute(TherapistsPage());
    // case clientsPageRoute:
    //   return _getPageRoute(ClientsPage());
    // case partnersPageRoute:
    //   return _getPageRoute(PartnersPage());
    // case questionnairePageRoute:
    //   return _getPageRoute(QuestionnairePage());
    default:
      return _getPageRoute(Dashboard());

  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}

abstract class Routes{

  Routes._();

  static const dashboardDisplayName = AppStrings.dashboardTitle;
  static const dashboardRoute = "/dashboard";

  static const therapistsDisplayName = AppStrings.therapistsTitle;
  static const therapistsPageRoute = "/therapists";

  static const authenticationPageDisplayName = AppStrings.logOutTitle;
  static const authenticationPageRoute = "/auth";

  static const rootRoute = "/";

}

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}


List<MenuItem> sideMenuItemRoutes =
[
  MenuItem(Routes.dashboardDisplayName, Routes.dashboardRoute),
  MenuItem(Routes.therapistsDisplayName, Routes.therapistsPageRoute),
  MenuItem(Routes.authenticationPageDisplayName, Routes.authenticationPageRoute)
];

