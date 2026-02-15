import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';
import '../providers/lent_state_provider.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';
import '../widgets/glow_fab.dart';

class AlmsgivingScreen extends StatefulWidget {
  const AlmsgivingScreen({super.key});

  @override
  State<AlmsgivingScreen> createState() => _AlmsgivingScreenState();
}

class _AlmsgivingScreenState extends State<AlmsgivingScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _mercyController = TextEditingController();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _amountController.dispose();
    _mercyController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> _charities = [
    {
      'name': 'Catholic Relief Services (CRS)',
      'desc': 'International relief and development agency.',
      'url': 'https://www.crs.org',
    },
    {
      'name': 'Fund for Vocations',
      'desc':
          'Eliminating student loan debt for those entering religious life.',
      'url': 'https://fundforvocations.org',
    },
    {
      'name': 'The Labouré Society',
      'desc': 'Assisting those overcome student loan debt to enter vocation.',
      'url': 'https://labouresociety.org',
    },
    {
      'name': 'Catholic Charities USA',
      'desc': 'Provides services to people in need in the US.',
      'url': 'https://www.catholiccharitiesusa.org',
    },
    {
      'name': 'Joseph House Catholic Worker',
      'desc': 'Hospitality house serving the homeless in Rochester, NY.',
      'url': 'https://www.josephhousecw.org',
    },
    {
      'name': 'Mary House Catholic Worker',
      'desc': 'Community of hospitality in New York City.',
      'url': 'https://www.catholicworker.org',
    },
    {
      'name': 'Dorothy Day Catholic Worker',
      'desc': 'Houses of hospitality following Dorothy Day\'s vision.',
      'url': 'https://www.catholicworker.org',
    },
    {
      'name': 'Aid to the Church in Need',
      'desc': 'Supporting persecuted Christians globally.',
      'url': 'https://www.churchinneed.org',
    },
    {
      'name': 'Mary\'s Meals',
      'desc': 'Provides daily meals in schools for impoverished children.',
      'url': 'https://www.marysmeals.org',
    },
    {
      'name': 'Unbound',
      'desc': 'Sponsorship for children and aging friends living in poverty.',
      'url': 'https://www.unbound.org',
    },
    {
      'name': 'Knights of Columbus Charities',
      'desc': 'Philanthropic programs and fraternal services.',
      'url': 'https://www.kofc.org/charities',
    },
    {
      'name': 'Cross Catholic Outreach',
      'desc': 'Mobilizing the global Catholic Church to transform the poor.',
      'url': 'https://www.crosscatholic.org',
    },
    {
      'name': 'St. Jude Children\'s Research Hospital',
      'desc':
          'Leading the way the world understands and treats childhood cancer.',
      'url': 'https://www.stjude.org',
    },
    {
      'name': 'Caritas Internationalis',
      'desc':
          'A confederation of Catholic relief and social service organizations.',
      'url': 'https://www.caritas.org',
    },
    {
      'name': 'The Little Sisters of the Poor',
      'desc': 'Serving the elderly poor in over 30 countries.',
      'url': 'https://www.littlesistersofthepoor.org',
    },
    {
      'name': 'FOCUS',
      'desc': 'Fellowship of Catholic University Students on mission.',
      'url': 'https://www.focus.org',
    },
    {
      'name': 'Covenant House',
      'desc': 'Providing housing and support services to homeless youth.',
      'url': 'https://www.covenanthouse.org',
    },
    {
      'name': 'Catholic Medical Mission Board',
      'desc': 'Providing health care to the world\'s poorest people.',
      'url': 'https://www.cmmb.org',
    },
    {
      'name': 'Jesuit Refugee Service',
      'desc': 'Accompanying, serving, and advocating for refugees.',
      'url': 'https://www.jrs.net',
    },
    {
      'name': 'Pontifical Mission Societies',
      'desc': 'The Pope\'s official charity for mission work.',
      'url': 'https://www.propfaith.org',
    },
    {
      'name': 'Catholic Near East Welfare Association',
      'desc': 'Supporting the churches and peoples of the East.',
      'url': 'https://www.cnewa.org',
    },
    {
      'name': 'St. Vincent de Paul Society',
      'desc': 'Direct service to the poor through local conferences.',
      'url': 'https://www.ssvpusa.org',
    },
    {
      'name': 'Food for the Poor',
      'desc': 'Providing food, medicine, and shelter in Latin America.',
      'url': 'https://www.foodforthepoor.org',
    },
    {
      'name': 'Malteser International',
      'desc': 'Order of Malta\'s relief agency for humanitarian aid.',
      'url': 'https://www.malteser-international.org',
    },
    {
      'name': 'Catholic Extension',
      'desc': 'Building faith communities in US mission dioceses.',
      'url': 'https://www.catholicextension.org',
    },
    {
      'name': 'Apostleship of the Sea',
      'desc': 'Stella Maris - supporting seafarers and fishers worldwide.',
      'url': 'https://www.stellamaris.org.uk',
    },
    {
      'name': 'Solidarity with South Sudan',
      'desc': 'Religious congregations serving the people of South Sudan.',
      'url': 'https://www.solidarityssudan.org',
    },
    {
      'name': 'Catholic Answers',
      'desc': 'Explaining and defending the Catholic faith.',
      'url': 'https://www.catholic.com',
    },
    {
      'name': 'The Gianna Center',
      'desc': 'Catholic healthcare for women and families.',
      'url': 'https://www.giannacenter.com',
    },
    {
      'name': 'Net Ministries',
      'desc': 'Challenging young Catholics to love Christ.',
      'url': 'https://www.netusa.org',
    },
    {
      'name': 'EWTN',
      'desc': 'Spreading the splendor of Truth through Catholic media.',
      'url': 'https://www.ewtn.com',
    },
    {
      'name': 'Little Sisters of the Holy Family',
      'desc': 'Supporting families and parish life.',
      'url': 'https://www.lshf.org',
    },
    // Highly-vetted poverty charities
    {
      'name': 'GiveDirectly',
      'desc': 'Direct cash transfers to people living in extreme poverty.',
      'url': 'https://www.givedirectly.org',
    },
    {
      'name': 'Against Malaria Foundation',
      'desc': 'Preventing malaria by distributing insecticide-treated nets.',
      'url': 'https://www.againstmalaria.com',
    },
    {
      'name': 'Helen Keller International',
      'desc': 'Preventing blindness and reducing malnutrition worldwide.',
      'url': 'https://www.hki.org',
    },
    {
      'name': 'Evidence Action',
      'desc': 'Scaling proven interventions for global poverty.',
      'url': 'https://www.evidenceaction.org',
    },
    {
      'name': 'The END Fund',
      'desc': 'Controlling and eliminating neglected tropical diseases.',
      'url': 'https://www.end.org',
    },
    {
      'name': 'Sightsavers',
      'desc': 'Preventing avoidable blindness and fighting for equality.',
      'url': 'https://www.sightsavers.org',
    },
    {
      'name': 'Oxfam International',
      'desc': 'Fighting inequality to end poverty and injustice.',
      'url': 'https://www.oxfam.org',
    },
    {
      'name': 'CARE International',
      'desc': 'Fighting global poverty with a focus on women and girls.',
      'url': 'https://www.care.org',
    },
    {
      'name': 'Partners In Health',
      'desc': 'Providing healthcare to the world\'s poorest communities.',
      'url': 'https://www.pih.org',
    },
    {
      'name': 'Doctors Without Borders',
      'desc': 'Medical humanitarian aid in crisis zones worldwide.',
      'url': 'https://www.doctorswithoutborders.org',
    },
  ];

  void _logDonation() {
    final amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0) {
      context.read<LentStateProvider>().recordDonation(amount);
      _amountController.clear();
      _confettiController.play();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Logged \$${amount.toStringAsFixed(2)} donation! God bless you.'),
          backgroundColor: CatholicTheme.lentenIndigo,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LentStateProvider>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CatholicTheme.softWhite,
              CatholicTheme.incenseWhite,
              CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 550, // Increased from 400 to accommodate 330px icon
                    pinned: true,
                    stretch: true,
                    backgroundColor: CatholicTheme.lentenIndigo,
                    elevation: innerBoxIsScrolled ? 4 : 0,
                    forceElevated: innerBoxIsScrolled,
                    leading: const BackButton(color: Colors.white),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      centerTitle: true,
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: innerBoxIsScrolled ? 1.0 : 0.0,
                        child: Text(
                          'ALMSGIVING',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          // 1. Light Background
                          Container(color: CatholicTheme.softWhite),

                          // 2. Clear Hierarchy: Title -> Stats -> Art
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top + 20),
                            child: Column(
                              children: [
                                const SizedBox(height: 20), // Reduced from 40
                                Text(
                                  'LENTEN GIVING',
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 36, // Reduced from 42
                                    fontWeight: FontWeight.w900,
                                    color: CatholicTheme.lentenIndigo,
                                    letterSpacing: -0.5,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                                    .animate()
                                    .fadeIn()
                                    .slideY(begin: -0.2, end: 0),
                                const SizedBox(height: 4), // Reduced from 8
                                Text(
                                  'SACRIFICE & CHARITY'.toUpperCase(),
                                  style: GoogleFonts.inter(
                                    fontSize: 11, // Reduced from 12
                                    fontWeight: FontWeight.bold,
                                    color: CatholicTheme.lentenIndigo
                                        .withValues(alpha: 0.4),
                                    letterSpacing: 3, // Reduced from 4
                                  ),
                                ),
                                const SizedBox(height: 12), // Reduced from 20
                                 // New Almsgiving Icon with Golden Glow
                                 Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     // The Glow
                                     Container(
                                       height: 280,
                                       width: 280,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         boxShadow: [
                                           BoxShadow(
                                             color: CatholicTheme.sacredGold.withValues(alpha: 0.4),
                                             blurRadius: 70,
                                             spreadRadius: 20,
                                           ),
                                           BoxShadow(
                                             color: CatholicTheme.sacredGold.withValues(alpha: 0.2),
                                             blurRadius: 100,
                                             spreadRadius: 40,
                                           ),
                                         ],
                                       ),
                                     ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                                      .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.2, 1.2), duration: 3.seconds, curve: Curves.easeInOut),
                                     
                                     Container(
                                       height: 330,
                                       width: 330,
                                       child: Image.asset(
                                         'assets/images/icons/almsgiving.png',
                                         fit: BoxFit.contain,
                                       ),
                                     ),
                                   ],
                                 ).animate().scale(
                                     duration: 600.ms,
                                     curve: Curves.easeOutBack),
                                const SizedBox(height: 12), // Reduced from 20
                                Text(
                                  'Total Donated: \$${state.totalDonated.toStringAsFixed(2)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16, // Reduced from 18
                                    fontWeight: FontWeight.w600,
                                    color: CatholicTheme.goldAccent,
                                  ),
                                 ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32), // Padding before quote
                    Text(
                      'He who has mercy on the poor lends to the Lord.',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24, // Increased from 18
                        fontStyle: FontStyle.italic,
                        color: CatholicTheme.lentenIndigo.withValues(alpha: 0.8),
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 800.ms),
                    const SizedBox(height: 48),
                    _buildSectionHeader(context, 'Daily Almsgiving Ideas')
                        .animate()
                        .fadeIn(delay: 200.ms),
                    const SizedBox(height: 16),
                    ...[
                      'Buy a meal for a homeless person.',
                      'Donate unused clothes to a local shelter.',
                      'Set aside a small amount of money daily for charity.',
                      'Purchase items for a local food pantry.',
                      'Support a missionary or religious community.',
                      'Fast from one digital app and donate the time saved in prayer.',
                      'Write 3 handwritten letters to elderly parishioners.',
                      'Offer to run errands for a busy family or neighbor.',
                      'Double your usual Sunday collection contribution.',
                      'Clean up litter in a local park or around your church.',
                      'Sponsor a child\'s education through a Catholic mission.',
                      'Donate a bag of high-quality coffee to a local soup kitchen.',
                      'Volunteer for one hour at a pregnancy resource center.',
                      'Give up your luxury beverage for a week and donate the cost.',
                      'Pray for the intentions of the people you see on the street.',
                      'Donate blood or plasma.',
                      'Organize a small food drive among your friends.',
                      'Offer to babysit for free for a couple to go to Adoration.',
                      'Purchase a religious book for a friend or family member.',
                      'Leave a generous tip for a service worker.',
                      'Donate feminine hygiene products to a women\'s shelter.',
                      'Visit a cemetery and pray for the forgotten souls.',
                      'Give a compliment to someone you usually struggle with.',
                      'Share a spiritually uplifting article or video online.',
                      'Spend 15 minutes listening to someone who is lonely.',
                      'Pay for the groceries of the person behind you in line.',
                      'Donate new socks and underwear to a homeless shelter.',
                      'Offer to mow a neighbor\'s lawn or shovel their driveway for free.',
                      'Buy gift cards to give to people experiencing homelessness.',
                      'Donate your professional skills pro bono.',
                      'Send care packages to deployed military members.',
                      'Sponsor a refugee family through a resettlement agency.',
                      'Donate art supplies to an after-school program.',
                      'Pay off someone\'s layaway items at a local store.',
                      'Contribute to a crowdfunding campaign for medical expenses.',
                      'Donate gently used books to a prison library.',
                      'Buy and distribute hygiene kits to those in need.',
                      'Offer free tutoring to students struggling academically.',
                      'Donate musical instruments to a school music program.',
                      'Pay for someone\'s prescription medication.',
                      'Contribute to a scholarship fund for underprivileged students.',
                      'Donate professional clothing to a job training program.',
                      'Buy and donate diapers to a crisis pregnancy center.',
                      'Sponsor a child\'s participation in sports.',
                      'Donate blankets to a homeless outreach.',
                      'Pay for a stranger\'s coffee or meal.',
                      'Contribute to pay off school lunch debt.',
                      'Donate new toys to a domestic violence shelter.',
                      'Offer to drive elderly neighbors to appointments.',
                      'Buy and donate pet food to an animal shelter.',
                      'Contribute to a bail fund for those in need.',
                      'Donate eyeglasses through a vision program.',
                      'Pay for a family\'s utility bill.',
                      'Donate seeds to a community garden.',
                      'Sponsor a meal at a Ronald McDonald House.',
                    ].asMap().entries.map((entry) =>
                        _buildAlmsgivingIdea(entry.value)
                            .animate()
                            .fadeIn(delay: (300 + (entry.key % 10) * 50).ms)
                            .slideX(begin: 0.05, end: 0)),
                    const SizedBox(height: 48),
                    _buildSectionHeader(context, 'Log a Donation'),
                    const SizedBox(height: 16),
                    HolyCard(
                      isGlass: true,
                      showCross: true,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixText: r'$ ',
                                hintText: 'Amount',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                filled: true,
                                fillColor: CatholicTheme.pureWhite,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GlowFab(
                            onPressed: _logDonation,
                            icon: Icons.add,
                            label: 'Log',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    _buildSectionHeader(context, 'Featured Catholic Charities'),
                    const SizedBox(height: 16),
                    ..._charities.take(15).map((charity) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: HolyCard(
                            isGlass: true,
                            padding: EdgeInsets.zero,
                            onTap: () async {
                              final url = Uri.parse(charity['url']!);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              }
                            },
                            child: ListTile(
                              title: Text(charity['name']!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(charity['desc']!),
                              trailing: const Icon(Icons.open_in_new,
                                  size: 20, color: CatholicTheme.lentenIndigo),
                            ),
                          ),
                        )),
                    const SizedBox(height: 48),
                    _buildSectionHeader(context, 'Acts of Mercy'),
                    const SizedBox(height: 16),
                    HolyCard(
                      isGlass: true,
                      backgroundColor:
                          CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                      child: Column(
                        children: [
                          TextField(
                            controller: _mercyController,
                            decoration: InputDecoration(
                              hintText:
                                  'What act of mercy did you perform today?',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                if (_mercyController.text.isNotEmpty) {
                                  state.recordMercyLog(_mercyController.text);
                                  _mercyController.clear();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Act of Mercy logged! God bless you.')),
                                  );
                                }
                              },
                              icon: const Icon(Icons.favorite, size: 18),
                              label: const Text('Log Act of Mercy'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (state.mercyLogs.isNotEmpty) ...[
                      const SizedBox(height: 32),
                      _buildSectionHeader(context, 'Recent Acts of Mercy'),
                      const SizedBox(height: 16),
                      ...state.mercyLogs.reversed.take(5).map((log) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: HolyCard(
                              isGlass: true,
                              padding: EdgeInsets.zero,
                              child: ListTile(
                                leading: const Icon(Icons.check_circle,
                                    color: CatholicTheme.lentenIndigo),
                                title: Text(log['description'],
                                    style:
                                        GoogleFonts.inter(fontSize: 18)),
                                subtitle: Text('Day ${log['day']}',
                                    style: const TextStyle(fontSize: 14)),
                              ),
                            ),
                          )),
                    ],
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  CatholicTheme.lentenIndigo,
                  CatholicTheme.goldAccent,
                  Colors.white,
                  Colors.purpleAccent,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 8),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: CatholicTheme.lentenIndigo,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _buildAlmsgivingIdea(String idea) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: HolyCard(
        isGlass: true,
        onTap: () {
          context.read<LentStateProvider>().recordMercyLog(idea);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logged: "$idea"'),
              backgroundColor: CatholicTheme.lentenIndigo,
              duration: const Duration(seconds: 2),
            ),
          );
        },
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: CatholicTheme.lentenIndigo.withValues(alpha: 0.02),
        child: Row(
          children: [
            const Icon(Icons.star_border,
                size: 20, color: CatholicTheme.goldAccent),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                idea,
                style: GoogleFonts.inter(
                    fontSize: 15, color: CatholicTheme.deepSlate),
              ),
            ),
            const Icon(Icons.add_circle_outline,
                size: 20, color: CatholicTheme.lentenIndigo),
          ],
        ),
      ),
    );
  }
}
