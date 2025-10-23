import 'package:flutter/material.dart';
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
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
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
            top: getHeight(context)/6,
            left: getWidth(context)/5,
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Hi "),
                      TextSpan(text: "Hello Testing testing testing"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
