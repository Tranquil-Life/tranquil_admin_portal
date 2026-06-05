import 'package:flutter/material.dart';

Widget statusChip(String status) {
  Color bg;
  Color text;

  switch (status) {
    case 'Approved':
      bg = Colors.green.shade100;
      text = Colors.green;
      break;

    case 'Rejected':
      bg = Colors.red.shade100;
      text = Colors.red;
      break;

    case 'Needs Review':
      bg = Colors.blue.shade100;
      text = Colors.blue;
      break;

    default:
      bg = Colors.orange.shade100;
      text = Colors.orange;
  }

  return Container(
    width: 120,
    height: 30,
    margin: const EdgeInsets.all(4.0),
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      status,
      style: TextStyle(
        color: text,
        fontSize: 12,
        fontWeight: FontWeight.w600
      ),
    ),
  );
}