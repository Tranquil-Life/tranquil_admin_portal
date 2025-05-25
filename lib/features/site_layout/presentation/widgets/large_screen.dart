// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/local_navigator.dart';

import 'side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SideMenu(),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 5,
          child: localNavigator()
        )
      ],
    );
  }
}
