import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/examination_of_conscience.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';

class ExaminationScreen extends StatefulWidget {
  const ExaminationScreen({super.key});

  @override
  State<ExaminationScreen> createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  final Set<int> _checkedQuestions = {};
  String _notes = '';

  @override
  Widget build(BuildContext context) {
    final categories = ExaminationOfConscience.getAllCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Examination of Conscience'),
        centerTitle: true,
        backgroundColor: CatholicTheme.lentenIndigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Introduction Card
            HolyCard(
              showCross: true,
              backgroundColor: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
              child: Column(
                children: [
                  Icon(
                    Icons.self_improvement,
                    size: 48,
                    color: CatholicTheme.lentenIndigo,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Prepare Your Heart',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CatholicTheme.lentenIndigo,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Take time to reflect on these questions before confession. Be honest with yourself and trust in God\'s mercy.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: CatholicTheme.deepSlate.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Categories
            ...categories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildCategoryCard(category, index),
              );
            }),

            const SizedBox(height: 24),

            // Notes Section
            HolyCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.edit_note, color: CatholicTheme.lentenIndigo),
                      const SizedBox(width: 8),
                      Text(
                        'Private Notes',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CatholicTheme.lentenIndigo,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    maxLines: 5,
                    onChanged: (value) => setState(() => _notes = value),
                    decoration: InputDecoration(
                      hintText: 'Write any thoughts or sins you want to remember for confession...',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        color: CatholicTheme.subtleGrey.withValues(alpha: 0.5),
                      ),
                      filled: true,
                      fillColor: CatholicTheme.incenseWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.lock,
                        size: 14,
                        color: CatholicTheme.subtleGrey,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Your notes are private and never saved',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: CatholicTheme.subtleGrey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action Button
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Ready for Confession?',
                      style: GoogleFonts.playfairDisplay(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      'Remember: God\'s mercy is infinite. Approach the sacrament with a contrite heart and trust in His love.',
                      style: GoogleFonts.inter(fontSize: 14),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('CONTINUE REFLECTING'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CatholicTheme.lentenIndigo,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('I\'M READY'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.check_circle),
              label: const Text('COMPLETE EXAMINATION'),
              style: ElevatedButton.styleFrom(
                backgroundColor: CatholicTheme.lentenIndigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(ExaminationCategory category, int categoryIndex) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      backgroundColor: CatholicTheme.pureWhite,
      collapsedBackgroundColor: CatholicTheme.pureWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: CatholicTheme.lightGrey),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: CatholicTheme.lightGrey),
      ),
      leading: Text(
        category.icon,
        style: const TextStyle(fontSize: 24),
      ),
      title: Text(
        category.title,
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: CatholicTheme.deepSlate,
        ),
      ),
      subtitle: Text(
        '${category.questions.length} questions',
        style: GoogleFonts.inter(
          fontSize: 12,
          color: CatholicTheme.subtleGrey,
        ),
      ),
      children: category.questions.asMap().entries.map((entry) {
        final questionIndex = entry.key;
        final question = entry.value;
        final globalIndex = categoryIndex * 100 + questionIndex;
        final isChecked = _checkedQuestions.contains(globalIndex);

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: HolyCard(
            padding: const EdgeInsets.all(12),
            backgroundColor: isChecked
                ? CatholicTheme.palmGreen.withValues(alpha: 0.1)
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            _checkedQuestions.add(globalIndex);
                          } else {
                            _checkedQuestions.remove(globalIndex);
                          }
                        });
                      },
                      activeColor: CatholicTheme.palmGreen,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.question,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: CatholicTheme.deepSlate,
                              ),
                            ),
                            if (question.reflection != null) ...[
                              const SizedBox(height: 6),
                              Text(
                                question.reflection!,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  color: CatholicTheme.subtleGrey,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
