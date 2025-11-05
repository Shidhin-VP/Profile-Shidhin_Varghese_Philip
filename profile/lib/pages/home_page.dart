import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:profile/constants/certification_publications_section.dart';
import 'package:profile/constants/profile_section.dart';
import 'package:profile/constants/work_section.dart';
import 'package:profile/widgets/app_bar/app_bar_conditions.dart';
import 'package:profile/widgets/drawer/drawerContents.dart';
import 'package:profile/widgets/frontend_Constants/get_screen_properties.dart';
import 'package:profile/widgets/mainContainers/mainDesktop.dart';
import 'package:profile/widgets/mainContainers/mainMobile.dart';
import 'package:profile/widgets/skillContainers/skillDesktop.dart';
import 'package:profile/widgets/skillContainers/skillMobile.dart';
import 'package:profile/widgets/workContainers/mainWorkContainer.dart';
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
                getScreenWidth(context) >= maxScreenWidth
                    ? skillDesktopContainer(context)
                    : skillMobileContainer(context),
                //Work Experience
                mainWorkContainer(context),
                //Projects
                Container(
                  width: double.infinity,
                  color: Colors.teal.shade50,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: const Text(
                          "Certifications & Publications",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildSection("Certifications", certifications),
                      _buildSection("Publications", publications),
                    ],
                  ),
                ),
                //Contact Me
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildCard(Map item) {
  return Center(
    child: TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 1, end: 1),
      builder: (context, scale, child) {
        return MouseRegion(
          onEnter: (_) {},
          onExit: (_) {},
          child: GestureDetector(
            onTapDown: (_) {},
            onTapUp: (_) {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: Matrix4.identity(),
              width: 160,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item['image'] != null && item['image']!.isNotEmpty)
                    Image.asset(
                      item['image']!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  const SizedBox(height: 8),
                  Text(
                    item['title'] ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (item.containsKey('subTitle') && item['subTitle'] != null)
                    Text(
                      item['subTitle']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){}, icon: ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.public, size: 23),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget _buildSection(String title, List<Map> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
      const SizedBox(height: 12),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: items.map(_buildCard).toList()),
      ),
      const SizedBox(height: 20),
    ],
  );
}
