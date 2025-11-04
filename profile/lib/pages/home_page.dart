import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:profile/constants/profile_section.dart';
import 'package:profile/pages/aksAI_page.dart';
import 'package:profile/widgets/app_bar/app_bar_conditions.dart';
import 'package:profile/widgets/drawer/drawerContents.dart';
import 'package:profile/widgets/frontend_Constants/get_screen_properties.dart';
import 'package:profile/widgets/mainContainers/mainDesktop.dart';
import 'package:profile/widgets/mainContainers/mainMobile.dart';
import 'package:rive/rive.dart' as rive;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  rive.StateMachineController? boyController;
  @override
  void dispose() {
    boyController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= maxScreenWidth
              ? null
              : Drawer(child: drawerFullContentWidget(context)),
          appBar: AppBar(
            title: Text(
              "SVP",
              style: TextStyle(color: Colors.teal, fontFamily: 'Oswald'),
            ),
            centerTitle: false,
            actions: [
              constraints.maxWidth >= maxScreenWidth
                  ? conditionAppBarRow(context)
                  : IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                      icon: Icon(Icons.menu),
                    ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //MainAI
                // mainDesktopContainer(context),
                constraints.maxWidth >= maxScreenWidth
                    ? mainDesktopContainer(context)
                    : mainMobileContainer(context),
                //Skills
                Container(height: 500, color: Colors.teal),
                //Work Experience
                //Projects
                //Contact Me
              ],
            ),
          ),
        );
      },
    );
  }
}
