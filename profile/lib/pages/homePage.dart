import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/about_me.dart';
import 'package:profile/widgets/get_height_width.dart';
import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StateMachineController? boyController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/rive/boyface.riv',
            fit: BoxFit.cover,
            onInit: ((artboard) {
              boyController = StateMachineController.fromArtboard(
                artboard,
                'State Machine 1',
              );
              if (boyController == null) return;
              artboard.addController(boyController!);
            }),
          ),
          Positioned(
            top: getHeight(context) / 6,
            left: getWidth(context) / 7,
            child: Row(
              children: [
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      "Hello,\n",
                      textStyle: TextStyle(fontSize: 40),
                      colors: [Colors.amberAccent,Colors.cyanAccent, Colors.deepOrangeAccent,Colors.indigo, Colors.amberAccent],
                    ),
                  ],
                ),
                Text("I am",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(width: 10),
                AnimatedTextKit(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutMePage())),
                  animatedTexts: [
                    ScrambleAnimatedText(
                      "Shidhin Varghese Philip",
                      textStyle: TextStyle(fontSize: 50),
                      speed: Duration(milliseconds: 150),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
