import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lent_journey_catholic/l10n/app_localizations.dart';
import '../models/guided_prayers.dart';
import '../models/guided_prayer.dart';
import '../models/saint.dart';
import '../widgets/holy_card.dart';
import '../utils/theme.dart';
import 'guided_prayer_screen.dart';
import 'saint_profile_screen.dart';

class PrayerHubScreen extends StatelessWidget {
  const PrayerHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    const prayers = GuidedPrayers.allPrayers;
    final saints = SaintData.getLentenFeastSaints(loc);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
                expandedHeight: 550,
                pinned: true,
                stretch: true,
                backgroundColor: CatholicTheme.lentenIndigo,
                elevation: innerBoxIsScrolled ? 4 : 0,
                forceElevated: innerBoxIsScrolled,
                leading: const BackButton(color: Colors.white),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: innerBoxIsScrolled ? 1.0 : 0.0,
                    child: Text(
                      loc.prayerHubTitle,
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
                      // Light Background
                      Container(color: CatholicTheme.softWhite),

                      // Content: Title -> Icon
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              loc.prayerHeader,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: CatholicTheme.lentenIndigo,
                                letterSpacing: -0.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              loc.guidedMeditations.toUpperCase(),
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: CatholicTheme.lentenIndigo
                                    .withValues(alpha: 0.4),
                                letterSpacing: 3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Prayer Icon with Golden Glow
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // The Glow
                                Container(
                                  height: 280,
                                  width: 280,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: CatholicTheme.sacredGold.withValues(alpha: 0.4),
                                        blurRadius: 70,
                                        spreadRadius: 20,
                                      ),
                                      BoxShadow(
                                        color: CatholicTheme.sacredGold.withValues(alpha: 0.2),
                                        blurRadius: 100,
                                        spreadRadius: 40,
                                      ),
                                    ],
                                  ),
                                ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                                 .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.2, 1.2), duration: 3.seconds, curve: Curves.easeInOut),
                                
                                Container(
                                  height: 330,
                                  width: 330,
                                  child: Image.asset(
                                    'assets/images/icons/prayer.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ).animate().scale(
                                duration: 600.ms,
                                curve: Curves.easeOutBack),
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Guided Lenten Prayers Section - Moved to Top
              Center(
                child: Text(
                  loc.guidedPrayersTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  loc.guidedPrayersSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65, // Adjusted to fit larger icons
                ),
                itemCount: prayers.length,
                itemBuilder: (context, index) {
                  final prayer = prayers[index];
                  return _buildPrayerOption(context, prayer);
                },
              ),

              const SizedBox(height: 32),

              // Lenten Saints Section - Moved to Bottom
              Center(
                child: Text(
                  loc.lentenSaintsTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  loc.lentenSaintsSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: saints.length,
                itemBuilder: (context, index) {
                  final saint = saints[index];
                  return _buildSaintCard(context, saint, loc); // Passed loc
                },
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildSaintCard(BuildContext context, Saint saint, AppLocalizations loc) {
    String? iconAsset;
    final nameLower = saint.name.toLowerCase();

    if (nameLower.contains('casimir')) {
      iconAsset = 'assets/images/icons/saint_casimir.png';
    } else if (nameLower.contains('cyril')) {
      iconAsset = 'assets/images/icons/saint_cyril.png';
    } else if (nameLower.contains('john of god')) {
      iconAsset = 'assets/images/icons/saint_john_of_god.png';
    } else if (nameLower.contains('joseph')) {
      iconAsset = 'assets/images/icons/saint_joseph.png';
    } else if (nameLower.contains('patrick')) {
      iconAsset = 'assets/images/icons/saint_patrick.png';
    } else if (nameLower.contains('turibius')) {
      iconAsset = 'assets/images/icons/saint_turibius.png';
    } else if (nameLower.contains('paola')) {
      iconAsset = 'assets/images/icons/saint_francis_of_paola.png';
    } else if (nameLower.contains('gregory')) {
      iconAsset = 'assets/images/icons/saint_gregory_of_narek.png';
    } else if (nameLower.contains('polycarp')) {
      iconAsset = 'assets/images/icons/saint_polycarp.png';
    } else if (nameLower.contains('frances')) {
      iconAsset = 'assets/images/icons/saint_frances_of_rome.png';
    } else if (nameLower.contains('perpetua')) {
      iconAsset = 'assets/images/icons/saints_perpetua_and_felicity.png';
    } else if (nameLower.contains('drexel')) {
      iconAsset = 'assets/images/icons/saint_katherine.png';
    }

    return HolyCard(
      isGlass: true,
      padding: const EdgeInsets.all(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SaintProfileScreen(saint: saint),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Center(
              child: iconAsset != null
                  ? Image.asset(
                      iconAsset,
                      width: 120, // Doubled sized as requested
                      height: 120,
                      fit: BoxFit.contain,
                    )
                  : saint.imagePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            saint.imagePath!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              saint.icon,
                              style: const TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            saint.name.toUpperCase(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: CatholicTheme.lentenIndigo,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
          ),
          Text(
            loc.feastDay(saint.feastDay),
            style: GoogleFonts.inter(
              fontSize: 10,
              color: CatholicTheme.lentenIndigo.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerOption(BuildContext context, GuidedPrayer prayer) {
    return HolyCard(
      isGlass: true,
      padding: const EdgeInsets.all(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GuidedPrayerScreen(prayer: prayer),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: _getPrayerIcon(prayer)),
          const SizedBox(height: 12),
          Text(
            prayer.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Text(
            prayer.description,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '~${prayer.averageMinutes} min',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: CatholicTheme.lentenIndigo,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  Widget _getPrayerIcon(GuidedPrayer prayer) {
    String? assetPath;

    if (prayer.title.contains('Rosary')) {
      assetPath = 'assets/images/icons/rosary.png';
    } else if (prayer.title.contains('Stations')) {
      assetPath = 'assets/images/icons/stations_of_the_cross.png';
    } else if (prayer.title.contains('Divine Mercy')) {
      assetPath = 'assets/images/icons/divine_mercy_chaplet.png';
    } else if (prayer.title.contains('Examen')) {
      assetPath = 'assets/images/icons/journal.png';
    }

    if (assetPath != null) {
      return Image.asset(
        assetPath,
        height: 120, // Doubled from 60
        width: 120, // Doubled from 60
        fit: BoxFit.contain,
      );
    }

    return Text(
      prayer.icon,
      style: const TextStyle(fontSize: 36),
    );
  }
}
