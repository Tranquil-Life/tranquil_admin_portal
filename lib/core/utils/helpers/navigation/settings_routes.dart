import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/pages/tabs/affirmations_tab.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/pages/tabs/general_tab.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/pages/tabs/security_tab.dart';

class SettingsRoutes {
  static const generalDisplayName = AppStrings.generalSettingsTitle;
  static const generalRoute = "/general";

  static const securityDisplayName = AppStrings.securitySettingsTitle;
  static const securityRoute = "/security";

  static const affirmationsDisplayName = AppStrings.affirmationsSettingsTitle;
  static const affirmationsRoute = "/affirmations";

  static List<MenuItem> sideMenuItemRoutes =
  [
    MenuItem(SettingsRoutes.affirmationsDisplayName, SettingsRoutes.affirmationsRoute),
    MenuItem(SettingsRoutes.generalDisplayName, SettingsRoutes.generalRoute),
    MenuItem(SettingsRoutes.securityDisplayName, SettingsRoutes.securityRoute),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case affirmationsRoute:
        return _getPageRoute(AffirmationsTab());
      case generalRoute:
        return _getPageRoute(GeneralTab());
      case securityRoute:
        return _getPageRoute(SecurityTab());

    // case partnersPageRoute:
    //   return _getPageRoute(PartnersPage());
    // case questionnairePageRoute:
    //   return _getPageRoute(QuestionnairePage());
      default:
        return _getPageRoute(AffirmationsTab());
    // return _getPageRoute(GeneralTab());

    }
  }

  static PageRoute _getPageRoute(Widget child){
    return MaterialPageRoute(builder: (context) => child);
  }
}

