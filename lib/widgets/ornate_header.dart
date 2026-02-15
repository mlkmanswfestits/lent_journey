import 'package:flutter/material.dart';
import '../utils/theme.dart';

class OrnateHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? progress;
  final String? progressLabel;
  final Widget? customContent;

  const OrnateHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.progress,
    this.progressLabel,
    this.customContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        // Modern Liturgical Gradient (Soft Indigo)
        gradient: LinearGradient(
          colors: [
            CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (progressLabel != null) ...[
                  Text(
                    progressLabel!.toUpperCase(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: CatholicTheme.lentenIndigo.withValues(alpha: 0.7),
                          letterSpacing: 2.0,
                        ),
                  ),
                  const SizedBox(height: 12),
                ],

                // Title
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: CatholicTheme.lentenIndigo.withValues(alpha: 0.8),
                          letterSpacing: 0.5,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],

                if (progress != null) ...[
                  const SizedBox(height: 32),

                  // Progress Bar
                  Stack(
                    children: [
                      // Track
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: CatholicTheme.lentenIndigo.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      // Fill
                      FractionallySizedBox(
                        widthFactor: progress!.clamp(0.0, 1.0),
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                CatholicTheme.lentenIndigo,
                                Color(0xFF6C5CE7)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    CatholicTheme.lentenIndigo.withValues(alpha: 0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],

                if (customContent != null) ...[
                  const SizedBox(height: 24),
                  customContent!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
