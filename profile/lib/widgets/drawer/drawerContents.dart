import 'package:flutter/material.dart';
import 'package:profile/constants/profile_section.dart';

ListTile drawerContentWidget(int index) {
  return ListTile(
    onTap: () {},
    leading: Icon(sectionIcons[index]),
    title: Text(sections[index]),
  );
}

Column drawerFullContentWidget(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(3),
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
        ),
      ),
      Flexible(
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: drawerContentWidget(index),
            );
          },
        ),
      ),
    ],
  );
}
