import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile/constants/profile_section.dart';
import 'package:profile/widgets/app_bar/app_bar_conditions.dart';
import 'package:profile/widgets/certification_publicationContainers/certifyPubContainer.dart';
import 'package:profile/widgets/drawer/drawerContents.dart';
import 'package:profile/widgets/frontend_Constants/get_screen_properties.dart';
import 'package:profile/widgets/mainContainers/mainDesktop.dart';
import 'package:profile/widgets/mainContainers/mainMobile.dart';
import 'package:profile/widgets/skillContainers/skillDesktop.dart';
import 'package:profile/widgets/skillContainers/skillMobile.dart';
import 'package:profile/widgets/workContainers/mainWorkContainer.dart';
import 'package:rive/rive.dart' as rive;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  rive.StateMachineController? boyController;
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(
    sections.length + 1,
    (index) => GlobalKey(),
  );

  @override
  void dispose() {
    boyController?.dispose();
    super.dispose();
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          bottomNavigationBar: Container(
            color: Colors.teal.shade900,
            padding: const EdgeInsets.all(16),
            child: const Text(
              "© 2025 Shidhin Varghese Philip",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= maxScreenWidth
              ? null
              : Drawer(
                  child: drawerFullContentWidget(context, (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  }),
                ),
          appBar: AppBar(
            title: GestureDetector(
              key: navbarKeys.last,
              onTap: () {
                navbarKeys.last;
              },
              child: Text(
                "SVP",
                style: TextStyle(color: Colors.teal, fontFamily: 'Oswald'),
              ),
            ),
            centerTitle: false,
            actions: [
              constraints.maxWidth >= maxScreenWidth
                  ? conditionAppBarRow(context, (int navIndex) {
                      scrollToSection(navIndex);
                    })
                  : IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                      icon: Icon(Icons.menu),
                    ),
            ],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                //MainAI
                // mainDesktopContainer(context),
                constraints.maxWidth >= maxScreenWidth
                    ? mainDesktopContainer(context)
                    : mainMobileContainer(context),
                //Skills
                SizedBox(key: navbarKeys[1]),
                getScreenWidth(context) >= maxScreenWidth
                    ? skillDesktopContainer(context)
                    : skillMobileContainer(context),
                //Work Experience
                SizedBox(key: navbarKeys[2]),
                mainWorkContainer(context),
                //Certifications and Publications
                SizedBox(key: navbarKeys[3]),
                certificationAndpublicationContainer(context),
                //Contact Me
                // Contact Me Section
                Container(
                  key: navbarKeys[4],
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  padding: const EdgeInsets.symmetric(
                    vertical: 60,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Get in Touch",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Contact form area
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isDesktop = constraints.maxWidth > 800;
                          return Center(
                            child: Container(
                              width: isDesktop ? 700 : double.infinity,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  isDesktop
                                      ? Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                decoration:
                                                    const InputDecoration(
                                                      labelText: "Your Name",
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: TextField(
                                                decoration:
                                                    const InputDecoration(
                                                      labelText: "Your Email",
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            TextField(
                                              decoration: const InputDecoration(
                                                labelText: "Your Name",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            TextField(
                                              decoration: const InputDecoration(
                                                labelText: "Your Email",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ],
                                        ),
                                  const SizedBox(height: 16),
                                  TextField(
                                    readOnly: true,
                                    maxLines: 5,
                                    decoration: const InputDecoration(
                                      labelText: "Message",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                        horizontal: 24,
                                      ),
                                    ),
                                    onPressed: () {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Center(
                                            child: Text(
                                              "Use an Alternative Way to get Connected, Sorry for the inconvenience.",
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.send),
                                    label: const Text(
                                      "Send Message",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 40),

                      // Social & Contact Links
                      Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github),
                            onPressed: () => launchUrl(
                              Uri.parse("https://github.com/Shidhin-VP"),
                            ),
                            tooltip: "GitHub",
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.linkedin),
                            onPressed: () => launchUrl(
                              Uri.parse(
                                "https://www.linkedin.com/in/shidhinvarghesephilip/",
                              ),
                            ),
                            tooltip: "LinkedIn",
                          ),
                          // IconButton(
                          //   icon: const FaIcon(FontAwesomeIcons.twitter),
                          //   onPressed: () => launchUrl(Uri.parse("https://twitter.com/yourhandle")),
                          //   tooltip: "Twitter",
                          // ),
                          // IconButton(
                          //   icon: const FaIcon(FontAwesomeIcons.envelope),
                          //   onPressed: () => launchUrl(Uri.parse("mailto:youremail@example.com")),
                          //   tooltip: "Email",
                          // ),
                          // IconButton(
                          //   icon: const FaIcon(FontAwesomeIcons.globe),
                          //   onPressed: () => launchUrl(Uri.parse("https://yourportfolio.com")),
                          //   tooltip: "Portfolio",
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
