import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/lent_state_provider.dart';
import '../models/lenten_recipes.dart';
import '../models/lenten_recipe.dart';
import 'recipe_detail_screen.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';
import '../widgets/ornate_header.dart';
import '../widgets/glow_fab.dart';

class FastingScreen extends StatefulWidget {
  const FastingScreen({super.key});

  @override
  State<FastingScreen> createState() => _FastingScreenState();
}

class _FastingScreenState extends State<FastingScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Consumer<LentStateProvider>(
          builder: (context, state, child) {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 550, // Match almsgiving page
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
                          'FASTING & DISCIPLINE',
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
                          // Light Background
                          Container(color: CatholicTheme.softWhite),

                          // Content: Title -> Icon -> Stats
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top + 20),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  'FASTING',
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w900,
                                    color: CatholicTheme.lentenIndigo,
                                    letterSpacing: -0.5,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                                    .animate()
                                    .fadeIn()
                                    .slideY(begin: -0.2, end: 0),
                                const SizedBox(height: 4),
                                Text(
                                  'DISCIPLINE \u0026 SACRIFICE'.toUpperCase(),
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: CatholicTheme.lentenIndigo
                                        .withValues(alpha: 0.4),
                                    letterSpacing: 3,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                 // Fasting Icon with Golden Glow
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
                                         'assets/images/icons/fasting.png',
                                         fit: BoxFit.contain,
                                       ),
                                     ),
                                   ],
                                 ).animate().scale(
                                     duration: 600.ms,
                                     curve: Curves.easeOutBack),
                                const SizedBox(height: 12),
                                Text(
                                  'Fast Type: ${state.fastType}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: CatholicTheme.lentenIndigo,
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Fasting Timer
                    _buildFastingTimer(context, state)
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 24),

                    // Fasting Types
                    Center(
                      child: Text(
                        'Fast Type',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 200.ms)
                        .slideX(begin: -0.1, end: 0),
                    const SizedBox(height: 12),
                    _buildFastingTypes(state)
                        .animate()
                        .fadeIn(delay: 300.ms)
                        .slideX(begin: 0.1, end: 0),
                    const SizedBox(height: 24),

                    // Daily Progress Logging
                    Center(
                      child: Text(
                        'Daily Success Tracker',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: 12),
                    _buildSacrificeLogging(state)
                        .animate()
                        .fadeIn(delay: 450.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: 32),

                    // Things to Give Up
                    Center(
                      child: Text(
                        'Set Your Lenten Sacrifices',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ).animate().fadeIn(delay: 500.ms),
                    const SizedBox(height: 4),
                    Center(
                      child: Text(
                        'Select the items you are giving up this season.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ).animate().fadeIn(delay: 550.ms),
                    const SizedBox(height: 16),
                    _buildCategorizedSacrifices(state)
                        .animate()
                        .fadeIn(delay: 600.ms)
                        .scale(
                            begin: const Offset(0.95, 0.95),
                            end: const Offset(1, 1)),
                    const SizedBox(height: 32),

                    // Meal Log
                    Center(
                      child: Text(
                        'Meal Log',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ).animate().fadeIn(delay: 600.ms),
                    const SizedBox(height: 12),
                    Center(
                      child: GlowFab(
                        onPressed: () => _logMeal(context, state),
                        icon: Icons.add,
                        label: 'Log Meal',
                        gradientColors: const [
                          Colors.orange,
                          Colors.deepOrange
                        ],
                        glowColor: Colors.orange.withValues(alpha: 0.3),
                      ),
                    ).animate().fadeIn(delay: 700.ms).scale(
                        begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
                    const SizedBox(height: 12),
                    _buildMealList(state)
                        .animate()
                        .fadeIn(delay: 800.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: 24),

                    // Recipes
                    Center(
                      child: Text(
                        'Meatless Recipes',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildRecipes(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFastingTimer(BuildContext context, LentStateProvider state) {
    final duration = state.fastingDuration;
    final hours = duration?.inHours ?? 0;
    final minutes = duration?.inMinutes.remainder(60) ?? 0;
    final seconds = duration?.inSeconds.remainder(60) ?? 0;

    return OrnateHeader(
      title: 'Current Fast: ${state.fastType}',
      // progress: 0, // Removed to hide progress bar
      progressLabel: state.isFasting ? 'FASTING ACTIVE' : 'NOT FASTING',
      subtitle:
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      customContent: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (state.isFasting) {
                state.endFast();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fast ended! Great job! 🎉')),
                );
              } else {
                state.startFast();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fast started!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: state.isFasting
                  ? CatholicTheme.lentenIndigo
                  : CatholicTheme.softWhite,
              foregroundColor:
                  state.isFasting ? Colors.white : CatholicTheme.lentenIndigo,
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: state.isFasting ? 10 : 0,
              side: state.isFasting
                  ? null
                  : const BorderSide(
                      color: CatholicTheme.lentenIndigo, width: 1.5),
            ),
            child: Text(
              state.isFasting ? 'END FAST' : 'START FAST',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFastingTypes(LentStateProvider state) {
    final recommendation = state.getRecommendedFastType();
    return Column(
      children: [
        _buildFastTypeOption(state, 'Full Fast', 'Water only',
            isRecommended: recommendation == 'Full Fast'),
        _buildFastTypeOption(state, 'Partial Fast', 'One meal',
            isRecommended: recommendation == 'Partial Fast'),
        _buildFastTypeOption(state, 'Abstinence', 'No meat',
            isRecommended: recommendation == 'Abstinence'),
      ],
    );
  }

  Widget _buildFastTypeOption(
      LentStateProvider state, String title, String description,
      {bool isRecommended = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: HolyCard(
        isGlass: true,
        backgroundColor: state.fastType == title
            ? CatholicTheme.lentenIndigo.withValues(alpha: 0.05)
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Radio<String>(
              value: title,
              groupValue: state.fastType,
              onChanged: (val) {
                if (val != null) state.setFastType(val);
              },
              activeColor: CatholicTheme.lentenIndigo,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      if (isRecommended) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: CatholicTheme.goldAccent.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'RECOMMENDED',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[700],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSacrificeLogging(LentStateProvider state) {
    final selected = state.selectedSacrifices;
    if (selected.isEmpty) {
      return HolyCard(
        isGlass: true,
        showCross: true,
        backgroundColor: CatholicTheme.incenseWhite.withValues(alpha: 0.5),
        child: const Center(
          child: Text(
            'Select sacrifices below to start tracking your daily journey.',
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      );
    }

    return Column(
      children: selected.map((sacrifice) {
        final isLogged = state.isSacrificeLogged(sacrifice, state.displayDay);
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: HolyCard(
            isGlass: true,
            showCross: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            backgroundColor:
                isLogged ? CatholicTheme.palmGreen.withValues(alpha: 0.1) : null,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    sacrifice,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: isLogged
                          ? CatholicTheme.palmGreen
                          : CatholicTheme.deepSlate,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => state.logSacrificeSuccess(sacrifice),
                  icon: Icon(
                    isLogged
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: isLogged
                        ? CatholicTheme.palmGreen
                        : CatholicTheme.lentenIndigo.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategorizedSacrifices(LentStateProvider state) {
    final categories = {
      'Food & Drink': [
        {'name': 'Sweets & Chocolate', 'icon': '🍫'},
        {'name': 'Alcohol', 'icon': '🍷'},
        {'name': 'Meat', 'icon': '🥩'},
        {'name': 'Caffeine', 'icon': '☕'},
        {'name': 'Fast Food', 'icon': '🍟'},
        {'name': 'Sugary Drinks', 'icon': '🥤'},
        {'name': 'Second Helpings', 'icon': '🍽️'},
        {'name': 'Snacking', 'icon': '🥨'},
        {'name': 'Expensive Coffee', 'icon': '☕'},
        {'name': 'Seasoning/Salt', 'icon': '🧂'},
      ],
      'Digital & Media': [
        {'name': 'Social Media', 'icon': '📱'},
        {'name': 'TV & Streaming', 'icon': '📺'},
        {'name': 'Video Games', 'icon': '🎮'},
        {'name': 'Smartphone Usage', 'icon': '📵'},
        {'name': 'Online Shopping', 'icon': '🛒'},
        {'name': 'Music in Car', 'icon': '📻'},
        {'name': 'News Scrolling', 'icon': '📰'},
        {'name': 'YouTube/TikTok', 'icon': '🎥'},
        {'name': 'Podcasts', 'icon': '🎧'},
      ],
      'Mind & Speech': [
        {'name': 'Complaining', 'icon': '🤐'},
        {'name': 'Sarcasm', 'icon': '😏'},
        {'name': 'Gossip', 'icon': '🙊'},
        {'name': 'Anger', 'icon': '😤'},
        {'name': 'Excessive Talking', 'icon': '🗣️'},
        {'name': 'Being the Center of Attention', 'icon': '👤'},
        {'name': 'Judging Others', 'icon': '⚖️'},
        {'name': 'Impatience', 'icon': '⏳'},
        {'name': 'Internal Chatter', 'icon': '🧠'},
      ],
      'Habits & Discipline': [
        {'name': 'Snoozing Alarm', 'icon': '⏰'},
        {'name': 'Procrastination', 'icon': '⏳'},
        {'name': 'Impulse Buying', 'icon': '🛍️'},
        {'name': 'Warm Showers', 'icon': '🚿'},
        {'name': 'Sleeping In', 'icon': '🛌'},
        {'name': 'Elevators (Take Stairs)', 'icon': '🏃'},
        {'name': 'Luxury Items', 'icon': '💎'},
      ],
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: categories.entries.map((category) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.grain,
                      size: 16, color: CatholicTheme.goldAccent),
                  const SizedBox(width: 8),
                  Text(
                    category.key.toUpperCase(),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: CatholicTheme.goldAccent,
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: category.value.map((s) {
                final name = s['name']!;
                final icon = s['icon']!;
                final isSelected = state.selectedSacrifices.contains(name);

                return InkWell(
                  onTap: () => state.toggleSacrifice(name),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? CatholicTheme.lentenIndigo
                          : CatholicTheme.softWhite,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? CatholicTheme.lentenIndigo
                            : CatholicTheme.lightGrey,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color:
                                    CatholicTheme.lentenIndigo.withValues(alpha: 0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(icon, style: const TextStyle(fontSize: 14)),
                        const SizedBox(width: 6),
                        Text(
                          name,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : CatholicTheme.deepSlate.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildMealList(LentStateProvider state) {
    final meals = state.getMealsForDay(state.displayDay);

    if (meals.isEmpty) {
      return HolyCard(
        backgroundColor: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
        child: Center(
          child: Text(
            'No meals logged yet',
            style: GoogleFonts.inter(
                color: CatholicTheme.subtleGrey, fontStyle: FontStyle.italic),
          ),
        ),
      );
    }

    return Column(
      children: meals.map((meal) {
        final time = DateTime.parse(meal['time']);
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: HolyCard(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: CatholicTheme.lentenIndigo,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (meal['mealType'] != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color:
                                    CatholicTheme.lentenIndigo.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                meal['mealType'].toString().toUpperCase(),
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: CatholicTheme.lentenIndigo,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        meal['description'],
                        style: GoogleFonts.inter(
                            fontSize: 16, color: CatholicTheme.deepSlate),
                      ),
                      if (meal['fastType'] != null)
                        Text(
                          'Recorded during: ${meal['fastType']}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                fontStyle: FontStyle.italic,
                                color:
                                    CatholicTheme.lentenIndigo.withValues(alpha: 0.7),
                              ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecipes() {
    final categories = LentenRecipes.getCategories();
    return Column(
      children: categories.map((category) {
        final categoryRecipes = LentenRecipes.getRecipesByCategory(category);
        if (categoryRecipes.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ExpansionTile(
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: CatholicTheme.lightGrey),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: CatholicTheme.lentenIndigo),
            ),
            backgroundColor: CatholicTheme.pureWhite,
            collapsedBackgroundColor: CatholicTheme.pureWhite,
            title: Text(
              category,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: CatholicTheme.deepSlate,
                  ),
            ),
            leading: Icon(
              _getCategoryIcon(category),
              color: CatholicTheme.lentenIndigo,
            ),
            iconColor: CatholicTheme.lentenIndigo,
            collapsedIconColor: CatholicTheme.lentenIndigo.withValues(alpha: 0.5),
            children: categoryRecipes
                .map((recipe) => _buildRecipeCard(context, recipe))
                .toList(),
          ),
        );
      }).toList(),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Breakfast':
        return Icons.free_breakfast;
      case 'Main':
        return Icons.restaurant;
      case 'Snack':
        return Icons.apple;
      case 'Dessert':
        return Icons.cake;
      case 'Mocktails':
        return Icons.local_bar;
      default:
        return Icons.restaurant_menu;
    }
  }

  Widget _buildRecipeCard(BuildContext context, LentenRecipe recipe) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: HolyCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailScreen(recipe: recipe),
            ),
          );
        },
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text(recipe.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    recipe.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 14, color: CatholicTheme.lentenIndigo),
          ],
        ),
      ),
    );
  }

  void _logMeal(BuildContext context, LentStateProvider state) {
    final controller = TextEditingController();
    String selectedMealType = 'Lunch';
    final mealTypes = ['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Other'];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(
            'Log Your Meal',
            style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                initialValue: selectedMealType,
                decoration: InputDecoration(
                  labelText: 'Meal Type',
                  labelStyle: TextStyle(
                      color: CatholicTheme.lentenIndigo.withValues(alpha: 0.7)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: CatholicTheme.lentenIndigo),
                  ),
                ),
                items: mealTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => selectedMealType = val);
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'What did you eat? Keep it simple and focused.',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      color: CatholicTheme.subtleGrey.withValues(alpha: 0.5)),
                  filled: true,
                  fillColor: CatholicTheme.pureWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL',
                  style: TextStyle(color: CatholicTheme.lentenIndigo)),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  state.logMeal(controller.text, selectedMealType);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CatholicTheme.lentenIndigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('SAVE LOG'),
            ),
          ],
        ),
      ),
    );
  }
}
