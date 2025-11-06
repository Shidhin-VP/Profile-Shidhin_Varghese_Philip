import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:profile/widgets/frontend_Constants/textField_Constraint.dart';
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

class AskAI extends StatefulWidget {
  const AskAI({super.key});

  @override
  State<AskAI> createState() => _AskAIState();
}

class _AskAIState extends State<AskAI> {
  bool activateAnsweringCard = false;
  StateMachineController? catController;
  TextEditingController askController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  Future<String> askmyAssistant(String question) async {
    print("API URL: ${dotenv.env['API_URL']}");
    final url = Uri.parse(dotenv.env['API_URL']!);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'question': question}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['answer'] ?? "No answer found";
    } else {
      throw Exception('Failed to get answer: ${response.statusCode}');
    }
  }

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
                      answerController.text,
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ),
                )
              : SizedBox(),
          Positioned(
            bottom: 30,
            left: 50,
            right: 50,
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  TextField(
                    onSubmitted: (value) {
                      activateAnsweringCard = true;
                      askmyAssistant(askController.text);
                    },
                    style: TextStyle(color: Colors.amberAccent),
                    controller: askController,
                    decoration: getBorderDetails('Ask About Shidhin'),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 8,
                    child: ElevatedButton(
                      onPressed: () {
                        activateAnsweringCard = true;
                        askmyAssistant(askController.text);
                      },
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
