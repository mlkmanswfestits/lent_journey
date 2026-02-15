import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/lent_state_provider.dart';
import 'package:lent_journey_catholic/l10n/app_localizations.dart';
import '../utils/theme.dart';
import '../widgets/daily_theme_card.dart';
import '../widgets/pillar_card.dart';
import '../widgets/lent_calendar.dart';
import '../widgets/pillar_dashboard.dart';
import '../widgets/holy_card.dart';
import '../widgets/ornate_header.dart';
import 'prayer_hub_screen.dart';
import 'fasting_screen.dart';
import 'almsgiving_screen.dart';
import 'daily_detail_screen.dart';
import 'bible_study_screen.dart';
import 'confession_prep_screen.dart';
import 'journal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<LentStateProvider>().checkDateUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
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
        child: Consumer<LentStateProvider>(
          builder: (context, state, child) {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 520,
                    pinned: false,
                    stretch: true,
                    backgroundColor: CatholicTheme.lentenIndigo,
                    elevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      centerTitle: true,
                      background: Container(
                        color: Colors.black, // Background for the art
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/images/lent_journey_art.png',
                              fit: BoxFit.cover,
                            ),
                            // Gradient overlay for better text readability at the bottom
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withValues(alpha: 0.3),
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.6),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 24,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Text(
                                  state.displayDay < 47
                                      ? loc.themeDefault(state.displayDay).toUpperCase()
                                      : loc.themeEaster.toUpperCase(),
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: CatholicTheme.sacredGold,
                                    letterSpacing: 2,
                                    shadows: [
                                      const Shadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 800.ms),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    // Progress Indicator (simplified version for the main list)
                    OrnateHeader(
                      title: loc.journeyToEaster,
                      subtitle: loc.walkHumbly,
                      progress: state.progress,
                      progressLabel:
                          '${(state.progress * 100).toStringAsFixed(0)}% ${loc.toEaster}',
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: 24),

                    // Daily Theme Card (Wrapped in HolyCard for consistency)
                    HolyCard(
                      isGlass: true,
                      padding: EdgeInsets.zero,
                      child: DailyThemeCard(
                        title: state.getTodayTheme(loc),
                        description: loc.todayTheme,
                        scripture: state.getTodayScripture(loc),
                      ),
                    ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1, end: 0),
                    const SizedBox(height: 32),

                    // Three Pillars Section
                    Center(
                      child: Column(
                        children: [
                          Text(
                            loc.threePillars,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CatholicTheme.lentenIndigo,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 100,
                            height: 2,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  CatholicTheme.sacredGold,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 16),

                    PillarCard(
                      title: loc.pillarPrayer,
                      imageAsset: 'assets/images/icons/prayer.png',
                      value: '${state.prayerTime} min',
                      goal: 'Goal: 15 min',
                      streak: state.prayerStreak,
                      color: CatholicTheme.lentenIndigo,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PrayerHubScreen())),
                    )
                        .animate()
                        .fadeIn(delay: 600.ms)
                        .slideX(begin: -0.1, end: 0),
                    const SizedBox(height: 16),

                    PillarCard(
                      title: loc.pillarFasting,
                      imageAsset: 'assets/images/icons/fasting.png',
                      value: state.isFasting ? 'Active' : 'Inactive',
                      goal: 'Fri Abstinence',
                      streak: state.fastingStreak,
                      color: CatholicTheme.lentenIndigo,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const FastingScreen())),
                    ).animate().fadeIn(delay: 700.ms).scale(
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1, 1)),
                    const SizedBox(height: 16),

                    PillarCard(
                      title: loc.pillarAlmsgiving,
                      imageAsset: 'assets/images/icons/almsgiving.png',
                      value: '\$${state.almsgivingAmount.toStringAsFixed(0)}',
                      goal: 'Goal: \$${state.almsgivingGoal.toStringAsFixed(0)}',
                      streak: state.almsgivingStreak,
                      color: CatholicTheme.lentenIndigo,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AlmsgivingScreen())),
                    ).animate().fadeIn(delay: 800.ms).slideX(begin: 0.1, end: 0),
                    const SizedBox(height: 32),

                    // Lenten Calendar - Moved above challenge
                    Center(
                      child: Column(
                        children: [
                          Text(
                            loc.lentenCalendar,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CatholicTheme.lentenIndigo,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 100,
                            height: 2,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  CatholicTheme.sacredGold,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    HolyCard(
                      isGlass: true,
                      showCross: true,
                      padding: EdgeInsets.zero,
                      child: LentCalendar(
                        currentDay: state.displayDay,
                        totalDays: 47,
                        startDate: state.lentStartDate,
                        // Pass logged data for visual indicators
                        daysWithMeals: state.daysWithMeals,
                        daysWithSacrifices: state.daysWithSacrifices,
                        daysWithJournal: state.daysWithJournal,
                        onDayTap: (day) {
                          // Update the home screen view to this day
                          state.setViewingDay(day);
                          // Also navigate to detail for convenience/deep dive
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DailyDetailScreen(day: day),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Advanced Features
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: LayoutBuilder(builder: (context, constraints) {
                        const spacing = 12.0;
                        return Wrap(
                          alignment: WrapAlignment.center,
                          spacing: spacing,
                          runSpacing: spacing,
                          children: [
                            _buildColumnFeature(
                                context,
                                loc.bibleStudy,
                                Icons.menu_book,
                                145,
                                900,
                                () => const BibleStudyScreen(),
                                'bible.png'),
                            _buildColumnFeature(
                                context,
                                loc.confession,
                                Icons.church,
                                145,
                                950,
                                () => const ConfessionPrepScreen(),
                                'confession.png'),
                            _buildColumnFeature(
                                context,
                                loc.journal,
                                Icons.edit_note,
                                145,
                                1000,
                                () => const JournalScreen(),
                                'journal.png'),
                          ],
                        );
                      }),
                    ).animate().fadeIn(delay: 1000.ms),

                    const SizedBox(height: 32),

                    _buildDailyChallenge(context, state, loc)
                        .animate()
                        .fadeIn(delay: 1100.ms)
                        .scale(
                            begin: const Offset(0.95, 0.95),
                            end: const Offset(1, 1)),
                    const SizedBox(height: 32),

                    const SizedBox(height: 32),

                    // Church Finder Button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                'https://www.google.com/maps/search/?api=1&query=Catholic+churches+near+me');
                            if (!await launchUrl(url)) {
                              debugPrint('Could not launch $url');
                            }
                          },
                          icon: const Icon(Icons.location_on),
                          label: Text(loc.findMass),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: CatholicTheme.lentenIndigo,
                            side: const BorderSide(
                                color: CatholicTheme.lentenIndigo),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ).animate().fadeIn(delay: 1200.ms).slideY(begin: 0.1, end: 0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDailyChallenge(BuildContext context, LentStateProvider state, AppLocalizations loc) {
    return HolyCard(
      isGlass: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.stars, color: CatholicTheme.lentenIndigo),
              const SizedBox(width: 8),
              Text(
                loc.dailyChallenge,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            state.getDailyChallenge(loc),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: state.isChallengeCompleted
                  ? null
                  : () {
                      state.completeChallenge();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Challenge completed! Deo Gratias!')),
                      );
                    },
              child: Text(state.isChallengeCompleted
                  ? loc.completed
                  : loc.markComplete),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnFeature(BuildContext context, String title, IconData icon,
      double width, int delayMs, Widget Function() builder, String? asset,
      {bool useSerif = false}) {
    return SizedBox(
      width: width,
      child: _buildSmallFeatureCard(
        context,
        title,
        icon,
        CatholicTheme.lentenIndigo,
        () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => builder())),
        imageAsset: asset != null ? 'assets/images/icons/$asset' : null,
        useSerif: useSerif,
      ).animate().fadeIn(delay: delayMs.ms).slideY(begin: 0.1, end: 0),
    );
  }

  Widget _buildSmallFeatureCard(BuildContext context, String title,
      IconData icon, Color color, VoidCallback onTap,
      {String? imageAsset, bool useSerif = false}) {
    return HolyCard(
      isGlass: true,
      onTap: onTap,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          imageAsset != null
              ? Image.asset(
                  imageAsset,
                  height: 120, // Increased to match prayer page
                  width: 120, // Increased to match prayer page
                  fit: BoxFit.contain,
                )
              : Icon(icon, color: color, size: 64),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                (useSerif ? GoogleFonts.playfairDisplay() : GoogleFonts.inter())
                    .copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
