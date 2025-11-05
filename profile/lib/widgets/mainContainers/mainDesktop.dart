import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/aksAI_page.dart';
import 'package:profile/widgets/frontend_Constants/get_screen_properties.dart';

Container mainDesktopContainer(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0),
    constraints: const BoxConstraints(minHeight: 350.0),
    height: getScreenHeight(context) * 0.84,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hi, \nI am ",
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 30),
                    ),
                    TextSpan(
                      text: "Shidhin Varghese Philip",
                      style: TextStyle(fontFamily: 'Akronim', fontSize: 50),
                    ),
                    TextSpan(text: ',', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Specialized as",
                    style: TextStyle(fontFamily: "Oswald", fontSize: 30),
                  ),
                  SizedBox(
                    width: 280,
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        ScaleAnimatedText(
                          " AI Engineer",
                          textStyle: TextStyle(
                            fontFamily: 'NewRocker',
                            fontSize: 30,
                          ),
                        ),
                        ScaleAnimatedText(
                          "Full-Stack Software Enginner",
                          textStyle: TextStyle(
                            fontFamily: 'NewRocker',
                            fontSize: 30,
                          ),
                        ),
                        ScaleAnimatedText(
                          "IoT Engineer",
                          textStyle: TextStyle(
                            fontFamily: 'NewRocker',
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Flexible(
                child: SizedBox(
                  width: 280,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => AskAI()));
                    },
                    child: Text(
                      "Ask My AI Assistant about Me",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: getScreenWidth(context) / 2,
            height: getScreenHeight(context) * 0.8,
            child: Image.asset(
              'assets/images/SVP.png',
              width: getScreenWidth(context),
            ),
          ),
        ),
      ],
    ),
  );
}
