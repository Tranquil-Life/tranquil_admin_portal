import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/local_navigator.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/navigation_controller.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menuController.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/large_screen.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/side_menu.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final navigationController = Get.put(NavigationController());
  final menuController = Get.put(MenController());

  SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(
          context,
          scaffoldKey,
          "Username"),
        drawer: Drawer(
          child: SideMenu(),
        ),
        body: ResponsiveWidget(
            largeScreen: LargeScreen(),
            smallScreen: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: localNavigator(),
            )
        )
      // body: Row(
      //   children: [
      //     if(displayWidth(context) >= 640)
      //       NavigationRail(
      //         extended: true,
      //         selectedIndex: menuController.selectedIndex.value,
      //         onDestinationSelected: (int index){
      //           menuController.selectedIndex.value = index;
      //         },
      //         destinations: const [
      //           NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
      //           NavigationRailDestination(icon: Icon(Icons.calendar_today_outlined), label: Text('Meetings')),
      //         ],
      //       ),
      //     Expanded(
      //         child: AppPages.menuPages[menuController.selectedIndex.value]
      //     )
      //   ],
      // ),
    );
  }
}
