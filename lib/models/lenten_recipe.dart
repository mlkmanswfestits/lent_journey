enum FastingType {
  fullFast, // Water only
  partialFast, // One full meal, two smaller snacks (no meat)
  abstinence, // No meat (common on Fridays)
  none // Sundays or special feasts
}

class LentenRecipe {
  final String id;
  final String name;
  final String description;
  final String category; // Breakfast, Main, Snack, Dessert
  final String icon;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String nutritionalInfo;
  final String traditionalNote;

  const LentenRecipe({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.nutritionalInfo,
    required this.traditionalNote,
  });
}
