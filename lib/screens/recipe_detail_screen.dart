import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/lenten_recipe.dart';
import '../providers/lent_state_provider.dart';
import '../utils/theme.dart';
import '../widgets/holy_card.dart';

class RecipeDetailScreen extends StatelessWidget {
  final LentenRecipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name.toUpperCase()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Recipe Hero
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: CatholicTheme.lentenIndigo.withValues(alpha: 0.1)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    recipe.icon,
                    style: const TextStyle(fontSize: 60),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              recipe.description,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: CatholicTheme.deepSlate,
                    fontSize: 18,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Info Card
            HolyCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoRow(context, Icons.timer,
                      '${recipe.prepTimeMinutes + recipe.cookTimeMinutes} mins total'),
                  const Divider(),
                  _buildInfoRow(
                      context, Icons.restaurant, '${recipe.servings} servings'),
                  const Divider(),
                  _buildInfoRow(
                      context, Icons.info_outline, recipe.nutritionalInfo),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Ingredients
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CatholicTheme.lentenIndigo,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            HolyCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: recipe.ingredients
                    .map((ing) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Icon(Icons.circle,
                                    size: 6, color: CatholicTheme.lentenIndigo),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Text(ing,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),

            const SizedBox(height: 32),

            // Preparation
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Preparation',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CatholicTheme.lentenIndigo,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            ...recipe.instructions.asMap().entries.map((entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: HolyCard(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: CatholicTheme.lentenIndigo,
                          child: Text(
                            '${entry.key + 1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text(entry.value,
                                style: Theme.of(context).textTheme.bodyLarge)),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 32),

            // Lenten Note
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CatholicTheme.lentenIndigo.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: CatholicTheme.lentenIndigo.withValues(alpha: 0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.history_edu,
                        color: CatholicTheme.lentenIndigo),
                    const SizedBox(width: 12),
                    Text(
                      'Lenten Note',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: CatholicTheme.lentenIndigo,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ]),
                  const SizedBox(height: 12),
                  Text(
                    recipe.traditionalNote,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Log Meal Button
            Consumer<LentStateProvider>(
              builder: (context, state, child) {
                final isLogged = state.isRecipeLoggedToday(recipe.name);
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: isLogged
                        ? null
                        : () {
                            state.logMeal(recipe.name, recipe.category);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${recipe.name} logged as a meal! 🥗'),
                                backgroundColor: CatholicTheme.lentenIndigo,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                    icon: Icon(isLogged ? Icons.check_circle : Icons.restaurant),
                    label: Text(
                      isLogged ? 'MEAL LOGGED TODAY' : 'LOG THIS MEAL',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLogged ? Colors.grey : CatholicTheme.sacredGold,
                      foregroundColor: isLogged ? Colors.white70 : Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24, color: CatholicTheme.lentenIndigo),
          const SizedBox(width: 16),
          Expanded(
              child: Text(label, style: Theme.of(context).textTheme.bodyLarge)),
        ],
      ),
    );
  }
}
