import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';

class DailyThemeCard extends StatelessWidget {
  final String title;
  final String description;
  final String scripture;

  const DailyThemeCard({
    super.key,
    required this.title,
    required this.description,
    required this.scripture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CatholicTheme.lentenIndigo,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [

          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CatholicTheme.pureWhite,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 15,
              color: CatholicTheme.pureWhite.withValues(alpha: 0.8),
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: CatholicTheme.pureWhite.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "TODAY'S GOSPEL",
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: CatholicTheme.pureWhite.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  scripture,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    height: 1.6,
                    color: CatholicTheme.pureWhite,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
