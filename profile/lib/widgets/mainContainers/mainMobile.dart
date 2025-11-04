import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/aksAI_page.dart';
import 'package:profile/widgets/frontend_Constants/get_screen_properties.dart';

Container mainMobileContainer(BuildContext context) {
  return Container(
    constraints: BoxConstraints(minHeight: 560.0),
    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [Colors.blueGrey, Colors.lightBlueAccent],
            ).createShader(bounds);
          },
          child: Image.asset(
            'assets/images/SVP.png',
            width: getScreenWidth(context),
            // height: getScreenHeight(context)*50,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Hi, \nI am ",
                style: TextStyle(fontFamily: 'Oswald', fontSize: 30),
              ),
              TextSpan(
                text: "Shidhin Varghese Philip",
                style: TextStyle(fontFamily: 'Akronim', fontSize: 40),
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
              width: 160,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ScaleAnimatedText(
                    " AI Engineer",
                    textStyle: TextStyle(fontFamily: 'NewRocker', fontSize: 25),
                  ),
                  ScaleAnimatedText(
                    "Full-Stack Software Enginner",
                    textStyle: TextStyle(fontFamily: 'NewRocker', fontSize: 25),
                  ),
                  ScaleAnimatedText(
                    "IoT Engineer",
                    textStyle: TextStyle(fontFamily: 'NewRocker', fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        // Text("I am "),
        // AnimatedTextKit(repeatForever: true,
        //   animatedTexts: [RotateAnimatedText("hi")],
        // ),
        SizedBox(
          width: 280,
          height: 40,
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
      ],
    ),
  );
}
