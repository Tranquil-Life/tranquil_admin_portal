import 'package:flutter/material.dart';

Widget metricCard({
  required String title,
  required String value,
  required IconData icon,
  required Color color,
}) {
  return Container(
    height: 130,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border(
        top: BorderSide(
          color: color,
          width: 4,
        ),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          color: Colors.black.withOpacity(.08),
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: color.withOpacity(.1),
              child: Icon(
                icon,
                color: color,
                size: 18,
              ),
            )
          ],
        ),

        const Spacer(),

        Text(
          value,
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
