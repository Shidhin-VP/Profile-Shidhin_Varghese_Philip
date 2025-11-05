import 'package:flutter/material.dart';
import 'package:profile/constants/work_section.dart';

Container mainWorkContainer(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    // color: Colors.teal.shade50,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Center(
          child: Text(
            "Work Experience",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade700,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Timeline items
        Column(
          children: workExperience
              .map(
                (exp) => Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Dot + line
                      Column(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: const BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(width: 2, height: 80, color: Colors.teal),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Card with info
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exp['position']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                exp['company']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                exp['period']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Text(
                              //   exp['description']!,
                              //   style: const TextStyle(
                              //     fontSize: 14,
                              //     color: Colors.black87,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
}
