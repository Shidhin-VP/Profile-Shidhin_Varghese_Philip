import 'package:flutter/material.dart';
import 'package:profile/constants/profile_section.dart';

Row conditionAppBarRow(BuildContext context, Function(int) navbarIndex) {
  return Row(
    children: [
      ...List.generate(
        sections.length,
        (items) => TextButton(
          onPressed: () {
            items > 0
                ? navbarIndex(items)
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => callFunctions[items],
                    ),
                  );
          },
          child: Text(sections[items]),
        ),
      ),
    ],
  );
}
