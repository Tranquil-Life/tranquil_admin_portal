import 'package:flutter/cupertino.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {

  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  //final Widget? customScreen;

  const ResponsiveWidget(
      {Key? key,
        this.largeScreen,
        this.mediumScreen,
        this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context)=>
      displayWidth(context) < mediumScreenSize;

  static bool isMediumScreen(BuildContext context)=>
      displayWidth(context) >= mediumScreenSize &&
          displayWidth(context) < largeScreenSize;

  static bool isLargeScreen(BuildContext context)=>
      displayWidth(context) >= largeScreenSize;

  static bool isCustomScreen(BuildContext context)=>
      displayWidth(context) >= mediumScreenSize &&
          displayWidth(context) <= customScreenSize;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      double _width = constraints.maxWidth;
      if(_width >= largeScreenSize){
        return largeScreen!;
      }
      else if (_width < largeScreenSize && _width >= mediumScreenSize){
        return mediumScreen ?? largeScreen!;
      }
      else {
        return smallScreen ?? largeScreen!;
      }
    });
  }
}