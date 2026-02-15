import 'package:flutter/material.dart';
import 'package:lent_journey_catholic/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/daily_detail.dart';
import '../providers/lent_state_provider.dart';
import '../models/saint.dart';
import '../models/liturgy_hours.dart';
import '../services/bible_service.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';
import 'confession_prep_screen.dart';
import 'saint_profile_screen.dart';

class DailyDetailScreen extends StatefulWidget {
  final int day;

  const DailyDetailScreen({super.key, required this.day});

  @override
  State<DailyDetailScreen> createState() => _DailyDetailScreenState();
}

class _GuidedSection extends StatelessWidget {
  final String title;
  final Widget child;
  final Color? color;
  const _GuidedSection({required this.title, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color ?? CatholicTheme.lentenIndigo,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        child,
        const SizedBox(height: 24),
      ],
    );
  }
}

class _DailyDetailScreenState extends State<DailyDetailScreen> {
  late TextEditingController _journalController;

  @override
  void initState() {
    super.initState();
    final state = Provider.of<LentStateProvider>(context, listen: false);
    final entry = state.getJournalEntry(widget.day);
    _journalController = TextEditingController(text: entry?['content'] ?? '');
  }

  @override
  void dispose() {
    _journalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final detail = DailyData.getDayDetail(widget.day, loc);
    final state = Provider.of<LentStateProvider>(context);
    final saint = SaintData.getSaintForDay(widget.day, loc);
    final hours = LiturgyHoursData.getHoursForDay(widget.day);
    final theme = Theme.of(context);
    final isEaster = widget.day == 47;
    final primaryColor = isEaster ? CatholicTheme.sacredGold : CatholicTheme.lentenIndigo;
    final onPrimaryColor = isEaster ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.dayDetail(widget.day)),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Theme Section
            _GuidedSection(
              title: isEaster ? loc.easterTheme : loc.dailyTheme,
              color: primaryColor,
              child: HolyCard(
                backgroundColor: primaryColor.withValues(alpha: 0.1),
                child: Text(
                  detail.theme,
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: isEaster ? Colors.orange.shade900 : CatholicTheme.lentenIndigo,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Scripture Section with Version Switcher
            _GuidedSection(
              title: loc.dailyScripture,
              color: primaryColor,
              child: Column(
                children: [
                  HolyCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              loc.todaysGospel,
                              style: theme.textTheme.labelLarge
                                  ?.copyWith(color: primaryColor),
                            ),
                            DropdownButton<BibleVersion>(
                              value: state.bibleVersion,
                              underline: const SizedBox(),
                              icon: Icon(Icons.arrow_drop_down,
                                  color: primaryColor),
                              onChanged: (version) {
                                if (version != null) state.setBibleVersion(version);
                              },
                              items: BibleVersion.values.map((v) {
                                return DropdownMenuItem(
                                  value: v,
                                  child: Text(v.name.toUpperCase(),
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(fontWeight: FontWeight.bold)),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 8),
                        Text(
                          BibleService.getVerse(
                              detail.scriptureReading.split(' - ')[0],
                              state.bibleVersion),
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          detail.scriptureReading,
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Saint of the Day
            if (saint != null)
              _GuidedSection(
                title: loc.saintOfDay,
                color: primaryColor,
                child: HolyCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SaintProfileScreen(saint: saint),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      if (saint.imagePath != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            saint.imagePath!,
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(saint.name,
                            style: theme.textTheme.headlineMedium,
                            textAlign: TextAlign.center),
                        Text('${loc.patronage}: ${saint.patronage}',
                            style: theme.textTheme.bodySmall,
                            textAlign: TextAlign.center),
                      ] else
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: primaryColor.withValues(alpha: 0.2)),
                              ),
                              child: Icon(Icons.person, color: primaryColor),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(saint.name,
                                      style: theme.textTheme.headlineMedium),
                                  Text('${loc.patronage}: ${saint.patronage}',
                                      style: theme.textTheme.bodySmall),
                                ],
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 16),
                      Text(saint.briefBio, style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: primaryColor.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '"${saint.quote}"',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: CatholicTheme.deepSlate,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Liturgy of the Hours
            _GuidedSection(
              title: loc.liturgyOfHours,
              color: primaryColor,
              child: HolyCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: hours
                      .map((hour) => ExpansionTile(
                            title: Text(hour.name,
                                style: theme.textTheme.headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            subtitle: Text(hour.significance,
                                style: theme.textTheme.bodySmall),
                            iconColor: primaryColor,
                            collapsedIconColor:
                                primaryColor.withValues(alpha: 0.5),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildLiturgyPart(
                                        context, 'Opening', hour.openingPrayer, primaryColor),
                                    const SizedBox(height: 12),
                                    _buildLiturgyPart(context, 'Short Reading',
                                        hour.shortReading, primaryColor,
                                        isItalic: true),
                                    const SizedBox(height: 12),
                                    _buildLiturgyPart(
                                        context, 'Closing', hour.closingPrayer, primaryColor),
                                  ],
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),

            // Reflection Section
            _GuidedSection(
              title: loc.dailyReflection,
              color: primaryColor,
              child: HolyCard(
                child: Text(
                  detail.reflection,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),

            // Prayer Section
            _GuidedSection(
              title: loc.dailyPrayer,
              color: primaryColor,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Opacity(
                        opacity: 0.05,
                        child: SvgPicture.asset(
                          'assets/images/lent_texture.svg',
                          fit: BoxFit.cover,
                          placeholderBuilder: (_) => const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                  HolyCard(
                    backgroundColor: Colors.transparent,
                    child: Column(
                      children: [
                        Icon(Icons.auto_awesome,
                            color: primaryColor, size: 24),
                        const SizedBox(height: 16),
                        Text(
                          detail.prayer,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          loc.amen,
                          style: theme.textTheme.labelLarge
                              ?.copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Fasting Level Section
            _GuidedSection(
              title: loc.lentenDiscipline,
              color: primaryColor,
              child: HolyCard(
                child: Row(
                  children: [
                    Icon(Icons.restaurant_menu,
                        color: primaryColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        detail.fastingDescription,
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Confession Status Section
            _GuidedSection(
              title: loc.sacramentalLife,
              color: primaryColor,
              child: HolyCard(
                backgroundColor: state.isConfessionLogged(widget.day)
                    ? CatholicTheme.sacredGold.withValues(alpha: 0.1)
                    : null,
                child: Row(
                  children: [
                    Icon(
                      state.isConfessionLogged(widget.day)
                          ? Icons.verified_user
                          : Icons.church,
                      color: state.isConfessionLogged(widget.day)
                          ? Colors.orange.shade800
                          : primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.isConfessionLogged(widget.day)
                                ? loc.stateOfGrace
                                : loc.sacramentOfPenance,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: state.isConfessionLogged(widget.day)
                                  ? Colors.orange.shade900
                                  : primaryColor,
                            ),
                          ),
                          Text(
                            state.isConfessionLogged(widget.day)
                                ? loc.absolutionReceived
                                : loc.confessionPrompt,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    if (!state.isConfessionLogged(widget.day))
                      TextButton(
                        onPressed: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConfessionPrepScreen(),
                            ),
                          );
                        },
                        child: Text(loc.prepare),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Journal Section
            Text(
              loc.spiritualJournal,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _journalController,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: loc.journalHint,
                filled: true,
                fillColor: CatholicTheme.pureWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      color: primaryColor.withValues(alpha: 0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: CatholicTheme.lentenIndigo, width: 2),
                ),
              ),
              style: theme.textTheme.bodyLarge,
              onChanged: (text) {
                state.saveJournalEntry(widget.day, text, mood: null);
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildLiturgyPart(
      BuildContext context, String label, String content, Color primaryColor,
      {bool isItalic = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(height: 4),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal),
        ),
      ],
    );
  }
}
