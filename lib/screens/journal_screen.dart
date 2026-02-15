import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/lent_state_provider.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';
import '../widgets/ornate_header.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _contentController = TextEditingController();
  String? _selectedMood;

  final List<Map<String, dynamic>> _moods = [
    {'label': 'Peaceful', 'icon': '🕊️', 'value': 'peaceful'},
    {'label': 'Joyful', 'icon': '😊', 'value': 'joyful'},
    {'label': 'Grateful', 'icon': '🙏', 'value': 'grateful'},
    {'label': 'Struggling', 'icon': '😔', 'value': 'struggling'},
    {'label': 'Hopeful', 'icon': '✨', 'value': 'hopeful'},
    {'label': 'Reflective', 'icon': '🤔', 'value': 'reflective'},
  ];

  @override
  void initState() {
    super.initState();
    _loadTodayEntry();
  }

  void _loadTodayEntry() {
    final state = Provider.of<LentStateProvider>(context, listen: false);
    final entry = state.getJournalEntry(state.displayDay);
    if (entry != null) {
      _contentController.text = entry['content'] ?? '';
      _selectedMood = entry['mood'];
      setState(() {});
    }
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _saveEntry(LentStateProvider state) {
    if (_contentController.text.trim().isEmpty) return;

    state.saveJournalEntry(
      state.displayDay,
      _contentController.text.trim(),
      mood: _selectedMood,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Journal entry saved! 📝'),
        backgroundColor: CatholicTheme.lentenIndigo,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LentStateProvider>(
      builder: (context, state, _) {
        final allEntries = state.getAllJournalEntries();

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              'Lenten Journal',
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: CatholicTheme.lentenIndigo,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
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
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OrnateHeader(
                      title: 'Day ${state.displayDay} of 46',
                      subtitle: 'Record your thoughts and reflections',
                    )
                        .animate()
                        .fadeIn(delay: 100.ms)
                        .slideY(begin: -0.2, end: 0),

                    const SizedBox(height: 24),

                    // Mood Selector
                    Center(
                      child: Text(
                        'How are you feeling today?',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: CatholicTheme.lentenIndigo,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: _moods.map((mood) {
                        final isSelected = _selectedMood == mood['value'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMood =
                                  isSelected ? null : mood['value'] as String;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? CatholicTheme.lentenIndigo.withValues(alpha: 0.1)
                                  : Colors.white.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? CatholicTheme.lentenIndigo
                                    : CatholicTheme.lentenIndigo
                                        .withValues(alpha: 0.2),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(mood['icon'] as String,
                                    style: const TextStyle(fontSize: 18)),
                                const SizedBox(width: 6),
                                Text(
                                  mood['label'] as String,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: CatholicTheme.lentenIndigo,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ).animate().fadeIn(delay: 200.ms).scale(
                        begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),

                    const SizedBox(height: 24),

                    // Journal Entry Field
                    HolyCard(
                      isGlass: true,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: _contentController,
                            maxLines: 12,
                            decoration: InputDecoration(
                              hintText:
                                  'Write your thoughts, prayers, and reflections...',
                              hintStyle: TextStyle(
                                color: CatholicTheme.deepSlate.withValues(alpha: 0.4),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.6,
                              color: CatholicTheme.deepSlate,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () => _saveEntry(state),
                              icon: const Icon(Icons.save, size: 18),
                              label: const Text('Save Entry'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CatholicTheme.lentenIndigo,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 300.ms)
                        .slideY(begin: 0.1, end: 0),

                    const SizedBox(height: 32),

                    // Past Entries
                    if (allEntries.isNotEmpty) ...[
                      Center(
                        child: Text(
                          'Past Entries',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: CatholicTheme.lentenIndigo,
                              ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...allEntries.map((entry) {
                        final day = entry['day'] as int;
                        final content = entry['content'] as String;
                        final mood = entry['mood'] as String?;
                        final moodData = _moods.firstWhere(
                          (m) => m['value'] == mood,
                          orElse: () => {'label': '', 'icon': ''},
                        );

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: HolyCard(
                            isGlass: true,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: CatholicTheme.lentenIndigo
                                            .withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'Day $day',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: CatholicTheme.lentenIndigo,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    if (mood != null) ...[
                                      Text(moodData['icon'] as String,
                                          style: const TextStyle(fontSize: 16)),
                                      const SizedBox(width: 4),
                                      Text(
                                        moodData['label'] as String,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: CatholicTheme.deepSlate),
                                      ),
                                      const Spacer(),
                                    ],
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline,
                                          size: 18),
                                      color: Colors.red.shade300,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Delete Entry?'),
                                            content: const Text(
                                                'This action cannot be undone.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  state.deleteJournalEntry(day);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Delete',
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  content,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    height: 1.5,
                                    color: CatholicTheme.deepSlate,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
