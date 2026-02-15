import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/lent_state_provider.dart';
import '../services/bible_service.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';

class BibleStudyScreen extends StatefulWidget {
  const BibleStudyScreen({super.key});

  @override
  State<BibleStudyScreen> createState() => _BibleStudyScreenState();
}

class _BibleStudyScreenState extends State<BibleStudyScreen> {
  String _selectedTopic = 'Fasting';
  final List<String> _topics = [
    'Fasting',
    'Prayer',
    'Mercy',
    'Repentance',
    'Humility',
    'The Cross',
    'The Eucharist',
    'Silence',
    'Forgiveness',
    'Sacrifice',
    'Generosity',
    'Holy Spirit'
  ];
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controller with current topic's note
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = Provider.of<LentStateProvider>(context, listen: false);
      _notesController.text = state.getStudyNote(_selectedTopic);
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  final Map<String, String> _topicVerses = {
    'Fasting': 'Joel 2:12-13',
    'Prayer': 'Matthew 6:16-18',
    'Mercy': 'Isaiah 58:6-7',
    'Repentance': 'Luke 15:11-32',
    'Humility': 'Philippians 2:3-8',
    'The Cross': 'Matthew 16:24-26',
    'The Eucharist': 'John 6:51-58',
    'Silence': '1 Kings 19:11-13',
    'Forgiveness': 'Matthew 18:21-35',
    'Sacrifice': 'Romans 12:1-2',
    'Generosity': '2 Corinthians 9:6-11',
    'Holy Spirit': 'Ezekiel 36:26-27',
  };

  final Map<String, List<String>> _topicQuestions = {
    'Fasting': [
      'What are you physically hungry for today?',
      'How does fasting help you focus on God?',
      'What spiritual fruit are you hoping to cultivate through this fast?',
    ],
    'Prayer': [
      'When do you find it easiest to pray?',
      'Is your prayer a dialogue or a monologue?',
      'What is one thing you want to ask God for today?',
    ],
    'Mercy': [
      'Who in your life needs mercy or forgiveness today?',
      'How can you be a channel of God\'s mercy to others?',
      'Reflect on a time when you received unexpected mercy.',
    ],
    'Repentance': [
      'What is the "one thing" holding you back from God?',
      'How does the Sacrament of Reconciliation heal our relationship with the Church?',
      'Reflect on the Joy of the Father in the Prodigal Son story.',
    ],
    'Humility': [
      'How do you react when you are not recognized or praised?',
      'Who is a model of humility for you?',
      'How can you practice "smallness" today?',
    ],
    'The Cross': [
      'What does "taking up your cross" look like for you this week?',
      'Where do you see the suffering of Christ in the world today?',
      'How does the perspective of the Resurrection change your view of the Cross?',
    ],
    'The Eucharist': [
      'How does the Bread of Life sustain your spiritual journey?',
      'What does it mean to be "living bread" for others?',
      'Reflect on the sacrifice of the Mass as the source and summit of our faith.',
    ],
    'Silence': [
      'When was the last time you sat in complete silence with God?',
      'What noise (internal or external) is most distracting to your prayer?',
      'Can you commit to 5 minutes of total silence today?',
    ],
    'Forgiveness': [
      'Is there someone you find impossible to forgive? Ask God for help.',
      'How does holding a grudge affect your spiritual life?',
      'Reflect on the words "Forgive us our trespasses as we forgive those..."',
    ],
    'Sacrifice': [
      'What is the difference between a sacrifice and a daily task?',
      'What are you willing to "let die" so that God can bring new life?',
      'How can your daily sacrifices become a prayer of praise?',
    ],
    'Generosity': [
      'Do you give from your surplus or from your need?',
      'How has God been generous to you this Lenten season?',
      'Who is someone you can be "excessively" kind to today?',
    ],
    'Holy Spirit': [
      'Where do you feel the Spirit "stretching" you right now?',
      'Ask the Holy Spirit to reveal one area of your life that needs renewal.',
      'How can you be more docile to the promptings of the Spirit?',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LentStateProvider>();
    final reference = _topicVerses[_selectedTopic] ?? 'Joel 2:12-13';
    final verseText = BibleService.getVerse(reference, state.bibleVersion);
    final questions = _topicQuestions[_selectedTopic] ??
        ['Reflect on how this scripture speaks to your heart today.'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BIBLE STUDY'),
        backgroundColor: CatholicTheme.lentenIndigo,
        foregroundColor: Colors.white,
        leading: const BackButton(color: Colors.white),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Topic Selector
              Text(
                'Select Study Topic',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CatholicTheme.lentenIndigo,
                    ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _topics.map((topic) {
                  final isSelected = _selectedTopic == topic;
                  return FilterChip(
                    label: Text(topic),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        // Save current note before switching
                        state.saveStudyNote(
                            _selectedTopic, _notesController.text);
                        setState(() => _selectedTopic = topic);
                        // Load new note
                        _notesController.text = state.getStudyNote(topic);
                      }
                    },
                    backgroundColor: CatholicTheme.pureWhite,
                    selectedColor: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                    checkmarkColor: CatholicTheme.lentenIndigo,
                    side: BorderSide(
                      color: isSelected
                          ? CatholicTheme.lentenIndigo
                          : CatholicTheme.lentenIndigo.withValues(alpha: 0.2),
                      width: isSelected ? 2 : 1,
                    ),
                    labelStyle: TextStyle(
                      color: isSelected
                          ? CatholicTheme.lentenIndigo
                          : CatholicTheme.lentenIndigo.withValues(alpha: 0.7),
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              // Scripture Section
              HolyCard(
                isGlass: true,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          reference,
                          style: GoogleFonts.playfairDisplay(
                            fontWeight: FontWeight.bold,
                            color: CatholicTheme.lentenIndigo,
                            fontSize: 18,
                          ),
                        ),
                        DropdownButton<BibleVersion>(
                          value: state.bibleVersion,
                          onChanged: (v) =>
                              v != null ? state.setBibleVersion(v) : null,
                          items: BibleVersion.values
                              .map((v) => DropdownMenuItem(
                                    value: v,
                                    child: Text(v.name.toUpperCase(),
                                        style: const TextStyle(fontSize: 12)),
                                  ))
                              .toList(),
                          underline: const SizedBox(),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: CatholicTheme.lentenIndigo),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      verseText,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          height: 1.6,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.auto_awesome,
                            size: 16,
                            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.5)),
                        const SizedBox(width: 8),
                        Text('Reflect',
                            style: Theme.of(context).textTheme.labelSmall),
                        const SizedBox(width: 8),
                        Icon(Icons.auto_awesome,
                            size: 16,
                            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.5)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Reflection Questions
              Text(
                'Reflection Questions',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CatholicTheme.lentenIndigo,
                    ),
              ),
              const SizedBox(height: 16),
              ...questions.map((q) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: CatholicTheme.lentenIndigo
                                    .withValues(alpha: 0.1)),
                          ),
                          child: const Icon(Icons.help_outline,
                              color: CatholicTheme.lentenIndigo, size: 18),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            q,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontStyle: FontStyle.italic,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  )),

              const SizedBox(height: 30),

              // Notes area
              Text(
                'Study Notes',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CatholicTheme.lentenIndigo,
                    ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _notesController,
                maxLines: 6,
                onChanged: (text) {
                  state.saveStudyNote(_selectedTopic, text);
                },
                decoration: InputDecoration(
                  hintText: 'What is God saying to you today?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: CatholicTheme.lentenIndigo.withValues(alpha: 0.2)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: CatholicTheme.lentenIndigo.withValues(alpha: 0.2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: CatholicTheme.lentenIndigo, width: 2),
                  ),
                  fillColor: CatholicTheme.pureWhite,
                  filled: true,
                ),
                style: GoogleFonts.inter(fontSize: 18),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
