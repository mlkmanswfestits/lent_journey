import 'package:lent_journey_catholic/l10n/app_localizations.dart';

class Saint {
  final String id;
  final String name;
  final String feastDay;
  final String patronage;
  final String briefBio;
  final String quote;
  final String prayer;
  final String icon;
  final String? imagePath;

  const Saint({
    required this.id,
    required this.name,
    required this.feastDay,
    required this.patronage,
    required this.briefBio,
    required this.quote,
    required this.prayer,
    this.icon = '😇',
    this.imagePath,
  });
}

class SaintData {
  static Saint? getSaintForDay(int dayOfLent, AppLocalizations loc) {
    // 2026 Lenten Calendar Mapping (Ash Wednesday = Feb 18)
    final map = {
      1: "gregory_narek", // Ash Wednesday special feature
      6: "polycarp", // Feb 23
      10: "gregory_narek", // Feb 27
      14: "katharine_drexel", // Mar 3
      15: "casimir", // Mar 4
      18: "perpetua_felicity", // Mar 7
      19: "john_of_god", // Mar 8
      20: "frances_rome", // Mar 9
      28: "patrick", // Mar 17
      29: "cyril_jerusalem", // Mar 18
      30: "joseph", // Mar 19
      34: "turibius", // Mar 23
      44: "francis_paola", // Apr 2
    };

    if (map.containsKey(dayOfLent)) {
      final id = map[dayOfLent];
      return _getSaints(loc).firstWhere((s) => s.id == id);
    }

    // Return null for days without feast days
    return null;
  }

  static List<Saint> getLentenFeastSaints(AppLocalizations loc) {
    // Return all saints to ensure the Prayer Hub is comprehensive
    return _getSaints(loc);
  }

  static List<Saint> _getSaints(AppLocalizations loc) {
    return [
      Saint(
        id: "polycarp",
        name: loc.saintPolycarpName,
        feastDay: loc.saintPolycarpFeast,
        patronage: loc.saintPolycarpPatronage,
        briefBio: loc.saintPolycarpBio,
        quote: loc.saintPolycarpQuote,
        prayer: loc.saintPolycarpPrayer,
        icon: '🔥',
        imagePath: 'assets/images/saints/saint_polycarp.png',
      ),
      Saint(
        id: "gregory_narek",
        name: loc.saintGregoryNarekName,
        feastDay: loc.saintGregoryNarekFeast,
        patronage: loc.saintGregoryNarekPatronage,
        briefBio: loc.saintGregoryNarekBio,
        quote: loc.saintGregoryNarekQuote,
        prayer: loc.saintGregoryNarekPrayer,
        icon: '📜',
        imagePath: 'assets/images/saints/saint_gregory_of_narek.png',
      ),
      Saint(
        id: "casimir",
        name: loc.saintCasimirName,
        feastDay: loc.saintCasimirFeast,
        patronage: loc.saintCasimirPatronage,
        briefBio: loc.saintCasimirBio,
        quote: loc.saintCasimirQuote,
        prayer: loc.saintCasimirPrayer,
        icon: '👑',
        imagePath: 'assets/images/saints/saint_casimir.png',
      ),
      Saint(
        id: "perpetua_felicity",
        name: loc.saintPerpetuaFelicityName,
        feastDay: loc.saintPerpetuaFelicityFeast,
        patronage: loc.saintPerpetuaFelicityPatronage,
        briefBio: loc.saintPerpetuaFelicityBio,
        quote: loc.saintPerpetuaFelicityQuote,
        prayer: loc.saintPerpetuaFelicityPrayer,
        icon: '🤝',
        imagePath: 'assets/images/saints/saint_perpetuaandfelicity.png',
      ),
      Saint(
        id: "john_of_god",
        name: loc.saintJohnOfGodName,
        feastDay: loc.saintJohnOfGodFeast,
        patronage: loc.saintJohnOfGodPatronage,
        briefBio: loc.saintJohnOfGodBio,
        quote: loc.saintJohnOfGodQuote,
        prayer: loc.saintJohnOfGodPrayer,
        icon: '🏥',
        imagePath: 'assets/images/saints/saint_john_of_god.png',
      ),
      Saint(
        id: "frances_rome",
        name: loc.saintFrancesOfRomeName,
        feastDay: loc.saintFrancesOfRomeFeast,
        patronage: loc.saintFrancesOfRomePatronage,
        briefBio: loc.saintFrancesOfRomeBio,
        quote: loc.saintFrancesOfRomeQuote,
        prayer: loc.saintFrancesOfRomePrayer,
        icon: '⛪',
        imagePath: 'assets/images/saints/saint_francis_of_rome.png',
      ),
      Saint(
        id: "patrick",
        name: loc.saintPatrickName,
        feastDay: loc.saintPatrickFeast,
        patronage: loc.saintPatrickPatronage,
        briefBio: loc.saintPatrickBio,
        quote: loc.saintPatrickQuote,
        prayer: loc.saintPatrickPrayer,
        icon: '☘️',
        imagePath: 'assets/images/saints/saint_patrick.png',
      ),
      Saint(
        id: "cyril_jerusalem",
        name: loc.saintCyrilJerusalemName,
        feastDay: loc.saintCyrilJerusalemFeast,
        patronage: loc.saintCyrilJerusalemPatronage,
        briefBio: loc.saintCyrilJerusalemBio,
        quote: loc.saintCyrilJerusalemQuote,
        prayer: loc.saintCyrilJerusalemPrayer,
        icon: '🕯️',
        imagePath: 'assets/images/saints/saint_cyril_of_jerusalem.png',
      ),
      Saint(
        id: "joseph",
        name: loc.saintJosephName,
        feastDay: loc.saintJosephFeast,
        patronage: loc.saintJosephPatronage,
        briefBio: loc.saintJosephBio,
        quote: loc.saintJosephQuote,
        prayer: loc.saintJosephPrayer,
        icon: '🪚',
        imagePath: 'assets/images/saints/saint_joseph.png',
      ),
      Saint(
        id: "turibius",
        name: loc.saintTuribiusName,
        feastDay: loc.saintTuribiusFeast,
        patronage: loc.saintTuribiusPatronage,
        briefBio: loc.saintTuribiusBio,
        quote: loc.saintTuribiusQuote,
        prayer: loc.saintTuribiusPrayer,
        icon: '🗺️',
        imagePath: 'assets/images/saints/saint_turibius_of_mogrojevo.png',
      ),
      Saint(
        id: "francis_paola",
        name: loc.saintFrancisPaolaName,
        feastDay: loc.saintFrancisPaolaFeast,
        patronage: loc.saintFrancisPaolaPatronage,
        briefBio: loc.saintFrancisPaolaBio,
        quote: loc.saintFrancisPaolaQuote,
        prayer: loc.saintFrancisPaolaPrayer,
        icon: '⛵',
        imagePath: 'assets/images/saints/saint_francis_of_paola.png',
      ),
      Saint(
        id: "katharine_drexel",
        name: loc.saintKatharineDrexelName,
        feastDay: loc.saintKatharineDrexelFeast,
        patronage: loc.saintKatharineDrexelPatronage,
        briefBio: loc.saintKatharineDrexelBio,
        quote: loc.saintKatharineDrexelQuote,
        prayer: loc.saintKatharineDrexelPrayer,
        icon: '🏫',
        imagePath: 'assets/images/saints/saint_katharine_drexel.png',
      ),
    ];
  }
}
