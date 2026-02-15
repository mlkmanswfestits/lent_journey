import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lent_journey_catholic/l10n/app_localizations.dart';
import '../models/guided_prayer.dart';
import '../providers/lent_state_provider.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';

class GuidedPrayerScreen extends StatefulWidget {
  final GuidedPrayer prayer;

  const GuidedPrayerScreen({super.key, required this.prayer});

  @override
  State<GuidedPrayerScreen> createState() => _GuidedPrayerScreenState();
}

class _GuidedPrayerScreenState extends State<GuidedPrayerScreen> {
  int _currentSectionIndex = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  void _nextSection() {
    if (_currentSectionIndex < widget.prayer.sections.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishPrayer();
    }
  }

  void _finishPrayer() {
    final loc = AppLocalizations.of(context)!;
    final state = Provider.of<LentStateProvider>(context, listen: false);
    state.addPrayerTime(widget.prayer.averageMinutes);
    state.incrementPrayerStreak();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.prayerCompleted,
            style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
        content: Text(
          loc.prayerCompletedMessage(widget.prayer.title),
          style: GoogleFonts.inter(fontSize: 16),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Return to Prayer Hub
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CatholicTheme.lentenIndigo,
              foregroundColor: Colors.white,
            ),
            child: Text(loc.amen),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isStations = widget.prayer.id == 'stations';

    return Scaffold(
      backgroundColor: CatholicTheme.softWhite,
      appBar: AppBar(
        title: Text(widget.prayer.title.toUpperCase()),
        centerTitle: true,
        backgroundColor: CatholicTheme.lentenIndigo,
        elevation: 0,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CatholicTheme.softWhite,
              CatholicTheme.incenseWhite,
              CatholicTheme.lentenIndigo.withValues(alpha: 0.05)
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: kToolbarHeight + 20),
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: (_currentSectionIndex + 1) /
                      widget.prayer.sections.length,
                  backgroundColor: CatholicTheme.lentenIndigo.withValues(alpha: 0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      CatholicTheme.lentenIndigo),
                  minHeight: 8,
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentSectionIndex = index;
                  });
                },
                itemCount: widget.prayer.sections.length,
                itemBuilder: (context, index) {
                  final section = widget.prayer.sections[index];
                  
                  // Determine image path
                  String? imageAsset = section.imagePath;
                  if (imageAsset == null) {
                    if (widget.prayer.id == 'rosary') {
                      imageAsset = 'assets/images/prayers/rosary_${index + 1}.png';
                    } else if (widget.prayer.id == 'examen') {
                      imageAsset = 'assets/images/prayers/daily_examen_${index + 1}.png';
                    } else if (widget.prayer.id == 'divine_mercy') {
                      imageAsset = 'assets/images/prayers/divine_mercy_${index + 1}.png';
                    }
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isStations) ...[
                          Text(
                            section.title,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              color: CatholicTheme.lentenIndigo,
                            ),
                          ),
                          Text(
                            loc.stationTitle('${index + 1}${_getOrdinal(index + 1)}').toUpperCase(),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              letterSpacing: 3,
                              fontWeight: FontWeight.bold,
                              color: CatholicTheme.lentenIndigo.withValues(alpha: 0.5),
                            ),
                          ),
                        ] else ...[
                          Text(
                            section.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: CatholicTheme.lentenIndigo,
                                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        
                        const SizedBox(height: 20),

                        // Artwork
                        if (imageAsset != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Image.asset(
                              imageAsset,
                              fit: BoxFit.contain,
                              height: 300, // Fixed height for consistency
                              alignment: Alignment.center,
                              errorBuilder: (context, error, stackTrace) {
                                // If image is missing (e.g. rosary_6), show nothing or placeholder
                                // For now, we'll hide it to avoid ugly errors if file count mismatch
                                return const SizedBox.shrink(); 
                              },
                            ),
                          ),

                        HolyCard(
                          isGlass: true,
                          child: Column(
                            children: [
                              Text(
                                section.text,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: CatholicTheme.lentenIndigo,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              if (section.instructions != null) ...[
                                const SizedBox(height: 20),
                                Text(
                                  section.instructions!,
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    height: 1.6,
                                    color: CatholicTheme.deepSlate,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  if (_currentSectionIndex > 0)
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: CatholicTheme.lentenIndigo),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _nextSection,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CatholicTheme.lentenIndigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      elevation: 8,
                      shadowColor: CatholicTheme.lentenIndigo.withValues(alpha: 0.5),
                    ),
                    child: Text(
                      _currentSectionIndex < widget.prayer.sections.length - 1
                          ? (isStations ? loc.nextStation : loc.continueButton)
                          : loc.completeButton,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.1),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  String _getOrdinal(int n) {
    if (n >= 11 && n <= 13) return 'th';
    switch (n % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
