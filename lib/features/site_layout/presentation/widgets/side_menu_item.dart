import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/horizontal_menu_item.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {

  final String? itemName;
  final Function()? onTap;
  const SideMenuItem({
    Key? key,
    this.itemName,
    this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(ResponsiveWidget.isCustomScreen(context)){
      return VerticalMenuItem(itemName: itemName!, onTap: onTap!);
    }else{
      return HorizontalMenuItem(itemName: itemName!, onTap: onTap!);
    }
  }
}
