import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_la.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ko'),
    Locale('la'),
    Locale('pl'),
    Locale('pt'),
    Locale('tl'),
    Locale('vi')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Lent Journey'**
  String get appTitle;

  /// No description provided for @homeTab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// No description provided for @prayerTab.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get prayerTab;

  /// No description provided for @fastingTab.
  ///
  /// In en, this message translates to:
  /// **'Fasting'**
  String get fastingTab;

  /// No description provided for @almsgivingTab.
  ///
  /// In en, this message translates to:
  /// **'Almsgiving'**
  String get almsgivingTab;

  /// No description provided for @profileTab.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTab;

  /// No description provided for @journeyToEaster.
  ///
  /// In en, this message translates to:
  /// **'Journey to Easter'**
  String get journeyToEaster;

  /// No description provided for @walkHumbly.
  ///
  /// In en, this message translates to:
  /// **'Walk humbly with your God'**
  String get walkHumbly;

  /// No description provided for @toEaster.
  ///
  /// In en, this message translates to:
  /// **'TO EASTER'**
  String get toEaster;

  /// No description provided for @todayTheme.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Theme'**
  String get todayTheme;

  /// No description provided for @todayScripture.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Scripture'**
  String get todayScripture;

  /// No description provided for @threePillars.
  ///
  /// In en, this message translates to:
  /// **'THE THREE PILLARS'**
  String get threePillars;

  /// No description provided for @pillarPrayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get pillarPrayer;

  /// No description provided for @pillarFasting.
  ///
  /// In en, this message translates to:
  /// **'Fasting'**
  String get pillarFasting;

  /// No description provided for @pillarAlmsgiving.
  ///
  /// In en, this message translates to:
  /// **'Almsgiving'**
  String get pillarAlmsgiving;

  /// No description provided for @lentenCalendar.
  ///
  /// In en, this message translates to:
  /// **'LENTEN CALENDAR'**
  String get lentenCalendar;

  /// No description provided for @bibleStudy.
  ///
  /// In en, this message translates to:
  /// **'BIBLE STUDY'**
  String get bibleStudy;

  /// No description provided for @confession.
  ///
  /// In en, this message translates to:
  /// **'CONFESSION'**
  String get confession;

  /// No description provided for @journal.
  ///
  /// In en, this message translates to:
  /// **'JOURNAL'**
  String get journal;

  /// No description provided for @dailyChallenge.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Challenge'**
  String get dailyChallenge;

  /// No description provided for @markComplete.
  ///
  /// In en, this message translates to:
  /// **'MARK COMPLETE'**
  String get markComplete;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'COMPLETED'**
  String get completed;

  /// No description provided for @findMass.
  ///
  /// In en, this message translates to:
  /// **'FIND DAILY MASS NEAR ME'**
  String get findMass;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @dailyNotifications.
  ///
  /// In en, this message translates to:
  /// **'Daily Notifications'**
  String get dailyNotifications;

  /// No description provided for @prayerReminder.
  ///
  /// In en, this message translates to:
  /// **'Prayer Reminder'**
  String get prayerReminder;

  /// No description provided for @fastingReminder.
  ///
  /// In en, this message translates to:
  /// **'Fasting Reminder'**
  String get fastingReminder;

  /// No description provided for @bibleVersion.
  ///
  /// In en, this message translates to:
  /// **'Bible Version'**
  String get bibleVersion;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About Lent Journey'**
  String get aboutApp;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareApp;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @themeEaster.
  ///
  /// In en, this message translates to:
  /// **'Easter Sunday - He is Risen!'**
  String get themeEaster;

  /// No description provided for @themeAshWednesday.
  ///
  /// In en, this message translates to:
  /// **'Ash Wednesday - Begin Your Journey'**
  String get themeAshWednesday;

  /// No description provided for @themeSunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday of Lent - Day of Rest'**
  String get themeSunday;

  /// No description provided for @themeFriday.
  ///
  /// In en, this message translates to:
  /// **'Friday - Fasting & Stations'**
  String get themeFriday;

  /// No description provided for @themeMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday - Prayer Focus'**
  String get themeMonday;

  /// No description provided for @themeWednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday - Almsgiving'**
  String get themeWednesday;

  /// No description provided for @themeHolyWeek.
  ///
  /// In en, this message translates to:
  /// **'Holy Week - Journey to the Cross'**
  String get themeHolyWeek;

  /// No description provided for @themeDefault.
  ///
  /// In en, this message translates to:
  /// **'Day {day} of Lent'**
  String themeDefault(int day);

  /// No description provided for @challengeEaster.
  ///
  /// In en, this message translates to:
  /// **'Celebrate the Resurrection! Joyfully witness to the Light of Christ.'**
  String get challengeEaster;

  /// No description provided for @challengeFriday.
  ///
  /// In en, this message translates to:
  /// **'Pray the Stations of the Cross and fast from meat.'**
  String get challengeFriday;

  /// No description provided for @challengeSunday.
  ///
  /// In en, this message translates to:
  /// **'Celebrate the Lord\'s Day. Rest and reflect on the week\'s journey.'**
  String get challengeSunday;

  /// No description provided for @challengeMonday.
  ///
  /// In en, this message translates to:
  /// **'Pray a decade of the Rosary and spend 15 minutes in meditation.'**
  String get challengeMonday;

  /// No description provided for @challengeWednesday.
  ///
  /// In en, this message translates to:
  /// **'Perform a work of mercy and donate to those in need.'**
  String get challengeWednesday;

  /// No description provided for @challengeDefault.
  ///
  /// In en, this message translates to:
  /// **'Pray for 15 minutes and practice mindful eating.'**
  String get challengeDefault;

  /// No description provided for @scriptureMatthew28.
  ///
  /// In en, this message translates to:
  /// **'Matthew 28:5-6'**
  String get scriptureMatthew28;

  /// No description provided for @scriptureMatthew28Text.
  ///
  /// In en, this message translates to:
  /// **'Do not be afraid, for I know that you are looking for Jesus, who was crucified. He is not here; he has risen, just as he said.'**
  String get scriptureMatthew28Text;

  /// No description provided for @scriptureJoel2.
  ///
  /// In en, this message translates to:
  /// **'Joel 2:12-13'**
  String get scriptureJoel2;

  /// No description provided for @scriptureJoel2Text.
  ///
  /// In en, this message translates to:
  /// **'Even now, declares the LORD, return to me with all your heart, with fasting and weeping and mourning. Rend your heart and not your garments.'**
  String get scriptureJoel2Text;

  /// No description provided for @scriptureIsaiah58.
  ///
  /// In en, this message translates to:
  /// **'Isaiah 58:6-7'**
  String get scriptureIsaiah58;

  /// No description provided for @scriptureIsaiah58Text.
  ///
  /// In en, this message translates to:
  /// **'Is not this the kind of fasting I have chosen: to loose the chains of injustice... to share your food with the hungry and to provide the poor wanderer with shelter.'**
  String get scriptureIsaiah58Text;

  /// No description provided for @scripturePsalm23.
  ///
  /// In en, this message translates to:
  /// **'Psalm 23'**
  String get scripturePsalm23;

  /// No description provided for @scripturePsalm23Text.
  ///
  /// In en, this message translates to:
  /// **'The LORD is my shepherd, I lack nothing. He makes me lie down in green pastures, he leads me beside quiet waters.'**
  String get scripturePsalm23Text;

  /// No description provided for @scriptureMatthew6.
  ///
  /// In en, this message translates to:
  /// **'Matthew 6:16-18'**
  String get scriptureMatthew6;

  /// No description provided for @scriptureMatthew6Text.
  ///
  /// In en, this message translates to:
  /// **'When you fast, do not look somber as the hypocrites do... but when you fast, put oil on your head and wash your face.'**
  String get scriptureMatthew6Text;

  /// No description provided for @dayDetail.
  ///
  /// In en, this message translates to:
  /// **'DAY {day} DETAIL'**
  String dayDetail(int day);

  /// No description provided for @easterTheme.
  ///
  /// In en, this message translates to:
  /// **'Easter Theme'**
  String get easterTheme;

  /// No description provided for @dailyTheme.
  ///
  /// In en, this message translates to:
  /// **'Daily Theme'**
  String get dailyTheme;

  /// No description provided for @dailyScripture.
  ///
  /// In en, this message translates to:
  /// **'Daily Scripture'**
  String get dailyScripture;

  /// No description provided for @todaysGospel.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Gospel'**
  String get todaysGospel;

  /// No description provided for @saintOfDay.
  ///
  /// In en, this message translates to:
  /// **'Saint of the Day'**
  String get saintOfDay;

  /// No description provided for @patronage.
  ///
  /// In en, this message translates to:
  /// **'Patronage'**
  String get patronage;

  /// No description provided for @liturgyOfHours.
  ///
  /// In en, this message translates to:
  /// **'Liturgy of the Hours'**
  String get liturgyOfHours;

  /// No description provided for @dailyReflection.
  ///
  /// In en, this message translates to:
  /// **'Daily Reflection'**
  String get dailyReflection;

  /// No description provided for @dailyPrayer.
  ///
  /// In en, this message translates to:
  /// **'Daily Prayer'**
  String get dailyPrayer;

  /// No description provided for @amen.
  ///
  /// In en, this message translates to:
  /// **'Amen'**
  String get amen;

  /// No description provided for @lentenDiscipline.
  ///
  /// In en, this message translates to:
  /// **'Lenten Discipline'**
  String get lentenDiscipline;

  /// No description provided for @sacramentalLife.
  ///
  /// In en, this message translates to:
  /// **'Sacramental Life'**
  String get sacramentalLife;

  /// No description provided for @stateOfGrace.
  ///
  /// In en, this message translates to:
  /// **'STATE OF GRACE'**
  String get stateOfGrace;

  /// No description provided for @sacramentOfPenance.
  ///
  /// In en, this message translates to:
  /// **'SACRAMENT OF PENANCE'**
  String get sacramentOfPenance;

  /// No description provided for @absolutionReceived.
  ///
  /// In en, this message translates to:
  /// **'You received absolution on this day.'**
  String get absolutionReceived;

  /// No description provided for @confessionPrompt.
  ///
  /// In en, this message translates to:
  /// **'Have you been to confession today?'**
  String get confessionPrompt;

  /// No description provided for @prepare.
  ///
  /// In en, this message translates to:
  /// **'PREPARE'**
  String get prepare;

  /// No description provided for @spiritualJournal.
  ///
  /// In en, this message translates to:
  /// **'My Spiritual Journal'**
  String get spiritualJournal;

  /// No description provided for @journalHint.
  ///
  /// In en, this message translates to:
  /// **'Record your reflections, prayers, and experiences for today...'**
  String get journalHint;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'PROFILE'**
  String get profileTitle;

  /// No description provided for @lentenPilgrim.
  ///
  /// In en, this message translates to:
  /// **'Lenten Pilgrim'**
  String get lentenPilgrim;

  /// No description provided for @dayXofY.
  ///
  /// In en, this message translates to:
  /// **'Day {day} of {total}'**
  String dayXofY(int day, int total);

  /// No description provided for @yourJourney.
  ///
  /// In en, this message translates to:
  /// **'Your Journey'**
  String get yourJourney;

  /// No description provided for @prayerTime.
  ///
  /// In en, this message translates to:
  /// **'Prayer Time'**
  String get prayerTime;

  /// No description provided for @fastingStreak.
  ///
  /// In en, this message translates to:
  /// **'Fasting Streak'**
  String get fastingStreak;

  /// No description provided for @totalDonated.
  ///
  /// In en, this message translates to:
  /// **'Total Donated'**
  String get totalDonated;

  /// No description provided for @mercyActs.
  ///
  /// In en, this message translates to:
  /// **'Mercy Acts'**
  String get mercyActs;

  /// No description provided for @aboutContent.
  ///
  /// In en, this message translates to:
  /// **'A companion for your 40-day journey of prayer, fasting, and almsgiving. May this app help you grow closer to God during this holy season.'**
  String get aboutContent;

  /// No description provided for @shareMessage.
  ///
  /// In en, this message translates to:
  /// **'Join me on a 40-day journey of prayer, fasting, and almsgiving with the Catholic Lent Journey app! 🙏✨'**
  String get shareMessage;

  /// No description provided for @prayerHubTitle.
  ///
  /// In en, this message translates to:
  /// **'PRAYER HUB'**
  String get prayerHubTitle;

  /// No description provided for @prayerHeader.
  ///
  /// In en, this message translates to:
  /// **'PRAYER'**
  String get prayerHeader;

  /// No description provided for @guidedMeditations.
  ///
  /// In en, this message translates to:
  /// **'GUIDED MEDITATIONS'**
  String get guidedMeditations;

  /// No description provided for @guidedPrayersTitle.
  ///
  /// In en, this message translates to:
  /// **'Guided Lenten Prayers'**
  String get guidedPrayersTitle;

  /// No description provided for @guidedPrayersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select a prayer to begin your guided meditation.'**
  String get guidedPrayersSubtitle;

  /// No description provided for @lentenSaintsTitle.
  ///
  /// In en, this message translates to:
  /// **'Lenten & Devotional Saints'**
  String get lentenSaintsTitle;

  /// No description provided for @lentenSaintsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore profiles and intercessory prayers for saints of the season.'**
  String get lentenSaintsSubtitle;

  /// No description provided for @feastDay.
  ///
  /// In en, this message translates to:
  /// **'Feast: {date}'**
  String feastDay(String date);

  /// No description provided for @prayerCompleted.
  ///
  /// In en, this message translates to:
  /// **'Prayer Completed'**
  String get prayerCompleted;

  /// No description provided for @prayerCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'You have completed {prayerTitle}. May God bless your journey.'**
  String prayerCompletedMessage(String prayerTitle);

  /// No description provided for @nextStation.
  ///
  /// In en, this message translates to:
  /// **'NEXT STATION'**
  String get nextStation;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE'**
  String get continueButton;

  /// No description provided for @completeButton.
  ///
  /// In en, this message translates to:
  /// **'COMPLETE'**
  String get completeButton;

  /// No description provided for @stationTitle.
  ///
  /// In en, this message translates to:
  /// **'The {number} Station'**
  String stationTitle(String number);

  /// No description provided for @celebratingLife.
  ///
  /// In en, this message translates to:
  /// **'Celebrating the Life of'**
  String get celebratingLife;

  /// No description provided for @feastDayCaps.
  ///
  /// In en, this message translates to:
  /// **'FEAST DAY: {date}'**
  String feastDayCaps(String date);

  /// No description provided for @spiritualBiography.
  ///
  /// In en, this message translates to:
  /// **'Spiritual Biography'**
  String get spiritualBiography;

  /// No description provided for @intercessoryPrayer.
  ///
  /// In en, this message translates to:
  /// **'Intercessory Prayer'**
  String get intercessoryPrayer;

  /// No description provided for @fastingFullDesc.
  ///
  /// In en, this message translates to:
  /// **'Fast & Abstinence: One full meal, two small ones. No meat.'**
  String get fastingFullDesc;

  /// No description provided for @fastingPartialDesc.
  ///
  /// In en, this message translates to:
  /// **'Simple Fast: Minimal snacks, focus on prayer.'**
  String get fastingPartialDesc;

  /// No description provided for @fastingAbstinenceDesc.
  ///
  /// In en, this message translates to:
  /// **'Abstinence: No meat today in honor of the Lord\'s Passion.'**
  String get fastingAbstinenceDesc;

  /// No description provided for @fastingNoneDesc.
  ///
  /// In en, this message translates to:
  /// **'Resurrection Day: Fasting is relaxed in celebration of the Lord\'s Day.'**
  String get fastingNoneDesc;

  /// No description provided for @day1Theme.
  ///
  /// In en, this message translates to:
  /// **'Ash Wednesday: Remember you are dust'**
  String get day1Theme;

  /// No description provided for @day1Reading.
  ///
  /// In en, this message translates to:
  /// **'Joel 2:12-18 - \'Rend your hearts, not your garments\''**
  String get day1Reading;

  /// No description provided for @day1Reflection.
  ///
  /// In en, this message translates to:
  /// **'Today we receive ashes on our foreheads. It is a sign of our mortality and our need for repentance. Let this mark be a reminder to start your journey with a humble heart.'**
  String get day1Reflection;

  /// No description provided for @day1Prayer.
  ///
  /// In en, this message translates to:
  /// **'Lord, help me to enter this Lenten season with a heart open to Your grace. May my fast be pleasing to You.'**
  String get day1Prayer;

  /// No description provided for @saintGregoryNarekName.
  ///
  /// In en, this message translates to:
  /// **'St. Gregory of Narek'**
  String get saintGregoryNarekName;

  /// No description provided for @saintGregoryNarekFeast.
  ///
  /// In en, this message translates to:
  /// **'February 27'**
  String get saintGregoryNarekFeast;

  /// No description provided for @saintGregoryNarekPatronage.
  ///
  /// In en, this message translates to:
  /// **'Armenian Church'**
  String get saintGregoryNarekPatronage;

  /// No description provided for @saintGregoryNarekBio.
  ///
  /// In en, this message translates to:
  /// **'St. Gregory of Narek (c. 950 – 1003) was a highly influential Armenian mystical and lyrical poet, monk, and theologian. Born near Lake Van in what is now Turkey, Gregory came from a family deeply dedicated to the Church. He and his elder brother were raised and educated at the Narek monastery by their scholarly uncle, Anania Narekatsi. Gregory entered monastic life at a young age, was ordained a priest around 977, and spent his entire life at the Narek monastery, teaching theology. His most celebrated work is \'The Book of Lamentations,\' also known as \'Narek,\' a collection of 95 prayers exploring themes of humanity\'s separation from God and the quest for reunification. In 2015, Pope Francis declared St. Gregory of Narek a Doctor of the Church, acknowledging the timeless and theologically sound nature of his writings. His life of prayer and deep reflection offers a powerful model for Lenten spiritual growth.'**
  String get saintGregoryNarekBio;

  /// No description provided for @saintGregoryNarekQuote.
  ///
  /// In en, this message translates to:
  /// **'Accept the song of blessing from my lips.'**
  String get saintGregoryNarekQuote;

  /// No description provided for @saintGregoryNarekPrayer.
  ///
  /// In en, this message translates to:
  /// **'O Lord our God, who didst grant to the monk Saint Gregory of Narek the grace of a humble heart and a sublime spirit, grant that through his intercession we may ever seek Thee through a life of prayer and charity. Amen.'**
  String get saintGregoryNarekPrayer;

  /// No description provided for @saintPolycarpName.
  ///
  /// In en, this message translates to:
  /// **'St. Polycarp'**
  String get saintPolycarpName;

  /// No description provided for @saintPolycarpFeast.
  ///
  /// In en, this message translates to:
  /// **'February 23'**
  String get saintPolycarpFeast;

  /// No description provided for @saintPolycarpPatronage.
  ///
  /// In en, this message translates to:
  /// **'Earaches, dysentery'**
  String get saintPolycarpPatronage;

  /// No description provided for @saintPolycarpBio.
  ///
  /// In en, this message translates to:
  /// **'St. Polycarp (c. AD 69 – 155) served as the Christian Bishop of Smyrna and is recognized as an Apostolic Father, bridging the gap between the apostolic and patristic ages of the Church. He holds a unique position in Church history as he was personally taught by the Apostle John, one of Jesus\'s disciples. His direct connection to the apostles made him a crucial figure in authenticating orthodox teachings and combating early heresies, particularly Gnosticism. Born around AD 69 or 70, Polycarp became bishop of Smyrna, a role he held for approximately six decades. During his time as bishop, he fiercely defended the faith against emerging heresies. He also engaged in discussions with other early Church leaders, including Pope Anicetus, regarding important matters like the date of Easter celebrations. Polycarp\'s steadfast faith culminated in his martyrdom at 86 years old. When the flames reportedly failed to consume his body during his execution, he was ultimately killed by a dagger. His trust in God, even in the face of death, exemplifies a deep Lenten theme of unwavering faith and sacrifice.'**
  String get saintPolycarpBio;

  /// No description provided for @saintPolycarpQuote.
  ///
  /// In en, this message translates to:
  /// **'Eighty and six years have I served Him, and He has done me no wrong.'**
  String get saintPolycarpQuote;

  /// No description provided for @saintPolycarpPrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, the Father of our Lord Jesus Christ, we thank Thee for having counted us worthy of this day and hour, that we might receive a portion among the number of martyrs, through Christ our Lord. Amen.'**
  String get saintPolycarpPrayer;

  /// No description provided for @saintCasimirName.
  ///
  /// In en, this message translates to:
  /// **'St. Casimir'**
  String get saintCasimirName;

  /// No description provided for @saintCasimirFeast.
  ///
  /// In en, this message translates to:
  /// **'March 4'**
  String get saintCasimirFeast;

  /// No description provided for @saintCasimirPatronage.
  ///
  /// In en, this message translates to:
  /// **'Lithuania, Poland, youth'**
  String get saintCasimirPatronage;

  /// No description provided for @saintCasimirBio.
  ///
  /// In en, this message translates to:
  /// **'St. Casimir (1458 – 1484) was a prince of the Kingdom of Poland and the Grand Duchy of Lithuania. Despite his royal lineage and being in line for the throne, Casimir chose a life of profound piety, prayer, and renunciation of worldly luxuries. From a young age, he was educated by holy men and embraced a disciplined, even severe, life, often sleeping on the ground and engaging in penitential practices. He spent long nights in prayer, meditating on the Passion of Christ, and vowed lifelong celibacy. After a failed military campaign to claim the throne of Hungary at age 13, he resolved never to be involved in war again. Known for his generosity towards the sick and poor, earning him the title \'patron of the poor,\' he also had a deep devotion to the Blessed Mother. He died at the age of 25 from tuberculosis. His life offers a powerful example of detachment from worldly power and wealth, focusing instead on humility and prayer—themes central to Lent.'**
  String get saintCasimirBio;

  /// No description provided for @saintCasimirQuote.
  ///
  /// In en, this message translates to:
  /// **'Rather die than sin.'**
  String get saintCasimirQuote;

  /// No description provided for @saintCasimirPrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, who among the pleasures of a royal court and the snares of the world didst strengthen Saint Casimir with constant fidelity, we besuch Thee that we may be ever intent upon things heavenly. Amen.'**
  String get saintCasimirPrayer;

  /// No description provided for @saintPerpetuaFelicityName.
  ///
  /// In en, this message translates to:
  /// **'Sts. Perpetua and Felicity'**
  String get saintPerpetuaFelicityName;

  /// No description provided for @saintPerpetuaFelicityFeast.
  ///
  /// In en, this message translates to:
  /// **'March 7'**
  String get saintPerpetuaFelicityFeast;

  /// No description provided for @saintPerpetuaFelicityPatronage.
  ///
  /// In en, this message translates to:
  /// **'Mothers, expectant mothers'**
  String get saintPerpetuaFelicityPatronage;

  /// No description provided for @saintPerpetuaFelicityBio.
  ///
  /// In en, this message translates to:
  /// **'Sts. Perpetua and Felicity were two young women martyred for their faith in Carthage around 203 AD. Perpetua was a noblewoman and Felicity was her slave. Despite their social differences, they were united by their shared faith and the trials they faced. Perpetua, a young mother with an infant son, and Felicity, who was eight months pregnant when arrested, both refused to renounce Christ despite intense pressure from their families and the Roman authorities. Perpetua kept a diary in prison, which became one of the earliest pieces of Christian writing by a woman. They were ultimately killed in the arena, facing their deaths with remarkable courage and dignity. Their story is a profound witness to the power of sisterhood in Christ and the strength found in faith even amidst extreme suffering, echoing the Lenten journey of sacrifice and devotion.'**
  String get saintPerpetuaFelicityBio;

  /// No description provided for @saintPerpetuaFelicityQuote.
  ///
  /// In en, this message translates to:
  /// **'Stand fast in the faith, and love one another.'**
  String get saintPerpetuaFelicityQuote;

  /// No description provided for @saintPerpetuaFelicityPrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, at whose urging the Saints Perpetua and Felicity defied their persecutors and overcame the torment of death, grant, we beseech Thee, by their prayers, that we may be enabled to fulfill that which Thou commandest. Amen.'**
  String get saintPerpetuaFelicityPrayer;

  /// No description provided for @saintJohnOfGodName.
  ///
  /// In en, this message translates to:
  /// **'St. John of God'**
  String get saintJohnOfGodName;

  /// No description provided for @saintJohnOfGodFeast.
  ///
  /// In en, this message translates to:
  /// **'March 8'**
  String get saintJohnOfGodFeast;

  /// No description provided for @saintJohnOfGodPatronage.
  ///
  /// In en, this message translates to:
  /// **'Hospitals, booksellers, the sick'**
  String get saintJohnOfGodPatronage;

  /// No description provided for @saintJohnOfGodBio.
  ///
  /// In en, this message translates to:
  /// **'St. John of God (1495 – 1550) led a discovery-filled early life as a shepherd and soldier before a profound spiritual awakening around age 40. Hearing a sermon by St. John of Avila, he was moved to extreme public repentance, which initially led to his committal to a mental hospital. Upon release, he dedicated his life to caring for the sick and poor in Granada, Spain. He established a house for the destitute, begging for food and medicine, and often carrying the ill to his home himself. His selflessness became the foundation for the Brothers Hospitallers. He died after falling ill while trying to save people during a flood. His journey from a worldly life to one of radical charity serves as a powerful Lenten inspiration for conversion and selfless service.'**
  String get saintJohnOfGodBio;

  /// No description provided for @saintJohnOfGodQuote.
  ///
  /// In en, this message translates to:
  /// **'Labor without stopping to do all the good of which you are capable.'**
  String get saintJohnOfGodQuote;

  /// No description provided for @saintJohnOfGodPrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, who filled Saint John of God with the spirit of mercy and made him wonderful in his charity toward the poor and the sick, grant through his intercession that we may practice charity and merit the Kingdom. Amen.'**
  String get saintJohnOfGodPrayer;

  /// No description provided for @saintFrancesOfRomeName.
  ///
  /// In en, this message translates to:
  /// **'St. Frances of Rome'**
  String get saintFrancesOfRomeName;

  /// No description provided for @saintFrancesOfRomeFeast.
  ///
  /// In en, this message translates to:
  /// **'March 9'**
  String get saintFrancesOfRomeFeast;

  /// No description provided for @saintFrancesOfRomePatronage.
  ///
  /// In en, this message translates to:
  /// **'Motorists, widows'**
  String get saintFrancesOfRomePatronage;

  /// No description provided for @saintFrancesOfRomeBio.
  ///
  /// In en, this message translates to:
  /// **'St. Frances of Rome (1384 – 1440) was a mystic and mother known for her extraordinary charity and humility. Despite her desire to be a nun, she entered a happy 40-year marriage and became an exemplary wife and mother. During famines and plagues in Rome, she heroically cared for the sick, distributing her own wealth and organizing other noble ladies to assist. She even turned part of her family home into a hospital. Known for her visions and the gift of seeing her guardian angel, she eventually founded a community of oblates. Her life demonstrates how to find God in both family duties and contemplative service, a lesson of balance and dedication relevant for any Lenten spiritual practice.'**
  String get saintFrancesOfRomeBio;

  /// No description provided for @saintFrancesOfRomeQuote.
  ///
  /// In en, this message translates to:
  /// **'A married woman must, when called upon, quit her devotions to God at the altar to find Him in her household affairs.'**
  String get saintFrancesOfRomeQuote;

  /// No description provided for @saintFrancesOfRomePrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, who hast given us in Saint Frances of Rome a model of holiness in both married and religious life, grant that we may serve Thee with such constancy that we may behold Thee in all things. Amen.'**
  String get saintFrancesOfRomePrayer;

  /// No description provided for @saintPatrickName.
  ///
  /// In en, this message translates to:
  /// **'St. Patrick'**
  String get saintPatrickName;

  /// No description provided for @saintPatrickFeast.
  ///
  /// In en, this message translates to:
  /// **'March 17'**
  String get saintPatrickFeast;

  /// No description provided for @saintPatrickPatronage.
  ///
  /// In en, this message translates to:
  /// **'Ireland, engineers'**
  String get saintPatrickPatronage;

  /// No description provided for @saintPatrickBio.
  ///
  /// In en, this message translates to:
  /// **'St. Patrick (c. 385 – 461) is the patron saint of Ireland, credited with bringing Christianity to the country. Captured by pirates at age 16 and taken to Ireland as a slave, he spent six years as a shepherd, during which he underwent a deep spiritual conversion through constant prayer. After escaping back to Britain, he studied for the priesthood and eventually returned to Ireland as a missionary bishop. He successfully spread Christian teachings by incorporating elements of Irish culture, converting kings and entire kingdoms. His life, documented in his \'Confessio,\' is a testament to redemption, perseverance, and the power of faith to transform suffering into a divine mission—a perfect reflection for the Lenten season.'**
  String get saintPatrickBio;

  /// No description provided for @saintPatrickQuote.
  ///
  /// In en, this message translates to:
  /// **'Christ with me, Christ before me, Christ behind me.'**
  String get saintPatrickQuote;

  /// No description provided for @saintPatrickPrayer.
  ///
  /// In en, this message translates to:
  /// **'O Lord, who didst send Thy blessed Saint Patrick to preach Thy glory to the Gentiles, grant that, by his merits and intercession, we may be enabled to fulfill that which Thou commandest. Amen.'**
  String get saintPatrickPrayer;

  /// No description provided for @saintCyrilJerusalemName.
  ///
  /// In en, this message translates to:
  /// **'St. Cyril of Jerusalem'**
  String get saintCyrilJerusalemName;

  /// No description provided for @saintCyrilJerusalemFeast.
  ///
  /// In en, this message translates to:
  /// **'March 18'**
  String get saintCyrilJerusalemFeast;

  /// No description provided for @saintCyrilJerusalemPatronage.
  ///
  /// In en, this message translates to:
  /// **'Theologians, catechists'**
  String get saintCyrilJerusalemPatronage;

  /// No description provided for @saintCyrilJerusalemBio.
  ///
  /// In en, this message translates to:
  /// **'St. Cyril of Jerusalem (c. 313 – 386) was a Bishop of Jerusalem and a Doctor of the Church. He lived during a period of intense theological debate and was a staunch defender of orthodox belief against Arianism, leading to his exile three times. During a famine, he sold church valuables to buy food for the starving. His 23 \'Catechetical Lectures,\' delivered to candidates for Baptism during Lent and to the newly baptized after Easter, provided profound explanations of the creed and the mysteries of salvation. His dedication to instruction and the formation of the faithful makes him a vital guide for Lenten preparation.'**
  String get saintCyrilJerusalemBio;

  /// No description provided for @saintCyrilJerusalemQuote.
  ///
  /// In en, this message translates to:
  /// **'The Dragon sits by the side of the road, watching those who pass. Beware lest he devour you.'**
  String get saintCyrilJerusalemQuote;

  /// No description provided for @saintCyrilJerusalemPrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, who through the Bishop Saint Cyril of Jerusalem didst wonderfully lead Thy Church to a deeper understanding of the mysteries of salvation, grant that we may so honor Him that we may merit the same glory. Amen.'**
  String get saintCyrilJerusalemPrayer;

  /// No description provided for @saintJosephName.
  ///
  /// In en, this message translates to:
  /// **'St. Joseph'**
  String get saintJosephName;

  /// No description provided for @saintJosephFeast.
  ///
  /// In en, this message translates to:
  /// **'March 19'**
  String get saintJosephFeast;

  /// No description provided for @saintJosephPatronage.
  ///
  /// In en, this message translates to:
  /// **'Universal Church, fathers, workers'**
  String get saintJosephPatronage;

  /// No description provided for @saintJosephBio.
  ///
  /// In en, this message translates to:
  /// **'St. Joseph, the chaste spouse of Mary and foster-father of Jesus, is the model of quiet strength and obedience. A humble carpenter from Nazareth, he protected the Holy Family, leading them to Egypt to escape Herod and providing for them through his trade. Though the Gospels record no spoken words from him, his actions reveal a man of profound faith who trusted God\'s messengers in his dreams. He is the patron of the Universal Church and for a happy death. His silent service and unwavering faith offer a deep Lenten model of humble surrender to God\'s will.'**
  String get saintJosephBio;

  /// No description provided for @saintJosephQuote.
  ///
  /// In en, this message translates to:
  /// **'He was a just man.'**
  String get saintJosephQuote;

  /// No description provided for @saintJosephPrayer.
  ///
  /// In en, this message translates to:
  /// **'O Saint Joseph, whose protection is so great, so strong, so prompt before the Throne of God, I place in thee all my interests and desires. Obtain for me through thy powerful intercession all spiritual blessings through Jesus Christ. Amen.'**
  String get saintJosephPrayer;

  /// No description provided for @saintTuribiusName.
  ///
  /// In en, this message translates to:
  /// **'St. Turibius of Mogrovejo'**
  String get saintTuribiusName;

  /// No description provided for @saintTuribiusFeast.
  ///
  /// In en, this message translates to:
  /// **'March 23'**
  String get saintTuribiusFeast;

  /// No description provided for @saintTuribiusPatronage.
  ///
  /// In en, this message translates to:
  /// **'Latin American Bishops, native rights'**
  String get saintTuribiusPatronage;

  /// No description provided for @saintTuribiusBio.
  ///
  /// In en, this message translates to:
  /// **'St. Turibius (1538 – 1606) was a brilliant Spanish lawyer appointed Archbishop of Lima, Peru. Appalled by the injustices against indigenous peoples and clerical abuses, he dedicated his 26-year mission to reform. He traveled over 6,000 miles across his vast diocese, often on foot, learning local languages and defending the rights of the native inhabitants. He established schools, hospitals, and the first seminary in the Americas. His tireless advocacy for justice and his missionary zeal reflect the Lenten call to penance through action and solidarity with the marginalized.'**
  String get saintTuribiusBio;

  /// No description provided for @saintTuribiusQuote.
  ///
  /// In en, this message translates to:
  /// **'Time is not our own, and we must give a strict account of it.'**
  String get saintTuribiusQuote;

  /// No description provided for @saintTuribiusPrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, who didst increase Thy Church through the apostolic labors of Saint Turibius, grant that the people consecrated to Thee may ever receive an increase of faith and holiness. Amen.'**
  String get saintTuribiusPrayer;

  /// No description provided for @saintFrancisPaolaName.
  ///
  /// In en, this message translates to:
  /// **'St. Francis of Paola'**
  String get saintFrancisPaolaName;

  /// No description provided for @saintFrancisPaolaFeast.
  ///
  /// In en, this message translates to:
  /// **'April 2'**
  String get saintFrancisPaolaFeast;

  /// No description provided for @saintFrancisPaolaPatronage.
  ///
  /// In en, this message translates to:
  /// **'Seafarers, mariners'**
  String get saintFrancisPaolaPatronage;

  /// No description provided for @saintFrancisPaolaBio.
  ///
  /// In en, this message translates to:
  /// **'St. Francis of Paola (1416 – 1507) was the founder of the Order of Minims, dedicated to extreme humility and penance. At age 13, he became a hermit, living in a cave until followers joined him. He instituted a rule that included a \'perpetual Lent\'—a vow to abstain forever from all meat and animal products. Known as a wonderworker and prophet, he challenged rulers and spent his final years in the French court, helping King Louis XI prepare for death. His life of radical asceticism remains a powerful challenge and inspiration during the Lenten season.'**
  String get saintFrancisPaolaBio;

  /// No description provided for @saintFrancisPaolaQuote.
  ///
  /// In en, this message translates to:
  /// **'Fix your minds on the passion of our Lord Jesus Christ out of love for us.'**
  String get saintFrancisPaolaQuote;

  /// No description provided for @saintFrancisPaolaPrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, who didst raise Saint Francis of Paola to be a model of humility and penance, grant that through his intercession we may merit the rewards promised to the humble. Amen.'**
  String get saintFrancisPaolaPrayer;

  /// No description provided for @saintKatharineDrexelName.
  ///
  /// In en, this message translates to:
  /// **'St. Katharine Drexel'**
  String get saintKatharineDrexelName;

  /// No description provided for @saintKatharineDrexelFeast.
  ///
  /// In en, this message translates to:
  /// **'March 3'**
  String get saintKatharineDrexelFeast;

  /// No description provided for @saintKatharineDrexelPatronage.
  ///
  /// In en, this message translates to:
  /// **'Racial justice, philanthropists'**
  String get saintKatharineDrexelPatronage;

  /// No description provided for @saintKatharineDrexelBio.
  ///
  /// In en, this message translates to:
  /// **'St. Katharine Drexel (1858 – 1955) was a Philadelphia heiress who gave up her \$20 million fortune to serve Native and African Americans. Deeply moved by their mistreatment, she founded the Sisters of the Blessed Sacrament. Over her 96-year life, she established dozens of schools, mission stations, and Xavier University in New Orleans. She was a tireless advocate for racial justice and equality, reminding the world that the Eucharist calls us to radical love for all God\'s children. Her sacrifice of wealth for the sake of the Gospel is a profound Lenten witness of detachment and charity.'**
  String get saintKatharineDrexelBio;

  /// No description provided for @saintKatharineDrexelQuote.
  ///
  /// In en, this message translates to:
  /// **'The patient and humble endurance of the cross is the highest perfection.'**
  String get saintKatharineDrexelQuote;

  /// No description provided for @saintKatharineDrexelPrayer.
  ///
  /// In en, this message translates to:
  /// **'O God, who called Saint Katharine Drexel to serve the oppressed, grant us the grace to follow her example of charity and justice. Amen.'**
  String get saintKatharineDrexelPrayer;

  /// No description provided for @themeArray0.
  ///
  /// In en, this message translates to:
  /// **'Humility: The Foundation of Prayer'**
  String get themeArray0;

  /// No description provided for @themeArray1.
  ///
  /// In en, this message translates to:
  /// **'Patience: Waiting on the Lord'**
  String get themeArray1;

  /// No description provided for @themeArray2.
  ///
  /// In en, this message translates to:
  /// **'Charity: Love in Action'**
  String get themeArray2;

  /// No description provided for @themeArray3.
  ///
  /// In en, this message translates to:
  /// **'Repentance: Turning Back to God'**
  String get themeArray3;

  /// No description provided for @themeArray4.
  ///
  /// In en, this message translates to:
  /// **'Gratitude: Recognizing God\'s Gifts'**
  String get themeArray4;

  /// No description provided for @themeArray5.
  ///
  /// In en, this message translates to:
  /// **'Hope: Looking Toward the Promise'**
  String get themeArray5;

  /// No description provided for @themeArray6.
  ///
  /// In en, this message translates to:
  /// **'Faith: Trusting in the Unseen'**
  String get themeArray6;

  /// No description provided for @themeArray7.
  ///
  /// In en, this message translates to:
  /// **'Simplicity: Detaching from the World'**
  String get themeArray7;

  /// No description provided for @themeArray8.
  ///
  /// In en, this message translates to:
  /// **'Silence: Hearing the Still Small Voice'**
  String get themeArray8;

  /// No description provided for @themeArray9.
  ///
  /// In en, this message translates to:
  /// **'Obedience: Doing the Father\'s Will'**
  String get themeArray9;

  /// No description provided for @themeArray10.
  ///
  /// In en, this message translates to:
  /// **'Forgiveness: Releasing the Burden'**
  String get themeArray10;

  /// No description provided for @themeArray11.
  ///
  /// In en, this message translates to:
  /// **'Perseverance: Staying the Course'**
  String get themeArray11;

  /// No description provided for @themeArray12.
  ///
  /// In en, this message translates to:
  /// **'Mercy: Reflection of the Father'**
  String get themeArray12;

  /// No description provided for @themeArray13.
  ///
  /// In en, this message translates to:
  /// **'Justice: Walking in Truth'**
  String get themeArray13;

  /// No description provided for @themeArray14.
  ///
  /// In en, this message translates to:
  /// **'Service: Christ Among Us'**
  String get themeArray14;

  /// No description provided for @themeArray15.
  ///
  /// In en, this message translates to:
  /// **'Sacrifice: The Heart of Love'**
  String get themeArray15;

  /// No description provided for @themeArray16.
  ///
  /// In en, this message translates to:
  /// **'Wisdom: Seeking God\'s Mind'**
  String get themeArray16;

  /// No description provided for @themeArray17.
  ///
  /// In en, this message translates to:
  /// **'Peace: The Fruit of the Spirit'**
  String get themeArray17;

  /// No description provided for @themeArray18.
  ///
  /// In en, this message translates to:
  /// **'Joy: Strength in the Lord'**
  String get themeArray18;

  /// No description provided for @themeArray19.
  ///
  /// In en, this message translates to:
  /// **'Courage: Witnessing to the Truth'**
  String get themeArray19;

  /// No description provided for @themeArray20.
  ///
  /// In en, this message translates to:
  /// **'Purity: Seeing with New Eyes'**
  String get themeArray20;

  /// No description provided for @themeArray21.
  ///
  /// In en, this message translates to:
  /// **'Diligence: Guarding the Heart'**
  String get themeArray21;

  /// No description provided for @themeArray22.
  ///
  /// In en, this message translates to:
  /// **'Gentleness: The Power of Meekness'**
  String get themeArray22;

  /// No description provided for @themeArray23.
  ///
  /// In en, this message translates to:
  /// **'Self-Control: Freedom in Discipline'**
  String get themeArray23;

  /// No description provided for @themeArray24.
  ///
  /// In en, this message translates to:
  /// **'Kindness: A Cup of Cold Water'**
  String get themeArray24;

  /// No description provided for @themeArray25.
  ///
  /// In en, this message translates to:
  /// **'Generosity: Sowing Abundantly'**
  String get themeArray25;

  /// No description provided for @themeArray26.
  ///
  /// In en, this message translates to:
  /// **'Fidelity: Remaining in His Love'**
  String get themeArray26;

  /// No description provided for @themeArray27.
  ///
  /// In en, this message translates to:
  /// **'Modesty: Honouring the Temple'**
  String get themeArray27;

  /// No description provided for @themeArray28.
  ///
  /// In en, this message translates to:
  /// **'Temperance: Finding the Balance'**
  String get themeArray28;

  /// No description provided for @themeArray29.
  ///
  /// In en, this message translates to:
  /// **'Fortitude: Standing Fast'**
  String get themeArray29;

  /// No description provided for @themeArray30.
  ///
  /// In en, this message translates to:
  /// **'Prudence: Making the Right Choice'**
  String get themeArray30;

  /// No description provided for @themeArray31.
  ///
  /// In en, this message translates to:
  /// **'Hospitality: Welcoming the Stranger'**
  String get themeArray31;

  /// No description provided for @themeArray32.
  ///
  /// In en, this message translates to:
  /// **'Compassion: Suffering With Others'**
  String get themeArray32;

  /// No description provided for @themeArray33.
  ///
  /// In en, this message translates to:
  /// **'Unity: One Body in Christ'**
  String get themeArray33;

  /// No description provided for @themeArray34.
  ///
  /// In en, this message translates to:
  /// **'Reconciliation: Making Peace'**
  String get themeArray34;

  /// No description provided for @themeArray35.
  ///
  /// In en, this message translates to:
  /// **'Watchfulness: Ready for His Coming'**
  String get themeArray35;

  /// No description provided for @themeArray36.
  ///
  /// In en, this message translates to:
  /// **'Awe: Standing Before My Creator'**
  String get themeArray36;

  /// No description provided for @themeArray37.
  ///
  /// In en, this message translates to:
  /// **'Worship: Giving God His Due'**
  String get themeArray37;

  /// No description provided for @themeArray38.
  ///
  /// In en, this message translates to:
  /// **'Adoration: Resting in His Presence'**
  String get themeArray38;

  /// No description provided for @themeArray39.
  ///
  /// In en, this message translates to:
  /// **'Intercession: Praying for the World'**
  String get themeArray39;

  /// No description provided for @readingArray0.
  ///
  /// In en, this message translates to:
  /// **'John 3:16-17'**
  String get readingArray0;

  /// No description provided for @readingArray1.
  ///
  /// In en, this message translates to:
  /// **'Galatians 6:9-10'**
  String get readingArray1;

  /// No description provided for @readingArray2.
  ///
  /// In en, this message translates to:
  /// **'Psalm 34:18'**
  String get readingArray2;

  /// No description provided for @readingArray3.
  ///
  /// In en, this message translates to:
  /// **'Micah 6:8'**
  String get readingArray3;

  /// No description provided for @readingArray4.
  ///
  /// In en, this message translates to:
  /// **'Isaiah 1:18'**
  String get readingArray4;

  /// No description provided for @readingArray5.
  ///
  /// In en, this message translates to:
  /// **'James 4:8'**
  String get readingArray5;

  /// No description provided for @readingArray6.
  ///
  /// In en, this message translates to:
  /// **'1 John 1:9'**
  String get readingArray6;

  /// No description provided for @readingArray7.
  ///
  /// In en, this message translates to:
  /// **'Romans 12:1-2'**
  String get readingArray7;

  /// No description provided for @readingArray8.
  ///
  /// In en, this message translates to:
  /// **'Matthew 11:28-30'**
  String get readingArray8;

  /// No description provided for @readingArray9.
  ///
  /// In en, this message translates to:
  /// **'Psalm 103:10-12'**
  String get readingArray9;

  /// No description provided for @readingArray10.
  ///
  /// In en, this message translates to:
  /// **'Philippians 4:13'**
  String get readingArray10;

  /// No description provided for @readingArray11.
  ///
  /// In en, this message translates to:
  /// **'1 Peter 5:6-7'**
  String get readingArray11;

  /// No description provided for @readingArray12.
  ///
  /// In en, this message translates to:
  /// **'Isaiah 40:31'**
  String get readingArray12;

  /// No description provided for @readingArray13.
  ///
  /// In en, this message translates to:
  /// **'Psalm 46:10'**
  String get readingArray13;

  /// No description provided for @readingArray14.
  ///
  /// In en, this message translates to:
  /// **'Matthew 6:33'**
  String get readingArray14;

  /// No description provided for @readingArray15.
  ///
  /// In en, this message translates to:
  /// **'Romans 8:28'**
  String get readingArray15;

  /// No description provided for @readingArray16.
  ///
  /// In en, this message translates to:
  /// **'2 Corinthians 12:9'**
  String get readingArray16;

  /// No description provided for @readingArray17.
  ///
  /// In en, this message translates to:
  /// **'Lamentations 3:22-23'**
  String get readingArray17;

  /// No description provided for @readingArray18.
  ///
  /// In en, this message translates to:
  /// **'Proverbs 3:5-6'**
  String get readingArray18;

  /// No description provided for @readingArray19.
  ///
  /// In en, this message translates to:
  /// **'Ephesians 2:8-9'**
  String get readingArray19;

  /// No description provided for @readingArray20.
  ///
  /// In en, this message translates to:
  /// **'Philippians 4:6-7'**
  String get readingArray20;

  /// No description provided for @readingArray21.
  ///
  /// In en, this message translates to:
  /// **'Colossians 3:17'**
  String get readingArray21;

  /// No description provided for @readingArray22.
  ///
  /// In en, this message translates to:
  /// **'Psalm 119:105'**
  String get readingArray22;

  /// No description provided for @readingArray23.
  ///
  /// In en, this message translates to:
  /// **'Matthew 5:16'**
  String get readingArray23;

  /// No description provided for @readingArray24.
  ///
  /// In en, this message translates to:
  /// **'Isaiah 41:10'**
  String get readingArray24;

  /// No description provided for @readingArray25.
  ///
  /// In en, this message translates to:
  /// **'Hebrews 11:1'**
  String get readingArray25;

  /// No description provided for @readingArray26.
  ///
  /// In en, this message translates to:
  /// **'James 1:2-4'**
  String get readingArray26;

  /// No description provided for @readingArray27.
  ///
  /// In en, this message translates to:
  /// **'1 Peter 4:8'**
  String get readingArray27;

  /// No description provided for @readingArray28.
  ///
  /// In en, this message translates to:
  /// **'Galatians 5:22-23'**
  String get readingArray28;

  /// No description provided for @readingArray29.
  ///
  /// In en, this message translates to:
  /// **'Colossians 3:12'**
  String get readingArray29;

  /// No description provided for @readingArray30.
  ///
  /// In en, this message translates to:
  /// **'1 Thessalonians 5:16-18'**
  String get readingArray30;

  /// No description provided for @readingArray31.
  ///
  /// In en, this message translates to:
  /// **'Psalm 23:1-3'**
  String get readingArray31;

  /// No description provided for @readingArray32.
  ///
  /// In en, this message translates to:
  /// **'John 14:27'**
  String get readingArray32;

  /// No description provided for @readingArray33.
  ///
  /// In en, this message translates to:
  /// **'Romans 15:13'**
  String get readingArray33;

  /// No description provided for @readingArray34.
  ///
  /// In en, this message translates to:
  /// **'2 Timothy 1:7'**
  String get readingArray34;

  /// No description provided for @readingArray35.
  ///
  /// In en, this message translates to:
  /// **'Psalm 16:11'**
  String get readingArray35;

  /// No description provided for @readingArray36.
  ///
  /// In en, this message translates to:
  /// **'Isaiah 26:3'**
  String get readingArray36;

  /// No description provided for @readingArray37.
  ///
  /// In en, this message translates to:
  /// **'Matthew 7:7'**
  String get readingArray37;

  /// No description provided for @readingArray38.
  ///
  /// In en, this message translates to:
  /// **'Hebrews 13:8'**
  String get readingArray38;

  /// No description provided for @readingArray39.
  ///
  /// In en, this message translates to:
  /// **'James 5:16'**
  String get readingArray39;

  /// No description provided for @dailyInspirationSuffix.
  ///
  /// In en, this message translates to:
  /// **'Daily Inspiration'**
  String get dailyInspirationSuffix;

  /// No description provided for @reflectionArray0.
  ///
  /// In en, this message translates to:
  /// **'God\'s grace is always available if we but open our hearts. What is one thing you can set aside today to make more room for Him?'**
  String get reflectionArray0;

  /// No description provided for @reflectionArray1.
  ///
  /// In en, this message translates to:
  /// **'Lent is not about what we give up, but what we gain in Christ. Seek a deeper relationship with Jesus through quiet prayer today.'**
  String get reflectionArray1;

  /// No description provided for @reflectionArray2.
  ///
  /// In en, this message translates to:
  /// **'The path to holiness is paved with small acts of love. How can you be a blessing to someone in your family or workplace today?'**
  String get reflectionArray2;

  /// No description provided for @reflectionArray3.
  ///
  /// In en, this message translates to:
  /// **'True repentance is a change of mind and heart. Ask the Holy Spirit to reveal any areas of your life that need to be surrendered to God.'**
  String get reflectionArray3;

  /// No description provided for @reflectionArray4.
  ///
  /// In en, this message translates to:
  /// **'In the busyness of life, silence is a sanctuary. Spend ten minutes in complete silence today, simply listening for God\'s voice.'**
  String get reflectionArray4;

  /// No description provided for @reflectionArray5.
  ///
  /// In en, this message translates to:
  /// **'Mercy is God\'s greatest attribute. If you have been far from Him, know that He is waiting with open arms to welcome you back.'**
  String get reflectionArray5;

  /// No description provided for @reflectionArray6.
  ///
  /// In en, this message translates to:
  /// **'Fasting is not just about food; it\'s about detaching from anything that takes the place of God in our lives.'**
  String get reflectionArray6;

  /// No description provided for @reflectionArray7.
  ///
  /// In en, this message translates to:
  /// **'Almsgiving is a concrete way of showing love for God by loving our neighbour. Look for a hidden need today.'**
  String get reflectionArray7;

  /// No description provided for @reflectionArray8.
  ///
  /// In en, this message translates to:
  /// **'Temptation is part of the human struggle. Remember that Jesus faced temptation and emerged victorious through the power of God\'s Word.'**
  String get reflectionArray8;

  /// No description provided for @reflectionArray9.
  ///
  /// In en, this message translates to:
  /// **'Prayer is the breath of the soul. Even a short aspiration like \'Lord Jesus, have mercy on me\' can transform your day.'**
  String get reflectionArray9;

  /// No description provided for @reflectionArray10.
  ///
  /// In en, this message translates to:
  /// **'Forgiveness is a gift we give ourselves as much as others. Ask for the grace to release any lingering bitterness.'**
  String get reflectionArray10;

  /// No description provided for @reflectionArray11.
  ///
  /// In en, this message translates to:
  /// **'Wait for the Lord with courage and let your heart be stout. God\'s timing is perfect, even when it feels slow.'**
  String get reflectionArray11;

  /// No description provided for @reflectionArray12.
  ///
  /// In en, this message translates to:
  /// **'Seek first the Kingdom of God. When our priorities are aligned with Christ, everything else finds its proper place.'**
  String get reflectionArray12;

  /// No description provided for @reflectionArray13.
  ///
  /// In en, this message translates to:
  /// **'Let your light shine before others. Reflection on how your actions point people toward the goodness of God.'**
  String get reflectionArray13;

  /// No description provided for @reflectionArray14.
  ///
  /// In en, this message translates to:
  /// **'The Lord is close to the brokenhearted. If you are struggling today, know that God is holding you in His tender care.'**
  String get reflectionArray14;

  /// No description provided for @reflectionArray15.
  ///
  /// In en, this message translates to:
  /// **'Whatever you do, do everything for the glory of God. Even the most mundane tasks can be offered as a prayer.'**
  String get reflectionArray15;

  /// No description provided for @reflectionArray16.
  ///
  /// In en, this message translates to:
  /// **'Your word is a lamp to my feet. Spend some time today reading a few extra verses of the Gospel.'**
  String get reflectionArray16;

  /// No description provided for @reflectionArray17.
  ///
  /// In en, this message translates to:
  /// **'Cast all your anxieties on Him because He cares for you. Surrender your worries into the hands of the Father.'**
  String get reflectionArray17;

  /// No description provided for @reflectionArray18.
  ///
  /// In en, this message translates to:
  /// **'Be still and know that I am God. In the stillness, we find the strength to face the noise of the world.'**
  String get reflectionArray18;

  /// No description provided for @reflectionArray19.
  ///
  /// In en, this message translates to:
  /// **'Rejoice in the Lord always. Even in the desert of Lent, there is a deep and abiding joy in being a child of God.'**
  String get reflectionArray19;

  /// No description provided for @reflectionArray20.
  ///
  /// In en, this message translates to:
  /// **'God\'s grace is always available if we but open our hearts. What is one thing you can set aside today to make more room for Him?'**
  String get reflectionArray20;

  /// No description provided for @prayerArray0.
  ///
  /// In en, this message translates to:
  /// **'Lord Jesus, grant me the humility to see myself as You see me, and the courage to follow where You lead.'**
  String get prayerArray0;

  /// No description provided for @prayerArray1.
  ///
  /// In en, this message translates to:
  /// **'Holy Spirit, breathe into me Your peace today. Help me to trust in God\'s timing and His perfect plan.'**
  String get prayerArray1;

  /// No description provided for @prayerArray2.
  ///
  /// In en, this message translates to:
  /// **'Father, thank You for Your infinite mercy. Help me to be a reflection of Your love to all those I encounter.'**
  String get prayerArray2;

  /// No description provided for @prayerArray3.
  ///
  /// In en, this message translates to:
  /// **'Jesus, I surrender my worries and fears to You. Be the center of my life today and always.'**
  String get prayerArray3;

  /// No description provided for @prayerArray4.
  ///
  /// In en, this message translates to:
  /// **'Lord, teach me to love as You love. May my heart be moved with compassion for the poor and the suffering.'**
  String get prayerArray4;

  /// No description provided for @prayerArray5.
  ///
  /// In en, this message translates to:
  /// **'God, give me a heart of gratitude for all the blessings, seen and unseen, that You have poured into my life.'**
  String get prayerArray5;

  /// No description provided for @prayerArray6.
  ///
  /// In en, this message translates to:
  /// **'Lord, help me to be patient with myself and others as I strive to walk the path of holiness.'**
  String get prayerArray6;

  /// No description provided for @prayerArray7.
  ///
  /// In en, this message translates to:
  /// **'Jesus, grant me the grace of final perseverance. Keep me faithful to You until the end of my days.'**
  String get prayerArray7;

  /// No description provided for @prayerArray8.
  ///
  /// In en, this message translates to:
  /// **'Holy Spirit, enlighten my mind to understand the Scriptures and my heart to live them out.'**
  String get prayerArray8;

  /// No description provided for @prayerArray9.
  ///
  /// In en, this message translates to:
  /// **'Father, into Your hands I commend my spirit today. Guide my thoughts, my words, and my actions.'**
  String get prayerArray9;

  /// No description provided for @themeFridayAfterAsh.
  ///
  /// In en, this message translates to:
  /// **'Friday after Ash Wednesday: Fasting with Purpose'**
  String get themeFridayAfterAsh;

  /// No description provided for @themeGoodFriday.
  ///
  /// In en, this message translates to:
  /// **'Good Friday: The Passion of our Lord'**
  String get themeGoodFriday;

  /// No description provided for @themeFirstSunday.
  ///
  /// In en, this message translates to:
  /// **'First Sunday: Into the Desert'**
  String get themeFirstSunday;

  /// No description provided for @themeSecondSunday.
  ///
  /// In en, this message translates to:
  /// **'Second Sunday: The Transfiguration'**
  String get themeSecondSunday;

  /// No description provided for @themeThirdSunday.
  ///
  /// In en, this message translates to:
  /// **'Third Sunday: Living Water'**
  String get themeThirdSunday;

  /// No description provided for @themeFourthSunday.
  ///
  /// In en, this message translates to:
  /// **'Fourth Sunday (Laetare): Light for the Journey'**
  String get themeFourthSunday;

  /// No description provided for @themeFifthSunday.
  ///
  /// In en, this message translates to:
  /// **'Fifth Sunday: I Am the Resurrection'**
  String get themeFifthSunday;

  /// No description provided for @themeHolyThursday.
  ///
  /// In en, this message translates to:
  /// **'Holy Thursday: The Gift of the Eucharist'**
  String get themeHolyThursday;

  /// No description provided for @themeHolySaturday.
  ///
  /// In en, this message translates to:
  /// **'Holy Saturday: The Great Silence'**
  String get themeHolySaturday;

  /// No description provided for @readingSundayGeneric.
  ///
  /// In en, this message translates to:
  /// **'Matthew 4:1-11 - \'Man does not live by bread alone\''**
  String get readingSundayGeneric;

  /// No description provided for @reflectionAshWednesday.
  ///
  /// In en, this message translates to:
  /// **'Today we receive ashes on our foreheads. It is a sign of our mortality and our need for repentance. Let this mark be a reminder to start your journey with a humble heart.'**
  String get reflectionAshWednesday;

  /// No description provided for @reflectionFridayGeneric.
  ///
  /// In en, this message translates to:
  /// **'Reflecting on the Passion of our Lord. As we walk the Stations of the Cross, consider the weight of our sins and the depth of His love.'**
  String get reflectionFridayGeneric;

  /// No description provided for @reflectionSundayGeneric.
  ///
  /// In en, this message translates to:
  /// **'Sunday is a \'Little Easter\'. Even in Lent, we celebrate the Resurrection. Let this joy sustain you through the coming week of sacrifice.'**
  String get reflectionSundayGeneric;

  /// No description provided for @reflectionHolyThursday.
  ///
  /// In en, this message translates to:
  /// **'At the Last Supper, Jesus gave us his Body and Blood and the commandment of love. Reflect on how you serve others with a humble heart.'**
  String get reflectionHolyThursday;

  /// No description provided for @reflectionGoodFriday.
  ///
  /// In en, this message translates to:
  /// **'At the foot of the Cross. Silence and sorrow. Reflect on the ultimate sacrifice made for your redemption.'**
  String get reflectionGoodFriday;

  /// No description provided for @reflectionHolySaturday.
  ///
  /// In en, this message translates to:
  /// **'The world is silent. God is in the tomb. Wait in prayerful expectation for the light of the Resurrection.'**
  String get reflectionHolySaturday;

  /// No description provided for @reflectionEaster.
  ///
  /// In en, this message translates to:
  /// **'Alleluia! Christ is Risen! Today we celebrate the victory of life over death. Let your heart be filled with the joy of the Resurrection and carry this light into the world.'**
  String get reflectionEaster;

  /// No description provided for @prayerAshWednesday.
  ///
  /// In en, this message translates to:
  /// **'Lord, help me to enter this Lenten season with a heart open to Your grace. May my fast be pleasing to You.'**
  String get prayerAshWednesday;

  /// No description provided for @prayerFridayGeneric.
  ///
  /// In en, this message translates to:
  /// **'Jesus, help me to carry my cross today as You carried Yours. Give me strength in my weakness.'**
  String get prayerFridayGeneric;

  /// No description provided for @prayerSundayGeneric.
  ///
  /// In en, this message translates to:
  /// **'Alleluia! Lord, thank You for the gift of the Resurrection. Renew my spirit this day.'**
  String get prayerSundayGeneric;

  /// No description provided for @prayerEaster.
  ///
  /// In en, this message translates to:
  /// **'Alleluia! Lord Jesus, thank You for the gift of new life. May the joy of Your Resurrection remain in my heart always. Alleluia!'**
  String get prayerEaster;

  /// No description provided for @prayerHolyWeek.
  ///
  /// In en, this message translates to:
  /// **'Lord, as I enter Holy Week, keep my eyes fixed on You. May I die to myself and live for You.'**
  String get prayerHolyWeek;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'es',
        'fr',
        'it',
        'ko',
        'la',
        'pl',
        'pt',
        'tl',
        'vi'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ko':
      return AppLocalizationsKo();
    case 'la':
      return AppLocalizationsLa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'tl':
      return AppLocalizationsTl();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
