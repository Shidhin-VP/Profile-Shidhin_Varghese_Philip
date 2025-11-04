import 'package:flutter/material.dart';
import 'package:profile/constants/profile_section.dart';

Row conditionAppBarRow(BuildContext context) {
  return Row(
    children: [
      ...List.generate(
        sections.length,
        (items) => TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => callFunctions[items]),
            );
          },
          child: Text(sections[items]),
        ),
      ),
    ],
  );
}
