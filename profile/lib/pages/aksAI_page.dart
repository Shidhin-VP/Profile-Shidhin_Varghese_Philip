import 'package:flutter/material.dart';
import 'package:profile/widgets/frontend_Constants/textField_Constraint.dart';
import 'package:rive/rive.dart';

class AskAI extends StatefulWidget {
  const AskAI({super.key});

  @override
  State<AskAI> createState() => _AskAIState();
}

class _AskAIState extends State<AskAI> {
  bool activateAnsweringCard = true;
  StateMachineController? catController;
  TextEditingController askController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Smart Assistant",
          style: TextStyle(color: Colors.amberAccent),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          RiveAnimation.asset('assets/rive/starry.riv', fit: BoxFit.cover),
          activateAnsweringCard
              ? Positioned(
                  top: 60,
                  left: 40,
                  right: 40,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: Colors.transparent,
                    child: Text(
                      askController.text,
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ),
                )
              : SizedBox(),
          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  TextField(
                    onSubmitted: (value) {},
                    style: TextStyle(color: Colors.amberAccent),
                    controller: askController,
                    decoration: getBorderDetails('Ask About Shidhin'),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 8,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Ask AI"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
