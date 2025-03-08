import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/local_navigator.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/navigation_controller.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/profile/data/models/user_model.dart';
import 'package:tranquil_admin_portal/features/profile/data/repos/user_data_store.dart';
import 'package:tranquil_admin_portal/features/profile/domain/entities/user.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/large_screen.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/side_menu.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final navigationController = Get.put(NavigationController());
  final menuController = Get.put(MenController());

  @override
  Widget build(BuildContext context) {
    print(menuController.activePageRoute.value);
    User user = UserModel.fromJson(userDataStore.user);
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(
          context,
          scaffoldKey,
          user.name),
        drawer: Drawer(
          child: SideMenu(),
        ),
        body: ResponsiveWidget(
            largeScreen: const LargeScreen(),
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
