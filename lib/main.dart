import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lent_journey_catholic/l10n/app_localizations.dart';
import 'screens/home_screen.dart';
import 'screens/prayer_hub_screen.dart';
import 'screens/fasting_screen.dart';
import 'screens/almsgiving_screen.dart';
import 'screens/profile_screen.dart';
import 'providers/lent_state_provider.dart';
import 'utils/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'services/notification_service.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  await Hive.initFlutter();
  await Hive.openBox('lentJourney');

  // Initialize Notifications
  await NotificationService.init();

  runApp(const LentJourneyApp());
}

class LentJourneyApp extends StatelessWidget {
  const LentJourneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LentStateProvider(),
      child: Consumer<LentStateProvider>(
        builder: (context, state, child) {
          return MaterialApp(
            title: 'Lent Journey',
            debugShowCheckedModeBanner: false,
            theme: CatholicTheme.lightTheme,
            darkTheme: CatholicTheme.darkTheme,
            themeMode: ThemeMode.light,
            locale: state.currentLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const PrayerHubScreen(),
    const FastingScreen(),
    const AlmsgivingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CatholicTheme.lentenIndigo,
        unselectedItemColor: CatholicTheme.subtleGrey.withValues(alpha: 0.5),
        backgroundColor: CatholicTheme.pureWhite,
        elevation: 20,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: 'Prayer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Fasting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Almsgiving',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
