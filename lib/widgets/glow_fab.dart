import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/theme.dart';

class GlowFab extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String? label;
  final List<Color>? gradientColors;
  final Color? glowColor;

  const GlowFab({
    super.key,
    required this.onPressed,
    required this.icon,
    this.label,
    this.gradientColors,
    this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ??
        [
          CatholicTheme.lentenIndigo,
          const Color(0xFF6A0DAD), // Slightly lighter violet
        ];

    final glow = glowColor ?? CatholicTheme.lentenIndigo.withValues(alpha: 0.4);

    return Animate(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: glow,
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: label != null ? 20 : 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white, size: 28),
                  if (label != null) ...[
                    const SizedBox(width: 10),
                    Text(
                      label!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scale(
            begin: const Offset(1, 1),
            end: const Offset(1.05, 1.05),
            duration: 2.seconds,
            curve: Curves.easeInOut,
          ),
    );
  }
}
