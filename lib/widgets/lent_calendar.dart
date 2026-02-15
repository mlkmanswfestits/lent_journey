import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../utils/theme.dart';

class LentCalendar extends StatelessWidget {
  final int currentDay;
  final int totalDays;
  final DateTime startDate;
  final Function(int) onDayTap;

  final Set<int>? daysWithMeals;
  final Set<int>? daysWithSacrifices;
  final Set<int>? daysWithJournal;

  const LentCalendar({
    super.key,
    required this.currentDay,
    required this.totalDays,
    required this.startDate,
    required this.onDayTap,
    this.daysWithMeals,
    this.daysWithSacrifices,
    this.daysWithJournal,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8, // Adjusted for two lines of text
        ),
        itemCount: totalDays,
        itemBuilder: (context, index) {
          final day = index + 1;
          final isPast = day < currentDay;
          final isCurrent = day == currentDay;

          final date = startDate.add(Duration(days: day - 1));
          final isSunday = date.weekday == DateTime.sunday;
          final dateStr = DateFormat('MMM d').format(date);
          final isEaster = day == 47; // April 5th 2026

          Color backgroundColor;
          Color textColor;
          Color? dateColor;
          Border? border;
          List<BoxShadow>? shadows;

          if (isEaster) {
            backgroundColor = CatholicTheme.sacredGold;
            textColor = Colors.black;
            dateColor = Colors.black.withValues(alpha: 0.7);
            shadows = [
              BoxShadow(
                color: CatholicTheme.sacredGold.withValues(alpha: 0.4),
                blurRadius: 15,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ];
          } else if (isCurrent) {
            backgroundColor = CatholicTheme.lentenIndigo;
            textColor = CatholicTheme.pureWhite;
            dateColor = CatholicTheme.pureWhite.withValues(alpha: 0.9);
            shadows = [
              BoxShadow(
                color: CatholicTheme.lentenIndigo.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ];
          } else if (isPast) {
            backgroundColor = CatholicTheme.lentenIndigo.withValues(alpha: 0.05);
            textColor = CatholicTheme.lentenIndigo.withValues(alpha: 0.4);
            dateColor = CatholicTheme.lentenIndigo.withValues(alpha: 0.3);
          } else if (isSunday) {
            backgroundColor = CatholicTheme.lentenIndigo.withValues(alpha: 0.05);
            textColor = CatholicTheme.lentenIndigo;
            dateColor = CatholicTheme.lentenIndigo.withValues(alpha: 0.7);
            border =
                Border.all(color: CatholicTheme.lentenIndigo.withValues(alpha: 0.2));
          } else {
            backgroundColor = CatholicTheme.softWhite;
            textColor = CatholicTheme.deepSlate.withValues(alpha: 0.8);
            dateColor = CatholicTheme.lentenIndigo.withValues(alpha: 0.5);
            border = Border.all(color: CatholicTheme.lightGrey);
          }
          
          // Check logging status
          final hasMeal = daysWithMeals?.contains(day) ?? false;
          final hasFast = daysWithSacrifices?.contains(day) ?? false;
          final hasJournal = daysWithJournal?.contains(day) ?? false;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onDayTap(day),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: border,
                  boxShadow: shadows,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$day',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (hasMeal) 
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1),
                            width: 3, height: 3, 
                            decoration: BoxDecoration(
                              color: isCurrent || isEaster ? Colors.white : CatholicTheme.lentenIndigo,
                              shape: BoxShape.circle
                            )
                          ),
                        if (hasFast)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1),
                            width: 3, height: 3, 
                            decoration: BoxDecoration(
                              color: isCurrent || isEaster ? CatholicTheme.sacredGold : CatholicTheme.sacredGold,
                              shape: BoxShape.circle
                            )
                          ),
                         if (hasJournal)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1),
                            width: 3, height: 3, 
                            decoration: BoxDecoration(
                              color: isCurrent || isEaster ? Colors.white : Colors.teal,
                              shape: BoxShape.circle
                            )
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
