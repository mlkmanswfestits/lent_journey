import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PillarDashboard extends StatelessWidget {
  final int prayerTime;
  final int prayerGoal;
  final double almsgivingAmount;
  final double almsgivingGoal;
  final bool isFasting;
  final String fastingStatus;

  const PillarDashboard({
    super.key,
    required this.prayerTime,
    required this.prayerGoal,
    required this.almsgivingAmount,
    required this.almsgivingGoal,
    required this.isFasting,
    required this.fastingStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFF120A8F).withValues(alpha: 0.02),
            const Color(0xFFD4AF37).withValues(alpha: 0.03),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF120A8F).withValues(alpha: 0.15),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF120A8F).withValues(alpha: 0.12),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF120A8F).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.auto_graph,
                  color: const Color(0xFF120A8F),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Lenten Pillars Tracker',
                style: GoogleFonts.playfairDisplay(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF120A8F),
                    letterSpacing: 0.5),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _buildPillarCircle('Prayer', prayerTime / prayerGoal,
                    '${prayerTime}m', const Color(0xFF120A8F)),
              ),
              Expanded(
                child: _buildPillarCircle('Fasting', isFasting ? 1.0 : 0.0,
                    fastingStatus, const Color(0xFF556B2F)),
              ),
              Expanded(
                child: _buildPillarCircle(
                    'Alms',
                    almsgivingAmount / almsgivingGoal,
                    '\$${almsgivingAmount.toStringAsFixed(0)}',
                    const Color(0xFFD4AF37)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPillarCircle(
      String label, double percent, String value, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.2),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  value: percent.clamp(0.0, 1.0),
                  strokeWidth: 12,
                  backgroundColor: color.withValues(alpha: 0.15),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          label,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
