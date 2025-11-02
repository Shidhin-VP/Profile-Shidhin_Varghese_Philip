import 'package:flutter/material.dart';
import 'package:profile/constants/profile_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text("SVP", style: TextStyle(color: Colors.teal)),
            centerTitle: false,
            actions: [
              constraints.maxWidth >= 600.0
                  ? Row(
                      children: [
                        ...List.generate(
                          sections.length,
                          (items) => TextButton(
                            onPressed: () {},
                            child: Text(sections[items]),
                          ),
                        ),
                      ],
                    )
                  : Icon(Icons.menu),
            ],
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //MainAI
              Container(height: 500),
              //Work Experience
              Container(height: 500, color: Colors.teal),
              //Project
              Container(height: 500),
              //Contact
            ],
          ),
        );
      },
    );
  }
}
