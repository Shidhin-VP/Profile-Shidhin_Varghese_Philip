import 'package:flutter/material.dart';
import 'package:profile/constants/skill_section.dart';

Container skillMobileContainer(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(5),
    color: Colors.teal.shade50,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 25),
            children: [
              TextSpan(text: "What "),
              TextSpan(
                text: "Skills",
                style: TextStyle(
                  fontFamily: 'NewRocker',
                  color: Colors.amberAccent,
                ),
              ),
              TextSpan(text: " do I Acquire"),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.all(5),
          child: GridView.builder(
            itemCount: professionalizedSkills.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              childAspectRatio: 4,
            ),
            itemBuilder: (context, i) {
              return ListTile(
                leading: Image.asset(professionalizedSkills[i]['img']),
                title: Text(professionalizedSkills[i]['title']),
              );
            },
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < skillsChips.length; i++)
              Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                label: Text(skillsChips[i]['title']),
                avatar: Image.asset(skillsChips[i]['img']),
              ),
          ],
        ),
      ],
    ),
  );
}
