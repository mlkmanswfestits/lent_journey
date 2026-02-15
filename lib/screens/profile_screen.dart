import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/lent_state_provider.dart';
import '../services/bible_service.dart';
import 'package:lent_journey_catholic/l10n/app_localizations.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.profileTitle),
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
        child: Consumer<LentStateProvider>(builder: (context, state, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Header
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background glow/texture
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                CatholicTheme.lentenIndigo,
                                CatholicTheme.lentenIndigo.withValues(alpha: 0.8)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(
                              color:
                                  CatholicTheme.lentenIndigo.withValues(alpha: 0.2),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          loc.lentenPilgrim,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(fontSize: 28),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: CatholicTheme.lentenIndigo
                                    .withValues(alpha: 0.1)),
                          ),
                          child: Text(
                            loc.dayXofY(state.currentDay, 46),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: CatholicTheme.lentenIndigo,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Stats Overview
                Center(
                  child: Text(
                    loc.yourJourney,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: CatholicTheme.lentenIndigo,
                        ),
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        context,
                        loc.prayerTime,
                        '${state.prayerTime}m',
                        Icons.auto_awesome,
                        CatholicTheme.lentenIndigo,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        loc.fastingStreak,
                        '${state.fastingStreak}d',
                        Icons.restaurant,
                        CatholicTheme.lentenIndigo,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        context,
                        loc.totalDonated,
                        '\$${state.totalDonated.toStringAsFixed(0)}',
                        Icons.volunteer_activism,
                        CatholicTheme.lentenIndigo,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        loc.mercyActs,
                        '${state.mercyCount}',
                        Icons.favorite,
                        CatholicTheme.lentenIndigo,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Settings
                Center(
                  child: Text(
                    loc.settings,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: CatholicTheme.lentenIndigo,
                        ),
                  ),
                ),
                const SizedBox(height: 16),

                HolyCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: Text(loc.dailyNotifications,
                            style: Theme.of(context).textTheme.titleMedium),
                        secondary: const Icon(
                            Icons.notifications_active_outlined,
                            color: CatholicTheme.lentenIndigo),
                        value: state.notificationsEnabled,
                        onChanged: (val) => state.setNotificationsEnabled(val),
                        activeThumbColor: CatholicTheme.lentenIndigo,
                      ),
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      ListTile(
                        leading: const Icon(Icons.alarm,
                            color: CatholicTheme.lentenIndigo),
                        title: Text(loc.prayerReminder,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: CatholicTheme.lentenIndigo
                                    .withValues(alpha: 0.1)),
                          ),
                          child: Text(
                            '${state.prayerHour.toString().padLeft(2, '0')}:${state.prayerMinute.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CatholicTheme.lentenIndigo),
                          ),
                        ),
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                                hour: state.prayerHour,
                                minute: state.prayerMinute),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: CatholicTheme.lentenIndigo,
                                    onPrimary: Colors.white,
                                    onSurface: CatholicTheme.deepSlate,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (time != null)
                            state.setPrayerTime(time.hour, time.minute);
                        },
                      ),
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      ListTile(
                        leading: const Icon(Icons.restaurant_menu,
                            color: CatholicTheme.lentenIndigo),
                        title: Text(loc.fastingReminder,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: CatholicTheme.lentenIndigo
                                    .withValues(alpha: 0.1)),
                          ),
                          child: Text(
                            '${state.fastHour.toString().padLeft(2, '0')}:${state.fastMinute.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CatholicTheme.lentenIndigo),
                          ),
                        ),
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                                hour: state.fastHour, minute: state.fastMinute),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: CatholicTheme.lentenIndigo,
                                    onPrimary: Colors.white,
                                    onSurface: CatholicTheme.deepSlate,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (time != null)
                            state.setFastTime(time.hour, time.minute);
                        },
                      ),
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      ListTile(
                        leading: const Icon(Icons.language,
                            color: CatholicTheme.lentenIndigo),
                        title: Text(loc.language,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: CatholicTheme.lentenIndigo
                                    .withValues(alpha: 0.1)),
                          ),
                          child: Text(
                            _getLanguageName(state.currentLocale.languageCode),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CatholicTheme.lentenIndigo),
                          ),
                        ),
                        onTap: () => _showLanguagePicker(context, state),
                      ),
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      ListTile(
                        leading: const Icon(Icons.menu_book,
                            color: CatholicTheme.lentenIndigo),
                        title: Text(loc.bibleVersion,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: DropdownButton<BibleVersion>(
                          value: state.bibleVersion,
                          underline: const SizedBox(),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: CatholicTheme.lentenIndigo),
                          onChanged: (version) {
                            if (version != null) state.setBibleVersion(version);
                          },
                          items: BibleVersion.values.map((v) {
                            return DropdownMenuItem(
                              value: v,
                              child: Text(v.name.toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                HolyCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      _buildSettingsTile(
                        context,
                        loc.aboutApp,
                        Icons.info_outline,
                        () => _showAboutDialog(context, loc),
                      ),
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      _buildSettingsTile(
                        context,
                        loc.shareApp,
                        Icons.share,
                        () {
                          Share.share(loc.shareMessage);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value,
      IconData icon, Color color) {
    return HolyCard(
      isGlass: true,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: color.withValues(alpha: 0.3)),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CatholicTheme.lentenIndigo,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: CatholicTheme.subtleGrey,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: CatholicTheme.lentenIndigo),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios,
          size: 14, color: CatholicTheme.lentenIndigo),
      onTap: onTap,
    );
  }

  void _showAboutDialog(BuildContext context, AppLocalizations loc) {
    showAboutDialog(
      context: context,
      applicationName: 'Lent Journey',
      applicationVersion: '1.0.0',
      applicationIcon:
          const Icon(Icons.auto_awesome, color: CatholicTheme.lentenIndigo),
      applicationLegalese: '© 2026 Catholic App Devs',
      children: [
        const SizedBox(height: 12),
        Text(
          loc.aboutContent,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _getLanguageName(String code) {
    switch (code) {
      case 'es':
        return 'Español';
      case 'pt':
        return 'Português';
      case 'tl':
        return 'Tagalog';
      case 'fr':
        return 'Français';
      case 'it':
        return 'Italiano';
      case 'pl':
        return 'Polski';
      case 'la':
        return 'Latina';
      case 'vi':
        return 'Tiếng Việt';
      case 'ko':
        return '한국어';
      case 'en':
      default:
        return 'English';
    }
  }

  void _showLanguagePicker(BuildContext context, LentStateProvider state) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              'Select Language',
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CatholicTheme.lentenIndigo,
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildLangItem(context, state, 'English', 'en'),
                  _buildLangItem(context, state, 'Español', 'es'),
                  _buildLangItem(context, state, 'Português', 'pt'),
                  _buildLangItem(context, state, 'Tagalog', 'tl'),
                  _buildLangItem(context, state, 'Français', 'fr'),
                  _buildLangItem(context, state, 'Italiano', 'it'),
                  _buildLangItem(context, state, 'Polski', 'pl'),
                  _buildLangItem(context, state, 'Latina', 'la'),
                  _buildLangItem(context, state, 'Tiếng Việt', 'vi'),
                  _buildLangItem(context, state, '한국어', 'ko'),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLangItem(BuildContext context, LentStateProvider state,
      String name, String code) {
    final isSelected = state.currentLocale.languageCode == code;
    return ListTile(
      leading: isSelected
          ? const Icon(Icons.check, color: CatholicTheme.lentenIndigo)
          : const SizedBox(width: 24),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? CatholicTheme.lentenIndigo : Colors.black87,
        ),
      ),
      onTap: () {
        state.setLocale(Locale(code));
        Navigator.pop(context);
      },
    );
  }
}
