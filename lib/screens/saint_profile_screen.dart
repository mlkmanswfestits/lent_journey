import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lent_journey_catholic/l10n/app_localizations.dart';
import '../models/saint.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';

class SaintProfileScreen extends StatelessWidget {
  final Saint saint;

  const SaintProfileScreen({super.key, required this.saint});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CatholicTheme.softWhite,
              CatholicTheme.incenseWhite,
              CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 750, // Massive height for hero image
                pinned: true,
                stretch: true,
                backgroundColor: CatholicTheme.lentenIndigo,
                elevation: innerBoxIsScrolled ? 4 : 0,
                forceElevated: innerBoxIsScrolled,
                leading: BackButton(
                    color: innerBoxIsScrolled
                        ? Colors.white
                        : CatholicTheme.lentenIndigo),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                  ],
                  centerTitle: true,
                  titlePadding: const EdgeInsets.only(bottom: 16),
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: innerBoxIsScrolled ? 1.0 : 0.0,
                    child: Text(
                      saint.name.toUpperCase(),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // 1. Subtle Background Tint
                      Container(color: CatholicTheme.softWhite),

                      // 2. Clear Name & Art Hierarchy
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 20),
                        child: Column(
                          children: [
                            const SizedBox(
                                height: 40), // Clearance for back button
                            Text(
                              loc.celebratingLife.toUpperCase(),
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color:
                                    CatholicTheme.lentenIndigo.withValues(alpha: 0.4),
                                letterSpacing: 3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              saint.name.toUpperCase(),
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 42,
                                fontWeight: FontWeight.w900,
                                color: CatholicTheme.lentenIndigo,
                                letterSpacing: -0.5,
                              ),
                              textAlign: TextAlign.center,
                            ).animate().fadeIn().slideY(begin: -0.2, end: 0),
                            // Reduced gap between header and image
                            const SizedBox(height: 10),
                            Expanded(
                              child: saint.imagePath != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0, vertical: 12.0),
                                      child: Center(
                                        child: Image.asset(
                                          saint.imagePath!,
                                          fit: BoxFit.contain,
                                          alignment: Alignment.center,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Center(
                                            child: Text(
                                              saint.icon,
                                              style: const TextStyle(
                                                  fontSize: 180),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        saint.icon,
                                        style: const TextStyle(fontSize: 250),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
            child: Column(
              children: [
                // Name & Feast Day
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: CatholicTheme.lentenIndigo.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: CatholicTheme.lentenIndigo.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    loc.feastDayCaps(saint.feastDay.toUpperCase()),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: CatholicTheme.lentenIndigo,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                  ),
                ).animate().fadeIn(delay: 200.ms),
                const SizedBox(height: 48),

                // Bio Section - Now handles much longer content
                HolyCard(
                  isGlass: true,
                  padding: const EdgeInsets.all(28),
                  child: _buildSection(
                    context,
                    loc.spiritualBiography,
                    saint.briefBio,
                    Icons.history_edu,
                    CatholicTheme.lentenIndigo,
                  ),
                ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
                const SizedBox(height: 24),

                // Patronage Section
                HolyCard(
                  isGlass: true,
                  padding: const EdgeInsets.all(24),
                  child: _buildSection(
                    context,
                    loc.patronage,
                    saint.patronage,
                    Icons.stars,
                    CatholicTheme.lentenIndigo,
                  ),
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
                const SizedBox(height: 24),

                // Quote Section
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    HolyCard(
                      isGlass: true,
                      padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                      child: Column(
                        children: [
                          Text(
                            '"${saint.quote}"',
                            style: GoogleFonts.playfairDisplay(
                              fontStyle: FontStyle.italic,
                              fontSize: 24,
                              height: 1.5,
                              color: CatholicTheme.lentenIndigo,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Container(
                              height: 3,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: CatholicTheme.sacredGold
                                      .withValues(alpha: 0.4)))
                        ],
                      ),
                    ),
                    Positioned(
                      top: -20,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 15),
                            ],
                          ),
                          child: const Icon(Icons.format_quote,
                              color: CatholicTheme.sacredGold, size: 32),
                        ),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),
                const SizedBox(height: 40),

                // Prayer Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: CatholicTheme.lentenIndigo,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: CatholicTheme.lentenIndigo.withValues(alpha: 0.4),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        loc.intercessoryPrayer,
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                          height: 2,
                          width: 40,
                          color: CatholicTheme.sacredGold.withValues(alpha: 0.6)),
                      const SizedBox(height: 32),
                      Text(
                        saint.prayer,
                        style: GoogleFonts.inter(
                          height: 1.9,
                          fontSize: 18,
                          color: Colors.white.withValues(alpha: 0.95),
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Icon(Icons.church,
                          color: CatholicTheme.sacredGold.withValues(alpha: 0.9),
                          size: 32),
                    ],
                  ),
                ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.1),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content,
      IconData icon, Color iconColor) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 12),
            Text(
              title.toUpperCase(),
              style: theme.textTheme.labelLarge?.copyWith(
                color: CatholicTheme.lentenIndigo,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          content,
          style: GoogleFonts.inter(
            fontSize: 17,
            height: 1.8,
            color: CatholicTheme.deepSlate.withValues(alpha: 0.9),
          ),
        ),
      ],
    );
  }
}
