import 'package:flutter/material.dart';
import 'package:profile/constants/skill_section.dart';
import 'package:profile/widgets/frontend_Constants/get_screen_properties.dart';

Container skillDesktopContainer(BuildContext context) {
  return Container(
    width: getScreenWidth(context),
    color: Colors.teal.shade50,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                    color: Colors.teal.shade400,
                  ),
                ),
                TextSpan(text: " do I Acquire"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage(
                      //     'assets/images/Skills/Professional/Pencil.jpg',
                      //   ),
                      // ),
                    ),
                    width: 500,
                    padding: EdgeInsets.all(7),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: professionalizedSkills.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4, //
                      ),
                      itemBuilder: (context, index) {
                        return ListTile(
                          style: ListTileStyle.drawer,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.yellow),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          leading: Image.asset(
                            professionalizedSkills[index]['img'],
                          ),
                          title: Text(professionalizedSkills[index]['title'],maxLines: 1,overflow: TextOverflow.ellipsis,),
                        );
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    // color: Colors.amber,
                    width: 400,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: skillsChips.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Chip(
                              label: Text(skillsChips[index]['title']),
                              avatar: Image.asset(skillsChips[index]['img']),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
