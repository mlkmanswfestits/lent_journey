import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/lent_state_provider.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';
import 'examination_screen.dart';

class ConfessionPrepScreen extends StatefulWidget {
  const ConfessionPrepScreen({super.key});

  @override
  State<ConfessionPrepScreen> createState() => _ConfessionPrepScreenState();
}

class _ConfessionPrepScreenState extends State<ConfessionPrepScreen> {
  final List<Map<String, dynamic>> _examinationQuestions = [
    {
      'category': 'Relationship with God',
      'questions': [
        'Have I loved God above all things, or have I put other things (money, career, pleasure) first?',
        'Have I prayed today? Have I been faithful to my Lenten commitments?',
        'Have I used God\'s name in vain or been irreverent in church?',
      ]
    },
    {
      'category': 'Relationship with Others',
      'questions': [
        'Have I been angry, resentful, or unforgiving toward anyone?',
        'Have I gossiped or spoken ill of others?',
        'Have I been honest in my dealings with others?',
        'Have I neglected my duties to my family or community?',
      ]
    },
    {
      'category': 'Purity and Self-Control',
      'questions': [
        'Have I given in to impure thoughts or actions?',
        'Have I been greedy or selfish with my resources?',
        'Have I practiced temperance in food, drink, and entertainment?',
      ]
    },
  ];

  final Map<String, bool> _checkedSins = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONFESSION PREPARATION'),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Card
              HolyCard(
                isGlass: true,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      'Examination of Conscience',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: CatholicTheme.lentenIndigo,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Icon(Icons.psychology,
                        size: 40, color: CatholicTheme.lentenIndigo),
                    const SizedBox(height: 12),
                    Text(
                      'Take a moment to reflect on your actions since your last confession. In the silence of your heart, ask the Holy Spirit for light.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: CatholicTheme.deepSlate.withValues(alpha: 0.7),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Button to Comprehensive Examination
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExaminationScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.checklist),
                  label: const Text('COMPREHENSIVE EXAMINATION'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CatholicTheme.sacredGold,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ..._examinationQuestions.map((section) => Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: HolyCard(
                      isGlass: true,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star_outline,
                                  color: CatholicTheme.lentenIndigo),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  section['category'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: CatholicTheme.lentenIndigo,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 24),
                          ...List<String>.from(section['questions'])
                              .map((q) => CheckboxListTile(
                                    title: Text(q,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    value: _checkedSins[q] ?? false,
                                    activeColor: CatholicTheme.lentenIndigo,
                                    checkColor: CatholicTheme.pureWhite,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    onChanged: (val) => setState(
                                        () => _checkedSins[q] = val ?? false),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  )),
                        ],
                      ),
                    ),
                  )),

              const SizedBox(height: 10),

              // How to Confess
              Text(
                'How to Confess',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CatholicTheme.lentenIndigo,
                    ),
              ),
              const SizedBox(height: 16),
              HolyCard(
                isGlass: true,
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    _receiptStep(
                        context,
                        '1. Greeting',
                        'The priest will greet you. Make the Sign of the Cross.',
                        true),
                    _receiptStep(
                        context,
                        '2. Introduction',
                        'Say: "Bless me Father, for I have sinned. It has been [time] since my last confession."',
                        false),
                    _receiptStep(context, '3. Confession',
                        'Confess your sins simply and honestly.', true),
                    _receiptStep(
                        context,
                        '4. Act of Contrition',
                        'The priest will give you a penance and ask you to pray the Act of Contrition.',
                        false),
                    _receiptStep(
                        context,
                        '5. Absolution',
                        'The priest gives you absolution. Respond "Amen."',
                        true),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: Consumer<LentStateProvider>(
                  builder: (context, state, child) {
                    final isLogged = state.isConfessionLogged(state.currentDay);
                    return ElevatedButton.icon(
                      onPressed: isLogged
                          ? null
                          : () {
                              state.logConfession(state.currentDay);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Confession Logged! May God bless your journey. 🕊️'),
                                  backgroundColor: CatholicTheme.lentenIndigo,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                      icon: Icon(isLogged ? Icons.check_circle : Icons.church),
                      label: Text(isLogged ? 'CONFESSION LOGGED' : 'I HAVE COMPLETED CONFESSION'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isLogged ? Colors.grey : CatholicTheme.sacredGold,
                        foregroundColor: isLogged ? Colors.white70 : Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 4,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    const query = 'Catholic Church';
                    final url = Uri.parse(
                        'https://www.google.com/maps/search/?api=1&query=$query');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text('FIND A CONFESSION NEAR ME'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CatholicTheme.lentenIndigo,
                    foregroundColor: CatholicTheme.pureWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 4,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _receiptStep(
      BuildContext context, String title, String desc, bool isOdd) {
    return Container(
      color: isOdd
          ? CatholicTheme.lentenIndigo.withValues(alpha: 0.02)
          : Colors.transparent,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: CatholicTheme.lentenIndigo,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
