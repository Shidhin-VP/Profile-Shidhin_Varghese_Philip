import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile/constants/certification_publications_section.dart';
import 'package:url_launcher/url_launcher.dart';

  void _launchURL(BuildContext context,String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Center(child: Text("Could not Launch Link"))),
      );
    }
  }

Widget _buildCard(BuildContext context, Map item) {
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
                    if (item.containsKey('subTitle') &&
                        item['subTitle'] != null)
                      Text(
                        item['subTitle']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        item['certificationImage'] == ''
                            ? SizedBox()
                            : IconButton(
                                onPressed: () {
                                  showDialog(
                                    barrierLabel: "Certifications",
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Center(
                                          child: Text("Credential",style: TextStyle(color: Colors.brown,fontFamily: 'Oswald'),),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset('assets/images/Certifications/snowpro-certification.png'),
                                            SizedBox(height: 5,),
                                            Text("${item['subTitle']} - ${item['title']} Certification", style: TextStyle(color: Colors.green),)
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.image, size: 23),
                              ),
                        item['gitHub'] == ''
                            ? SizedBox()
                            : IconButton(
                                onPressed: () {
                                  _launchURL(context,item['gitHub']);
                                },
                                icon: Icon(FontAwesomeIcons.github, size: 23),
                              ),
                        IconButton(
                          onPressed: () {
                            _launchURL(context,item['link']);
                          },
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

  Widget _buildSection(BuildContext context,String title, List<Map> items) {
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
          child: Row(
            children: items.map((item) => _buildCard(context, item)).toList(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

Container certificationAndpublicationContainer(BuildContext context){
  return Container(
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
                      _buildSection(context,"Certifications", certifications),
                      _buildSection(context,"Publications", publications),
                    ],
                  ),
                );
}