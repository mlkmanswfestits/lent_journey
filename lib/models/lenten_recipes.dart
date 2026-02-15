import 'lenten_recipe.dart';

class LentenRecipes {
  static const List<LentenRecipe> allRecipes = [
    // --- BREAKFAST ---
    LentenRecipe(
      id: 'catholic_breakfast_1',
      name: 'Honey Cinnamon Oatmeal',
      description: 'A warm, comforting bowl of steel-cut oats.',
      category: 'Breakfast',
      icon: '🥣',
      ingredients: [
        '1 cup steel-cut oats',
        '2 cups water',
        '1/2 cup almond milk',
        '1 tbsp honey',
        '1 tsp cinnamon',
        'Pinch of salt'
      ],
      instructions: [
        'Bring water and salt to a boil.',
        'Stir in oats and reduce heat to low.',
        'Simmer for 20-30 minutes, stirring occasionally.',
        'Stir in almond milk, honey, and cinnamon before serving.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 25,
      servings: 2,
      nutritionalInfo: 'High fiber, low fat, sustained energy.',
      traditionalNote:
          'Oatmeal is a traditional simple breakfast for days of partial fasting.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_2',
      name: 'Frittata-less Vegetable Scramble',
      description: 'A protein-packed tofu scramble with seasonal vegetables.',
      category: 'Breakfast',
      icon: '🍳',
      ingredients: [
        '1 block firm tofu',
        '1/2 tsp turmeric',
        '1/4 cup nutritional yeast',
        '1 cup spinach',
        '1/2 cup bell peppers',
        'Salt and pepper'
      ],
      instructions: [
        'Crumble tofu into a bowl.',
        'Sauté vegetables until tender.',
        'Add tofu, turmeric, and nutritional yeast.',
        'Cook for 5-7 minutes until heated through.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 10,
      servings: 2,
      nutritionalInfo: 'High protein, iron, and B-vitamins.',
      traditionalNote:
          'Excellent meat-free alternative for energetic mornings.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_3',
      name: 'Peanut Butter & Banana Toast',
      description: 'Simple and satisfying start to the day.',
      category: 'Breakfast',
      icon: '🍞',
      ingredients: [
        '2 slices whole grain bread',
        '2 tbsp natural peanut butter',
        '1 banana, sliced',
        'Drizzle of honey'
      ],
      instructions: [
        'Toast the bread until golden.',
        'Spread peanut butter evenly.',
        'Top with banana slices and honey.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Healthy fats, potassium, and complex carbs.',
      traditionalNote: 'A quick option for busy Lenten mornings.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_4',
      name: 'Greek Yogurt with Walnuts',
      description: 'Protein-rich breakfast (suitable for non-abstinence days).',
      category: 'Breakfast',
      icon: '🍦',
      ingredients: [
        '1 cup Greek yogurt',
        '1/4 cup walnuts',
        '1/4 cup blueberries',
        '1 tsp honey'
      ],
      instructions: [
        'Place yogurt in a bowl.',
        'Top with walnuts and blueberries.',
        'Drizzle with honey.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Calcium, protein, and antioxidants.',
      traditionalNote:
          'Dairy is permitted in the Catholic Lenten tradition except on specific fast days.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_5',
      name: 'Apple Cinnamon Chia Pudding',
      description: 'A make-ahead breakfast perfect for reflection time.',
      category: 'Breakfast',
      icon: '🍮',
      ingredients: [
        '1/4 cup chia seeds',
        '1 cup almond milk',
        '1/2 apple, grated',
        '1/2 tsp cinnamon',
        '1 tsp maple syrup'
      ],
      instructions: [
        'Mix seeds, milk, and syrup in a jar.',
        'Shake well and refrigerate overnight.',
        'Stir in grated apple and cinnamon before eating.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Omega-3 fatty acids and fiber.',
      traditionalNote:
          'Healthy and simple, allowing more time for morning prayer.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_6',
      name: 'Simple Savory Quinoa',
      description: 'A warm whole grain bowl with a savory twist.',
      category: 'Breakfast',
      icon: '🍚',
      ingredients: [
        '1/2 cup quinoa',
        '1 cup vegetable broth',
        '1/4 cup cherry tomatoes',
        '1 tbsp sliced olives'
      ],
      instructions: [
        'Rinse quinoa.',
        'Bring broth to a boil, add quinoa, and simmer for 15 minutes.',
        'Stir in tomatoes and olives.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 15,
      servings: 1,
      nutritionalInfo: 'Complete protein and minerals.',
      traditionalNote:
          'Quinoa is an ancient grain that fits well with a simpler diet.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_7',
      name: 'Pear & Almond Smoothie',
      description: 'Refreshing and filling liquid breakfast.',
      category: 'Breakfast',
      icon: '🥤',
      ingredients: [
        '1 ripe pear',
        '1 cup almond milk',
        '1/2 cup spinach',
        '1 tbsp almond butter'
      ],
      instructions: [
        'Combine all ingredients in a blender.',
        'Process until smooth.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Vitamins A, C, and healthy fats.',
      traditionalNote:
          'Smoothies are an efficient way to get nutrients during busy days.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_8',
      name: 'Toasted Bagel with Avocado',
      description: 'Simple plant-based fats on a hearty bagel.',
      category: 'Breakfast',
      icon: '🥯',
      ingredients: [
        '1 whole wheat bagel',
        '1/2 avocado',
        'Lemon juice',
        'Red pepper flakes'
      ],
      instructions: [
        'Toast bagel halves.',
        'Mash avocado with lemon juice.',
        'Spread on bagel and sprinkle with red pepper flakes.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Healthy monounsaturated fats.',
      traditionalNote: 'A modern Lenten staple that is purely plant-based.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_9',
      name: 'Cottage Cheese & Pineapple',
      description: 'Low-fat protein breakfast.',
      category: 'Breakfast',
      icon: '🧀',
      ingredients: [
        '1 cup low-fat cottage cheese',
        '1/2 cup pineapple chunks',
        '1 tbsp flax seeds'
      ],
      instructions: ['Top cottage cheese with pineapple and seeds.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'High protein and calcium.',
      traditionalNote: 'Light and refreshing for a Friday breakfast.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_10',
      name: 'Baked Sweet Potato with Honey',
      description: 'A warm, naturally sweet start.',
      category: 'Breakfast',
      icon: '🍠',
      ingredients: ['1 medium sweet potato', '1 tsp honey', '1/4 tsp cinnamon'],
      instructions: [
        'Bake sweet potato at 400°F for 45 minutes.',
        'Slice open and drizzle with honey and cinnamon.'
      ],
      prepTimeMinutes: 2,
      cookTimeMinutes: 45,
      servings: 1,
      nutritionalInfo: 'Beta-carotene and complex carbohydrates.',
      traditionalNote: 'Sweet potatoes are sustaining and grounding.',
    ),

    // --- MAIN DISHES (LUNCH/DINNER) ---
    LentenRecipe(
      id: 'catholic_main_1',
      name: 'Three-Bean Chili',
      description: 'A hearty meatless chili full of flavor.',
      category: 'Main',
      icon: '🥘',
      ingredients: [
        '1 can black beans',
        '1 can kidney beans',
        '1 can pinto beans',
        '1 can diced tomatoes',
        '1 onion',
        '2 tbsp chili powder'
      ],
      instructions: [
        'Sauté onion until translucent.',
        'Add beans, tomatoes, and spices.',
        'Simmer for 30 minutes to let flavors meld.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 30,
      servings: 4,
      nutritionalInfo: 'Protein-rich and high in fiber.',
      traditionalNote: 'Classic meatless Friday dinner.',
    ),
    LentenRecipe(
      id: 'catholic_main_2',
      name: 'Baked Cod with Lemon & Herbs',
      description: 'Simple and elegant fish dish for Friday abstinence.',
      category: 'Main',
      icon: '🐟',
      ingredients: [
        '4 cod fillets',
        '2 lemons',
        '2 tbsp olive oil',
        'Fresh parsley',
        'Dried oregano',
        'Salt and pepper'
      ],
      instructions: [
        'Place cod in a baking dish.',
        'Drizzle with oil and lemon juice.',
        'Top with herbs and bake at 375°F for 15-20 minutes.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 20,
      servings: 4,
      nutritionalInfo: 'Lean protein and healthy fats.',
      traditionalNote:
          'Fish is the traditional Friday centerpiece in the Roman Catholic tradition.',
    ),
    LentenRecipe(
      id: 'catholic_main_3',
      name: 'Vegetable Lasagna',
      description: 'Creamy and filling meatless comfort food.',
      category: 'Main',
      icon: '🍝',
      ingredients: [
        'Lasagna noodles',
        '2 cups ricotta cheese',
        '2 cups marinara sauce',
        '1 cup spinach',
        '1 zucchini',
        '2 cups mozzarella'
      ],
      instructions: [
        'Layer sauce, noodles, ricotta, spinach, zucchini slices, and mozzarella.',
        'Repeat layers.',
        'Bake at 375°F for 45 minutes covered.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 45,
      servings: 6,
      nutritionalInfo: 'Calcium and vitamin-rich vegetables.',
      traditionalNote: 'A family favorite for meat-free evenings.',
    ),
    LentenRecipe(
      id: 'catholic_main_4',
      name: 'Lentil Shepard\'s Pie',
      description: 'A plant-based take on a classic tavern dish.',
      category: 'Main',
      icon: '🥧',
      ingredients: [
        '2 cups cooked lentils',
        '4 large potatoes',
        '1 cup peas and carrots',
        '1/2 onion',
        '1/4 cup almond milk'
      ],
      instructions: [
        'Mash cooked potatoes with almond milk.',
        'Sauté onions, add lentils and veg.',
        'Place lentil mix in baking dish, top with mash.',
        'Bake at 400°F for 20 minutes until peaks are golden.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 20,
      servings: 4,
      nutritionalInfo: 'High iron and satiety.',
      traditionalNote: 'Modern vegetarian comfort food.',
    ),
    LentenRecipe(
      id: 'catholic_main_5',
      name: 'Shrimp Scampi with Linguine',
      description: 'Garlicky seafood pasta for festive Lenten days.',
      category: 'Main',
      icon: '🍤',
      ingredients: [
        '1 lb shrimp',
        '1/2 lb linguine',
        '4 cloves garlic',
        '1/4 cup white wine',
        'Parsley',
        'Lemon'
      ],
      instructions: [
        'Cook pasta according to package.',
        'Sauté garlic and shrimp in oil.',
        'Add wine and lemon, toss with pasta and parsley.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 10,
      servings: 4,
      nutritionalInfo: 'Excellent seafood protein.',
      traditionalNote:
          'Seafood is always appropriate for Catholic fasting days.',
    ),
    LentenRecipe(
      id: 'catholic_main_6',
      name: 'Mushroom Risotto',
      description: 'Creamy Italian rice with earthy mushrooms.',
      category: 'Main',
      icon: '🍲',
      ingredients: [
        '2 cups Arborio rice',
        '1 lb mushrooms',
        '4 cups veg broth',
        '1/2 cup Parmesan',
        '1 onion'
      ],
      instructions: [
        'Sauté onions and mushrooms.',
        'Add rice and stir. Add broth one ladle at a time.',
        'Stir constantly until creamy. Finish with Parmesan.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      servings: 4,
      nutritionalInfo: 'Complex carbs and minerals.',
      traditionalNote: 'Elegant and satisfying meatless meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_7',
      name: 'Ratatouille',
      description: 'Traditional French stew of summer vegetables.',
      category: 'Main',
      icon: '🍆',
      ingredients: [
        '1 eggplant',
        '1 zucchini',
        '2 bell peppers',
        '3 tomatoes',
        'Herbes de Provence'
      ],
      instructions: [
        'Chop all vegetables.',
        'Sauté separately/together and simmer with herbs.',
        'Cook until vegetables are tender yet hold their shape.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 40,
      servings: 4,
      nutritionalInfo: 'Vitamin rich and low calorie.',
      traditionalNote: 'A humble monastery-inspired dish.',
    ),
    LentenRecipe(
      id: 'catholic_main_8',
      name: 'Tuna Salad Wraps',
      description: 'Quick and easy lunch for abstinence days.',
      category: 'Main',
      icon: '🌯',
      ingredients: [
        '2 cans tuna',
        '1/4 cup mayo',
        'Celery',
        'Large tortillas',
        'Lettuce'
      ],
      instructions: [
        'Mix tuna, mayo, and celery.',
        'Place mix and lettuce on tortilla.',
        'Roll and serve.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 0,
      servings: 4,
      nutritionalInfo: 'High protein and Omega-3s.',
      traditionalNote: 'A standard Lenten lunch staple.',
    ),
    LentenRecipe(
      id: 'catholic_main_9',
      name: 'Eggplant Parmesan',
      description: 'Breaded eggplant layers with rich cheese.',
      category: 'Main',
      icon: '🧀',
      ingredients: [
        '2 large eggplants',
        'Breadcrumbs',
        '2 cups marinara',
        '2 cups mozzarella'
      ],
      instructions: [
        'Slice, bread, and bake/fry eggplant.',
        'Layer eggplant, sauce, and cheese.',
        'Bake at 375°F for 25 minutes.'
      ],
      prepTimeMinutes: 30,
      cookTimeMinutes: 25,
      servings: 6,
      nutritionalInfo: 'Satisfying vegetarian classic.',
      traditionalNote: 'Hearty and popular for parish dinners.',
    ),
    LentenRecipe(
      id: 'catholic_main_10',
      name: 'Spinach & Feta Stuffed Shells',
      description: 'Baked pasta shells with Mediterranean filling.',
      category: 'Main',
      icon: '🐚',
      ingredients: [
        'Jumbo shells',
        '2 cups spinach',
        '1 cup feta',
        '1 cup ricotta',
        'Marinara sauce'
      ],
      instructions: [
        'Cook shells partially.',
        'Stuff with cheese and spinach mix.',
        'Cover with sauce and bake at 350°F for 30 minutes.'
      ],
      prepTimeMinutes: 25,
      cookTimeMinutes: 30,
      servings: 4,
      nutritionalInfo: 'High calcium and protein.',
      traditionalNote: 'Comforting and shareable meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_11',
      name: 'Cauliflower Steaks with Tahini',
      description: 'Roasted cauliflower with nutty sesame sauce.',
      category: 'Main',
      icon: '🥦',
      ingredients: [
        '1 head cauliflower',
        '1/4 cup tahini',
        'Lemon juice',
        'Garlic',
        'Smoked paprika'
      ],
      instructions: [
        'Slice cauliflower into 1-inch "steaks".',
        'Roast at 400°F for 25 minutes.',
        'Drizzle with tahini/lemon/garlic sauce.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 25,
      servings: 2,
      nutritionalInfo: 'Plant-based and mineral-dense.',
      traditionalNote: 'A modern, sophisticated meatless dish.',
    ),
    LentenRecipe(
      id: 'catholic_main_12',
      name: 'Classic Margherita Pizza',
      description: 'Simple dough with tomatoes and fresh basil.',
      category: 'Main',
      icon: '🍕',
      ingredients: [
        'Pizza dough',
        'San Marzano tomatoes',
        'Fresh mozzarella',
        'Basil leaves',
        'Olive oil'
      ],
      instructions: [
        'Stretch dough.',
        'Spread tomatoes, add cheese slices.',
        'Bake at highest temp. Garnish with basil and oil.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 10,
      servings: 2,
      nutritionalInfo: 'Balanced carbs and protein.',
      traditionalNote: 'Classic Italian meatless Friday meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_13',
      name: 'Butternut Squash Soup',
      description: 'Smooth and velvet-like autumn soup.',
      category: 'Main',
      icon: '🥣',
      ingredients: [
        '1 butternut squash',
        '1 onion',
        '2 cups veg broth',
        'Sage',
        'Nutmeg'
      ],
      instructions: [
        'Roast squash chunks.',
        'Sauté onion, add squash and broth.',
        'Blend until creamy. Add spices.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      servings: 4,
      nutritionalInfo: 'Vitamin A and fiber.',
      traditionalNote: 'Warming and simple for early Lent.',
    ),
    LentenRecipe(
      id: 'catholic_main_14',
      name: 'Tofu stir-fry with Broccoli',
      description: 'Quick Asian-inspired meatless dish.',
      category: 'Main',
      icon: '🥢',
      ingredients: [
        '1 block tofu',
        '2 cups broccoli',
        'Soy sauce',
        'Ginger',
        'Sesame oil'
      ],
      instructions: [
        'Press and cube tofu.',
        'Sauté tofu until crisp.',
        'Add broccoli and sauce. Stir-fry for 5 minutes.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 10,
      servings: 2,
      nutritionalInfo: 'High protein and phytonutrients.',
      traditionalNote: 'Light and nutritious option.',
    ),
    LentenRecipe(
      id: 'catholic_main_15',
      name: 'Potato and Leek Soup',
      description: 'Rustic and creamy traditional soup.',
      category: 'Main',
      icon: '🥔',
      ingredients: [
        '3 potatoes',
        '2 leeks',
        '4 cups veg broth',
        'Pinch of thyme'
      ],
      instructions: [
        'Clean and slice leeks.',
        'Sauté leeks, add potatoes and broth.',
        'Simmer 20 minutes and blend.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 20,
      servings: 4,
      nutritionalInfo: 'Potassium and fiber.',
      traditionalNote: 'A classic European Lenten soup.',
    ),

    // --- SNACKS & SIDES ---
    LentenRecipe(
      id: 'catholic_snack_1',
      name: 'Hummus & Carrots',
      description: 'Protein-packed dip for small Lenten snacks.',
      category: 'Snack',
      icon: '🥕',
      ingredients: ['1 cup hummus', '2 cups baby carrots'],
      instructions: ['Serve together.'],
      prepTimeMinutes: 2,
      cookTimeMinutes: 0,
      servings: 2,
      nutritionalInfo: 'Fiber and healthy protein.',
      traditionalNote: 'Simple, uncooked food for fast days.',
    ),
    LentenRecipe(
      id: 'catholic_snack_2',
      name: 'Handful of Almonds',
      description: 'Quick energy for reflection.',
      category: 'Snack',
      icon: '🥜',
      ingredients: ['1/4 cup raw almonds'],
      instructions: ['Enjoy raw.'],
      prepTimeMinutes: 0,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Vitamin E and magnesium.',
      traditionalNote:
          'Nuts are a traditional source of strength during fasts.',
    ),
    LentenRecipe(
      id: 'catholic_snack_3',
      name: 'Garlic Roasted Chickpeas',
      description: 'Crunchy and savory alternative to chips.',
      category: 'Snack',
      icon: '🧄',
      ingredients: [
        '1 can chickpeas',
        'Olive oil',
        'Garlic powder',
        'Sea salt'
      ],
      instructions: [
        'Rinse and dry chickpeas.',
        'Toss with oil and garlic.',
        'Roast at 400°F for 25 minutes until crunchy.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 25,
      servings: 3,
      nutritionalInfo: 'Plant-based protein.',
      traditionalNote: 'A sustaining snack for long prayer vigils.',
    ),
    LentenRecipe(
      id: 'catholic_snack_4',
      name: 'Apple Slices with Peanut Butter',
      description: 'Balanced sweet and savory snack.',
      category: 'Snack',
      icon: '🍏',
      ingredients: ['1 apple', '2 tbsp peanut butter'],
      instructions: ['Slice apple and dip.'],
      prepTimeMinutes: 3,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Fiber and protein.',
      traditionalNote: 'Simple and wholesome.',
    ),
    LentenRecipe(
      id: 'catholic_snack_5',
      name: 'Bruschetta with Tomato',
      description: 'Traditional Italian bread snack.',
      category: 'Snack',
      icon: '🥖',
      ingredients: ['4 baguette slices', '1 tomato', 'Basil', 'Garlic'],
      instructions: [
        'Toast bread.',
        'Top with chopped tomatoes, garlic, and basil.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 5,
      servings: 2,
      nutritionalInfo: 'Lycopene and healthy carbs.',
      traditionalNote: 'Traditional Mediterranean starter.',
    ),
    LentenRecipe(
      id: 'catholic_snack_6',
      name: 'Kale Chips',
      description: 'Light and crispy vegetable snack.',
      category: 'Snack',
      icon: '🥬',
      ingredients: ['1 bunch kale', 'Olive oil', 'Salt'],
      instructions: [
        'Remove stems, tear leaves.',
        'Toss with oil/salt. Bake at 300°F for 15 minutes.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 2,
      nutritionalInfo: 'Weight-conscious vitamin powerhouse.',
      traditionalNote: 'Modern clean-eating Lenten snack.',
    ),
    LentenRecipe(
      id: 'catholic_snack_7',
      name: 'Edamame with Sea Salt',
      description: 'Quick protein-rich soybeans.',
      category: 'Snack',
      icon: '🫘',
      ingredients: ['1 cup frozen edamame', 'Sea salt'],
      instructions: ['Steam for 5 minutes. Sprinkle with salt.'],
      prepTimeMinutes: 2,
      cookTimeMinutes: 5,
      servings: 1,
      nutritionalInfo: 'High soy protein.',
      traditionalNote: 'Effortless and nourishing.',
    ),
    LentenRecipe(
      id: 'catholic_snack_8',
      name: 'Trail Mix (Seeds & Fruit)',
      description: 'Sustaining energy for the journey.',
      category: 'Snack',
      icon: '🥨',
      ingredients: [
        'Pumpkin seeds',
        'Sunflower seeds',
        'Dried cranberries',
        'Raisins'
      ],
      instructions: ['Mix in a bag.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 4,
      nutritionalInfo: 'Energy dense and portable.',
      traditionalNote: 'Good for Lenten hikes or retreats.',
    ),
    LentenRecipe(
      id: 'catholic_snack_9',
      name: 'Hard-Boiled Eggs',
      description: 'A simple protein snack (non-abstinence days).',
      category: 'Snack',
      icon: '🥚',
      ingredients: ['2 large eggs'],
      instructions: ['Boil for 9 minutes. Cool and peel.'],
      prepTimeMinutes: 2,
      cookTimeMinutes: 9,
      servings: 1,
      nutritionalInfo: 'Essential protein and fats.',
      traditionalNote:
          'Simple food for days where meat and dairy are avoided but eggs are permitted.',
    ),
    LentenRecipe(
      id: 'catholic_snack_10',
      name: 'Cucumber Slices with Vinegar',
      description: 'Refreshing and zero-fat snack.',
      category: 'Snack',
      icon: '🥒',
      ingredients: ['1 cucumber', 'Apple cider vinegar', 'Dried dill'],
      instructions: ['Slice cucumber. Toss with vinegar and dill.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Hydrating and digestive aid.',
      traditionalNote: 'Humble and refreshing.',
    ),

    // --- DESSERTS ---
    LentenRecipe(
      id: 'catholic_dessert_1',
      name: 'Dark Chocolate Bark with Sea Salt',
      description: 'Simple and refined sweet treat.',
      category: 'Dessert',
      icon: '🍫',
      ingredients: ['70% dark chocolate', 'Sea salt flakes', 'Dried cherries'],
      instructions: [
        'Melt chocolate.',
        'Spread on parchment, top with salt and cherries.',
        'Let set in fridge.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 0,
      servings: 6,
      nutritionalInfo: 'Antioxidants and mindful indulgence.',
      traditionalNote:
          'Dark chocolate is often considered suitable in moderation during Lent.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_2',
      name: 'Fruit Salad with Honey Lime',
      description: 'Natural sweetness from the earth.',
      category: 'Dessert',
      icon: '🍓',
      ingredients: ['Melon', 'Grapes', 'Berries', 'Lime juice', 'Honey'],
      instructions: ['Chop fruit and toss with dressing.'],
      prepTimeMinutes: 15,
      cookTimeMinutes: 0,
      servings: 4,
      nutritionalInfo: 'Vitamin C and hydration.',
      traditionalNote: 'Fruit is always the first choice for Lenten sweets.',
    ),

    // --- NEW ADDITIONS (20 MORE) ---
    LentenRecipe(
      id: 'catholic_main_21',
      name: 'Red Lentil Dal (Indian Style)',
      description: 'A comforting and spice-rich lentil stew.',
      category: 'Main',
      icon: '🍛',
      ingredients: [
        '1 cup red lentils',
        '3 cups water',
        '1 tsp turmeric',
        '1 tbsp cumin seeds',
        '1 onion, diced',
        '2 cloves garlic, minced',
        '1 tbsp ginger, grated',
        'Fresh cilantro'
      ],
      instructions: [
        'Boil lentils with water and turmeric until soft.',
        'In a separate pan, sauté cumin, onion, garlic, and ginger.',
        'Stir the sautéed mix into the lentils.',
        'Simmer for 10 minutes and garnish with cilantro.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 25,
      servings: 4,
      nutritionalInfo: 'High protein and anti-inflammatory turmeric.',
      traditionalNote: 'Lentils are a humble Lenten staple across the world.',
    ),
    LentenRecipe(
      id: 'catholic_main_22',
      name: 'Vegetable Paella',
      description: 'Spanish saffron rice with vibrant vegetables.',
      category: 'Main',
      icon: '🥘',
      ingredients: [
        '2 cups Bomba rice',
        '4 cups vegetable broth',
        'Pinch of saffron threads',
        '1 red bell pepper',
        '1 cup green beans',
        '1 cup artichoke hearts',
        '1 tsp smoked paprika'
      ],
      instructions: [
        'Sauté vegetables in a paella pan.',
        'Add rice and coat with oil.',
        'Add broth, saffron, and paprika.',
        'Simmer without stirring until liquid is absorbed and a crust forms.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 35,
      servings: 4,
      nutritionalInfo: 'Vitamins from colorful vegetables and healthy rice.',
      traditionalNote: 'A festive yet meatless Sunday dinner option.',
    ),
    LentenRecipe(
      id: 'catholic_main_23',
      name: 'Greek Spanakopita (Spinach Pie)',
      description: 'Flaky phyllo pastry stuffed with spinach and feta.',
      category: 'Main',
      icon: '🥟',
      ingredients: [
        '1 pack phyllo dough',
        '1 lb fresh spinach',
        '2 cups feta cheese',
        '1/2 cup fresh dill',
        '3 eggs',
        'Olive oil'
      ],
      instructions: [
        'Sauté spinach and dill, then cool and mix with feta and eggs.',
        'Layout phyllo sheets, brushing each with oil.',
        'Spread filling and top with more phyllo.',
        'Bake at 375°F for 35-40 minutes until golden.'
      ],
      prepTimeMinutes: 30,
      cookTimeMinutes: 40,
      servings: 6,
      nutritionalInfo: 'Iron-rich spinach and protein-dense feta.',
      traditionalNote: 'Classic meat-free Mediterranean dish for Orthodox and Catholic fasts.',
    ),
    LentenRecipe(
      id: 'catholic_main_24',
      name: 'Ethiopian Misir Wot',
      description: 'Spicy and hearty red lentil stew with Berbere.',
      category: 'Main',
      icon: '🍲',
      ingredients: [
        '2 cups red lentils',
        '2 tbsp Berbere spice blend',
        '2 onions, pureed',
        '3 tbsp olive oil',
        '2 tbsp tomato paste'
      ],
      instructions: [
        'Cook onions in a dry pan until reduced.',
        'Add oil and Berbere, cook for 5 minutes.',
        'Add tomato paste and lentils with 4 cups water.',
        'Simmer until lentils are creamy and thick.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 45,
      servings: 4,
      nutritionalInfo: 'High fiber and protein.',
      traditionalNote: 'A centerpiece of Tewahedo Orthodox Lenten traditions.',
    ),
    LentenRecipe(
      id: 'catholic_main_25',
      name: 'Mexican Chilaquiles (Cheese/Egg)',
      description: 'Tortilla chips simmered in red or green salsa.',
      category: 'Main',
      icon: '🇲🇽',
      ingredients: [
        'Corn tortillas, cut into triangles',
        '2 cups salsa roja',
        '1 cup Queso Fresco',
        '2 eggs, fried or scrambled',
        'Radish slices for garnish'
      ],
      instructions: [
        'Lightly fry tortilla triangles until crisp.',
        'Simmer salsa and toss with chips until coated.',
        'Top with cheese and eggs.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 2,
      nutritionalInfo: 'Sustaining corn and protein.',
      traditionalNote: 'Hearty and family-friendly meatless meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_26',
      name: 'Thai Green Vegetable Curry',
      description: 'Aromatic curry with coconut milk and veggies.',
      category: 'Main',
      icon: '🍛',
      ingredients: [
        '1 can coconut milk',
        '2 tbsp green curry paste',
        '1 block firm tofu',
        '1 cup snap peas',
        '1 cup bamboo shoots',
        'Fresh basil'
      ],
      instructions: [
        'Simmer curry paste in a bit of coconut milk.',
        'Add remaining milk and tofu.',
        'Add vegetables and simmer for 10 minutes.',
        'Garnish with basil and serve over rice.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 3,
      nutritionalInfo: 'Healthy fats and phytonutrients.',
      traditionalNote: 'A light, plant-based way to nourish during Lent.',
    ),
    LentenRecipe(
      id: 'catholic_main_27',
      name: 'Italian Minestrone',
      description: 'Classic vegetable and bean soup.',
      category: 'Main',
      icon: '🍜',
      ingredients: [
        '1 onion, 2 carrots, 2 celery stalks',
        '1 can cannellini beans',
        '1 can diced tomatoes',
        '2 cups zucchini',
        '1/2 cup small pasta shells',
        '6 cups vegetable broth'
      ],
      instructions: [
        'Sauté onion, carrots, and celery.',
        'Add tomatoes, broth, and beans. Simmer for 20 minutes.',
        'Add zucchini and pasta. Cook until pasta is tender.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      servings: 6,
      nutritionalInfo: 'Full spectrum of vitamins and fiber.',
      traditionalNote: 'The "poor man\'s soup," perfect for Lenten simplicity.',
    ),
    LentenRecipe(
      id: 'catholic_main_28',
      name: 'Polenta with Sautéed Mushrooms',
      description: 'Creamy cornmeal topped with garlicky mushrooms.',
      category: 'Main',
      icon: '🌽',
      ingredients: [
        '1 cup cornmeal',
        '4 cups water/broth',
        '1 lb mixed mushrooms',
        '3 cloves garlic',
        'Fresh thyme'
      ],
      instructions: [
        'Cook polenta in simmering broth, stirring until thick.',
        'Sauté mushrooms with garlic and thyme until browned.',
        'Serve mushrooms over a bed of warm polenta.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 30,
      servings: 4,
      nutritionalInfo: 'Satisfying whole grain and minerals.',
      traditionalNote: 'Rustic and comforting monastic-style meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_29',
      name: 'Quinoa & Black Bean Buddha Bowl',
      description: 'Nutrient-dense bowl with avocado and tahini.',
      category: 'Main',
      icon: '🥗',
      ingredients: [
        '2 cups cooked quinoa',
        '1 can black beans',
        '1 avocado',
        '1 cup roasted sweet potato',
        '2 tbsp tahini dressing'
      ],
      instructions: [
        'Assemble portions of quinoa, beans, and potato in a bowl.',
        'Top with avocado slices.',
        'Drizzle with tahini dressing.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 0,
      servings: 2,
      nutritionalInfo: 'Complete protein and healthy fats.',
      traditionalNote: 'Clean and modern fasting nutrition.',
    ),
    LentenRecipe(
      id: 'catholic_main_30',
      name: 'Vietnamese Mushroom Pho',
      description: 'Fragrant noodle soup with mushroom broth.',
      category: 'Main',
      icon: '🍜',
      ingredients: [
        'Rice noodles',
        '8 cups mushroom broth',
        'Star anise, cinnamon, ginger',
        'Assorted mushrooms',
        'Bean sprouts, basil, lime'
      ],
      instructions: [
        'Simmer broth with spices and ginger for 30 minutes.',
        'Cook noodles separately.',
        'Place noodles in bowls, top with mushrooms and hot broth.',
        'Garnish with sprouts and herbs.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 40,
      servings: 4,
      nutritionalInfo: 'Hydrating and light on the stomach.',
      traditionalNote: 'Soul-warming and ascetic.',
    ),
    LentenRecipe(
      id: 'catholic_main_31',
      name: 'French Onion Soup (Vegetarian)',
      description: 'Caramelized onion soup with cheese crouton.',
      category: 'Main',
      icon: '🧅',
      ingredients: [
        '4 lbs yellow onions',
        '2 tbsp olive oil',
        '6 cups vegetable broth',
        'French bread slices',
        'Gruyère cheese'
      ],
      instructions: [
        'Caramelize onions slowly for 45 minutes.',
        'Add broth and simmer for 15 minutes.',
        'Top bowls with toasted bread and cheese, broil until bubbly.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 60,
      servings: 4,
      nutritionalInfo: 'High in antioxidants from onions.',
      traditionalNote: 'Rich flavor from simple ingredients.',
    ),
    LentenRecipe(
      id: 'catholic_main_32',
      name: 'Roasted Root Vegetables over Farro',
      description: 'Hearty ancient grain bowl with earthy roots.',
      category: 'Main',
      icon: '🥕',
      ingredients: [
        '2 carrots, 2 parsnips, 1 beet',
        '1 cup farro',
        '3 cups vegetable broth',
        'Walnuts'
      ],
      instructions: [
        'Roast root vegetables with oil and salt.',
        'Cook farro in broth until tender.',
        'Toss together and top with toasted walnuts.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 40,
      servings: 2,
      nutritionalInfo: 'Complex carbs and fiber.',
      traditionalNote: 'Farro is an ancient biblical grain.',
    ),
    LentenRecipe(
      id: 'catholic_main_33',
      name: 'Chickpea & Spinach Curry',
      description: 'Flavorful 15-minute curry for busy days.',
      category: 'Main',
      icon: '🍛',
      ingredients: [
        '2 cans chickpeas',
        '1 lb fresh spinach',
        '1 can coconut milk',
        '2 tbsp curry powder',
        '1 onion'
      ],
      instructions: [
        'Sauté onion and curry powder.',
        'Add chickpeas and coconut milk. Simmer for 10 minutes.',
        'Stir in spinach until wilted.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 15,
      servings: 4,
      nutritionalInfo: 'High protein and iron.',
      traditionalNote: 'Simple living through quick, healthy meals.',
    ),
    LentenRecipe(
      id: 'catholic_main_34',
      name: 'Gnocchi with Sage and Butter',
      description: 'Soft potato pillows with aromatic brown butter.',
      category: 'Main',
      icon: '🥟',
      ingredients: [
        '1 lb potato gnocchi',
        '4 tbsp butter (or plant-based alternative)',
        'Handful of fresh sage leaves',
        'Parmesan cheese'
      ],
      instructions: [
        'Boil gnocchi until they float.',
        'In a pan, brown the butter with sage leaves until crispy.',
        'Toss gnocchi in the sage butter and top with cheese.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 10,
      servings: 2,
      nutritionalInfo: 'Comforting and calorie-rich.',
      traditionalNote: 'Typical Italian meatless Friday dinner.',
    ),
    LentenRecipe(
      id: 'catholic_main_35',
      name: 'Vegetable Tempura',
      description: 'Lightly battered and fried Japanese-style veggies.',
      category: 'Main',
      icon: '🍤',
      ingredients: [
        'Assorted veggies (sweet potato, broccoli, onion)',
        'Tempura batter mix (or flour/cornstarch)',
        'Ice cold sparkling water',
        'Dipping sauce (soy/ginger)'
      ],
      instructions: [
        'Mix batter with ice-cold water.',
        'Coat veggies and fry quickly in hot oil.',
        'Drain on paper towels and serve immediately.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 15,
      servings: 4,
      nutritionalInfo: 'Vitamins from veggies in a light crust.',
      traditionalNote: 'A special treat for Lenten Sundays.',
    ),
    LentenRecipe(
      id: 'catholic_main_36',
      name: 'Middle Eastern Falafel Platter',
      description: 'Crispy chickpea balls with hummus and pita.',
      category: 'Main',
      icon: '🥙',
      ingredients: [
        'Falafel (frozen or homemade)',
        'Pita bread',
        'Hummus and Tzatziki',
        'Cucumber and tomato salad'
      ],
      instructions: [
        'Bake or fry falafel until crispy.',
        'Warm the pita bread.',
        'Assemble platter with all components.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 2,
      nutritionalInfo: 'High protein and very filling.',
      traditionalNote: 'Classic Levantine plant-based soul food.',
    ),
    LentenRecipe(
      id: 'catholic_main_37',
      name: 'Baked Ziti (No Meat)',
      description: 'Pasta baked with three cheeses and marinara.',
      category: 'Main',
      icon: '🍝',
      ingredients: [
        '1 lb ziti pasta',
        '1 jar marinara sauce',
        '2 cups ricotta, 2 cups mozzarella',
        '1/2 cup Parmesan'
      ],
      instructions: [
        'Mix cooked pasta with sauce and ricotta.',
        'Top with mozzarella and Parmesan.',
        'Bake at 375°F for 30 minutes.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 30,
      servings: 6,
      nutritionalInfo: 'Calcium and carbohydrates.',
      traditionalNote: 'A staple of parish Lenten potlucks.',
    ),
    LentenRecipe(
      id: 'catholic_main_38',
      name: 'Lentil & Walnut Stuffed Peppers',
      description: 'Bell peppers filled with earthy protein.',
      category: 'Main',
      icon: '🫑',
      ingredients: [
        '4 bell peppers',
        '2 cups cooked lentils',
        '1/2 cup chopped walnuts',
        '1 can tomato sauce',
        'Rice (optional filler)'
      ],
      instructions: [
        'Mix lentils, walnuts, and some sauce.',
        'Stuff into hollowed peppers.',
        'Top with remaining sauce and bake at 350°F for 40 minutes.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 40,
      servings: 4,
      nutritionalInfo: 'Protein and heart-healthy walnut fats.',
      traditionalNote: 'A centerpiece-worthy meatless meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_39',
      name: 'Tuscan White Bean Soup (Ribollita)',
      description: 'Hearty vegetable soup thickened with bread.',
      category: 'Main',
      icon: '🍲',
      ingredients: [
        '1 can cannellini beans',
        'Bunch of kale or chard',
        '2 slices stale Italian bread',
        'Veggie broth',
        'Saffron/spices'
      ],
      instructions: [
        'Simmer veggies and beans in broth.',
        'Tear bread into the soup to thicken.',
        'Simmer until creamy and rustic.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 30,
      servings: 3,
      nutritionalInfo: 'Sustaining fiber and minerals.',
      traditionalNote: 'Traditional food for Italian pilgrimages.',
    ),
    LentenRecipe(
      id: 'catholic_main_40',
      name: 'Baked Salmon with Dill (Sunday Only)',
      description: 'Rich fish dish for Lenten celebrations.',
      category: 'Main',
      icon: '🍣',
      ingredients: [
        '2 salmon fillets',
        'Fresh dill',
        'Lemon slices',
        'Asparagus'
      ],
      instructions: [
        'Place salmon and asparagus on a baking sheet.',
        'Top with dill and lemon.',
        'Bake at 400°F for 12-15 minutes.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 15,
      servings: 2,
      nutritionalInfo: 'Omega-3 fatty acids and lean protein.',
      traditionalNote: 'Sunday is a celebration of the Resurrection.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_3',
      name: 'Baked Pears with Walnuts',
      description: 'Warm and comforting fruit dessert.',
      category: 'Dessert',
      icon: '🍐',
      ingredients: ['2 pears', '1/4 cup walnuts', '1 tsp cinnamon', 'Honey'],
      instructions: [
        'Half pears and remove core.',
        'Fill with walnuts and cinnamon.',
        'Bake at 350°F for 20 minutes.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 20,
      servings: 2,
      nutritionalInfo: 'High fiber and healthy fats.',
      traditionalNote: 'A gentle way to satisfy a sweet craving.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_4',
      name: 'Almond Flour Cookies',
      description: 'Simple 3-ingredient cookies.',
      category: 'Dessert',
      icon: '🍪',
      ingredients: [
        '2 cups almond flour',
        '1/2 cup maple syrup',
        '1 tsp vanilla'
      ],
      instructions: [
        'Mix ingredients into a dough.',
        'Form into balls and flatten.',
        'Bake at 350°F for 12-15 minutes.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 12,
      nutritionalInfo: 'Gluten-free and protein-dense.',
      traditionalNote: 'Wholesome ingredients used simply.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_5',
      name: 'Avocado Chocolate Pudding',
      description: 'Creamy and rich healthy alternative.',
      category: 'Dessert',
      icon: '🥑',
      ingredients: [
        '2 avocados',
        '1/2 cup cocoa',
        '1/2 cup maple syrup',
        'Vanilla'
      ],
      instructions: ['Blend all until perfectly smooth.'],
      prepTimeMinutes: 10,
      cookTimeMinutes: 0,
      servings: 3,
      nutritionalInfo: 'Healthy fats and antioxidants.',
      traditionalNote: 'Modern satisfying treat.',
    ),

    // --- NEW BREAKFAST RECIPES ---
    LentenRecipe(
      id: 'catholic_breakfast_11',
      name: 'Blueberry Nut Granola',
      description: 'Crunchy homemade granola with antioxidant-rich berries.',
      category: 'Breakfast',
      icon: '🫐',
      ingredients: [
        '3 cups rolled oats',
        '1 cup walnuts',
        '1/2 cup maple syrup',
        '1/2 cup dried blueberries',
        '1/4 cup flax seeds'
      ],
      instructions: [
        'Toss oats, nuts, and syrup together.',
        'Bake at 325°F for 25 minutes, stirring once.',
        'Stir in dried blueberries and flax seeds after cooling.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 25,
      servings: 8,
      nutritionalInfo: 'High in fiber and heart-healthy fats.',
      traditionalNote: 'A sustaining cereal for Lenten mornings.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_12',
      name: 'Tofu & Spinach Breakfast Burrito',
      description: 'A savory, protein-filled wrap for a strong start.',
      category: 'Breakfast',
      icon: '🌯',
      ingredients: [
        '1 block firm tofu',
        '2 cups fresh spinach',
        '1/2 tsp turmeric',
        '2 large tortillas',
        'Salsa'
      ],
      instructions: [
        'Scramble tofu with turmeric in a pan.',
        'Wilt spinach into the tofu.',
        'Roll into tortillas and serve with salsa.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 10,
      servings: 2,
      nutritionalInfo: 'Excellent plant-based protein.',
      traditionalNote: 'A hearty meatless meal for partial fast days.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_13',
      name: 'Almond Joy Overnight Oats',
      description: 'Sweet and creamy oats that prepare themselves overnight.',
      category: 'Breakfast',
      icon: '🥥',
      ingredients: [
        '1/2 cup oats',
        '1 cup coconut milk',
        '1 tbsp cocoa powder',
        '1 tbsp sliced almonds',
        '1 tsp honey'
      ],
      instructions: [
        'Mix all ingredients in a jar.',
        'Refrigerate overnight.',
        'Top with extra almonds before serving.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Rich in magnesium and healthy fats.',
      traditionalNote: 'Allows more time for morning prayer and reflection.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_14',
      name: 'Savory Miso Oatmeal',
      description: 'A Japanese-inspired savory twist on a classic.',
      category: 'Breakfast',
      icon: '🥣',
      ingredients: [
        '1/2 cup oats',
        '1 cup water',
        '1 tsp miso paste',
        'Sliced scallions',
        'Sesame seeds'
      ],
      instructions: [
        'Cook oats as usual.',
        'Stir in miso paste until dissolved.',
        'Top with scallions and sesame seeds.'
      ],
      prepTimeMinutes: 2,
      cookTimeMinutes: 5,
      servings: 1,
      nutritionalInfo: 'Probiotics and whole grains.',
      traditionalNote: 'Humble and grounding savory breakfast.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_15',
      name: 'Flaxseed & Berry Power Bowl',
      description: 'Nutrient-dense bowl to fuel your spirit.',
      category: 'Breakfast',
      icon: '🍓',
      ingredients: [
        '1 cup almond yogurt',
        '2 tbsp ground flax seeds',
        '1/2 cup mixed berries',
        '1 tbsp pumpkin seeds'
      ],
      instructions: [
        'Scoop yogurt into a bowl.',
        'Top with flax, berries, and seeds.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Packed with antioxidants and omega-3s.',
      traditionalNote: 'Simple, uncooked food for quiet mornings.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_16',
      name: 'Toasted Sourdough with Hummus',
      description: 'A simple, Mediterranean-style morning meal.',
      category: 'Breakfast',
      icon: '🍞',
      ingredients: [
        '2 slices sourdough bread',
        '1/4 cup hummus',
        '1/2 cucumber, sliced',
        'Dried za\'atar'
      ],
      instructions: [
        'Toast the sourdough.',
        'Spread hummus generously.',
        'Top with cucumber and a sprinkle of za\'atar.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Good balance of carbs and fiber.',
      traditionalNote: 'A modern, purely plant-based breakfast.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_17',
      name: 'Poached Pear with Star Anise',
      description: 'A light and aromatic fruit-based breakfast.',
      category: 'Breakfast',
      icon: '🍐',
      ingredients: [
        '2 pears',
        '1 star anise',
        '1 cinnamon stick',
        '2 cups water'
      ],
      instructions: [
        'Simmer water with spices.',
        'Peal pears and poach in water for 15 minutes.',
        'Serve warm.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 15,
      servings: 2,
      nutritionalInfo: 'Easy to digest and vitamin-rich.',
      traditionalNote: 'Refreshing and meditative light meal.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_18',
      name: 'Quinoa & Apricot Porridge',
      description: 'Ancient grain breakfast with natural sweetness.',
      category: 'Breakfast',
      icon: '🍚',
      ingredients: [
        '1/2 cup quinoa',
        '1 cup water',
        '1/4 cup dried apricots, chopped',
        '1 tsp honey'
      ],
      instructions: [
        'Cook quinoa with apricots in water until tender.',
        'Stir in honey before serving.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 15,
      servings: 1,
      nutritionalInfo: 'Complete protein and iron.',
      traditionalNote: 'Sustaining and simple.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_19',
      name: 'Lenten Banana Pancakes',
      description: 'Simple 2-ingredient pancakes without egg or dairy.',
      category: 'Breakfast',
      icon: '🥞',
      ingredients: [
        '1 ripe banana',
        '1/2 cup oat flour',
        '1/4 tsp baking powder'
      ],
      instructions: [
        'Mash banana and mix with flour and baking powder.',
        'Cook small scoops on a non-stick pan until golden.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 10,
      servings: 1,
      nutritionalInfo: 'Potassium and whole grains.',
      traditionalNote: 'Humble and delicious meat-free treat.',
    ),
    LentenRecipe(
      id: 'catholic_breakfast_20',
      name: 'Coconut Chia Berry Parfait',
      description: 'Layered goodness for a refreshing morning.',
      category: 'Breakfast',
      icon: '🍨',
      ingredients: [
        '1 cup coconut yogurt',
        '2 tbsp chia seeds',
        '1/2 cup raspberries'
      ],
      instructions: [
        'Mix chia seeds into yogurt and let sit for 10 mins.',
        'Layer with raspberries in a glass.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Calcium and healthy fats.',
      traditionalNote: 'Simple and nourishing.',
    ),

    // --- NEW MAIN DISHES ---
    LentenRecipe(
      id: 'catholic_main_16',
      name: 'Roasted Vegetable Couscous',
      description: 'Fluffy semolina with colorful roasted gems.',
      category: 'Main',
      icon: '🥗',
      ingredients: [
        '1 cup couscous',
        '1 zucchini',
        '1 bell pepper',
        '1 red onion',
        'Olive oil'
      ],
      instructions: [
        'Roast chopped vegetables with oil at 400°F for 20 mins.',
        'Prepare couscous according to package.',
        'Toss together with a drizzle of oil.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 20,
      servings: 2,
      nutritionalInfo: 'Light and vitamin-dense.',
      traditionalNote: 'A Mediterranean Lenten favorite.',
    ),
    LentenRecipe(
      id: 'catholic_main_17',
      name: 'Chickpea & Potato Curry',
      description: 'Hearty and aromatic Indian-style curry.',
      category: 'Main',
      icon: '🍛',
      ingredients: [
        '1 can chickpeas',
        '2 potatoes, cubed',
        '1 onion',
        '1 tbsp curry powder',
        '1 cup coconut milk'
      ],
      instructions: [
        'Sauté onion and spices.',
        'Add potatoes and chickpeas, then coconut milk.',
        'Simmer for 20 minutes until potatoes are tender.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 20,
      servings: 3,
      nutritionalInfo: 'High protein and satisfying.',
      traditionalNote: 'A warming and humble vegan meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_18',
      name: 'Mediterranean Stuffed Peppers',
      description: 'Zesty rice and lentil filling in bell peppers.',
      category: 'Main',
      icon: '🫑',
      ingredients: [
        '4 bell peppers',
        '1 cup cooked rice',
        '1/2 cup cooked lentils',
        '1/4 cup olives',
        'Parsley'
      ],
      instructions: [
        'Mix rice, lentils, olives, and herbs.',
        'Stuff into hollowed peppers.',
        'Bake at 375°F for 30 minutes until peppers are soft.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      servings: 4,
      nutritionalInfo: 'Fiber and complex carbohydrates.',
      traditionalNote: 'Colorful and nutritious meatless dinner.',
    ),
    LentenRecipe(
      id: 'catholic_main_19',
      name: 'Sweet Potato & Black Bean Tacos',
      description: 'Flavorful plant-based tacos.',
      category: 'Main',
      icon: '🌮',
      ingredients: [
        '2 sweet potatoes, cubed',
        '1 can black beans',
        'Corn tortillas',
        'Lime',
        'Cilantro'
      ],
      instructions: [
        'Roast sweet potatoes until tender.',
        'Warm beans and tortillas.',
        'Assemble with lime and cilantro.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 25,
      servings: 4,
      nutritionalInfo: 'High in Vitamin A and fiber.',
      traditionalNote: 'Modern satisfying Lenten dinner.',
    ),
    LentenRecipe(
      id: 'catholic_main_20',
      name: 'Spinach & White Bean Soup',
      description: 'Creamy Tuscan-style soup without the cream.',
      category: 'Main',
      icon: '🥣',
      ingredients: [
        '2 cans cannellini beans',
        '4 cups spinach',
        '2 cloves garlic',
        '4 cups veg broth'
      ],
      instructions: [
        'Sauté garlic. Add broth and half the beans.',
        'Blend until creamy, then add remaining beans and spinach.',
        'Simmer until spinach is wilted.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 4,
      nutritionalInfo: 'Low calorie and high iron.',
      traditionalNote: 'Rustic and humble.',
    ),
    LentenRecipe(
      id: 'catholic_main_21',
      name: 'Sesame Ginger Tofu Noodles',
      description: 'Quick Asian-style noodles.',
      category: 'Main',
      icon: '🍜',
      ingredients: [
        '1 block tofu',
        'Lo mein noodles',
        '2 tbsp soy sauce',
        '1 tbsp ginger',
        'Sesame oil'
      ],
      instructions: [
        'Cook noodles. Sauté tofu until crisp.',
        'Toss noodles and tofu with soy sauce and ginger.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 10,
      servings: 2,
      nutritionalInfo: 'High protein and energy.',
      traditionalNote: 'Light and efficient for busy days.',
    ),
    LentenRecipe(
      id: 'catholic_main_22',
      name: 'Falafel with Tahini',
      description: 'Crispy chickpea balls with nutty sauce.',
      category: 'Main',
      icon: '🧆',
      ingredients: [
        '1 batch falafel mix (or canned chickpeas/flour)',
        '2 tbsp tahini',
        'Pita bread',
        'Cucumber'
      ],
      instructions: [
        'Form and bake/fry falafel balls.',
        'Serve in pita with sliced cucumber and tahini.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 15,
      servings: 3,
      nutritionalInfo: 'Plant-based protein and iron.',
      traditionalNote: 'A Middle Eastern fasting staple.',
    ),
    LentenRecipe(
      id: 'catholic_main_23',
      name: 'Vegetable Paella',
      description: 'A festive and colorful Spanish rice dish.',
      category: 'Main',
      icon: '🥘',
      ingredients: [
        '2 cups bomba rice',
        '4 cups veg broth',
        'Saffron',
        'Peas',
        'Artichokes',
        'Bell peppers'
      ],
      instructions: [
        'Sauté peppers and artichokes.',
        'Add rice and saffron broth. Simmer without stirring.',
        'Garnish with peas and lemon.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 25,
      servings: 4,
      nutritionalInfo: 'Energy dense and vitamin-rich.',
      traditionalNote: 'Humble celebration of the earth\'s bounty.',
    ),
    LentenRecipe(
      id: 'catholic_main_24',
      name: 'Lentil & Spinach Dahl',
      description: 'Spiced red lentils with fresh greens.',
      category: 'Main',
      icon: '🍲',
      ingredients: [
        '1 cup red lentils',
        '3 cups water',
        '1 tsp turmeric',
        '1 tsp cumin',
        '2 cups spinach'
      ],
      instructions: [
        'Boil lentils with spices until soft.',
        'Stir in spinach until wilted.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 20,
      servings: 2,
      nutritionalInfo: 'High protein and fiber.',
      traditionalNote: 'Humble, warming, and easy to prepare.',
    ),
    LentenRecipe(
      id: 'catholic_main_25',
      name: 'Baked Salmon with Dill',
      description: 'Nourishing seafood for fast days.',
      category: 'Main',
      icon: '🐟',
      ingredients: ['2 salmon fillets', 'Fresh dill', 'Lemon', 'Olive oil'],
      instructions: [
        'Place salmon on tray, drizzle with oil and lemon.',
        'Top with dill and bake at 375°F for 15 minutes.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 15,
      servings: 2,
      nutritionalInfo: 'Rich in Omega-3 fatty acids.',
      traditionalNote: 'Fisherman\'s Friday tradition.',
    ),
    LentenRecipe(
      id: 'catholic_main_26',
      name: 'Pasta Puttanesca (Vegan)',
      description: 'Bold flavors with olives and capers.',
      category: 'Main',
      icon: '🍝',
      ingredients: [
        'Spaghetti',
        'Canned tomatoes',
        'Black olives',
        'Capers',
        'Red pepper flakes'
      ],
      instructions: [
        'Simmer tomatoes with olives and capers.',
        'Toss with cooked spaghetti.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 2,
      nutritionalInfo: 'Heart-healthy fats and lycopene.',
      traditionalNote: 'A classic "pantry" pasta, humble yet flavorful.',
    ),
    LentenRecipe(
      id: 'catholic_main_27',
      name: 'Hearty Minestrone',
      description: 'Traditional vegetable and bean soup.',
      category: 'Main',
      icon: '🥣',
      ingredients: [
        'Celery',
        'Carrots',
        'Onion',
        'Zucchini',
        'Pasta shells',
        'Kidney beans'
      ],
      instructions: [
        'Sauté base veg. Add broth and beans.',
        'Add pasta and zucchini, cook until tender.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 25,
      servings: 4,
      nutritionalInfo: 'Full spectrum of vitamins and fiber.',
      traditionalNote: 'A Lenten staple in many Catholic homes.',
    ),
    LentenRecipe(
      id: 'catholic_main_28',
      name: 'Gnocchi with Walnuts',
      description: 'Soft potato pillows with a nutty crunch.',
      category: 'Main',
      icon: '🥟',
      ingredients: [
        '1 package potato gnocchi',
        '1/2 cup walnuts',
        'Olive oil',
        'Fresh sage'
      ],
      instructions: [
        'Boil gnocchi. Toast walnuts and sage in oil.',
        'Toss gnocchi in the flavored oil.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 10,
      servings: 2,
      nutritionalInfo: 'Sustaining carbohydrates and healthy fats.',
      traditionalNote: 'Simple and elegant meat-free meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_29',
      name: 'Quinoa Stuffed Acorn Squash',
      description: 'Roasted squash with a savory grain filling.',
      category: 'Main',
      icon: '🎃',
      ingredients: [
        '1 acorn squash',
        '1 cup cooked quinoa',
        'Cranberries',
        'Pecans'
      ],
      instructions: [
        'Roast squash halves for 30 mins.',
        'Mix quinoa with fruit/nuts, stuff in squash and bake 10 more mins.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 40,
      servings: 2,
      nutritionalInfo: 'High fiber and vitamins.',
      traditionalNote: 'Humble and grounding seasonal dish.',
    ),
    LentenRecipe(
      id: 'catholic_main_30',
      name: 'Miso Glazed Eggplant',
      description: 'Japanese-style roasted eggplant.',
      category: 'Main',
      icon: '🍆',
      ingredients: [
        '1 large eggplant',
        '2 tbsp miso paste',
        '1 tbsp maple syrup',
        'Sesame seeds'
      ],
      instructions: [
        'Score eggplant and brush with miso/syrup mix.',
        'Roast at 400°F for 20 minutes until caramelized.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 20,
      servings: 2,
      nutritionalInfo: 'Low calorie and rich in umami.',
      traditionalNote: 'Simplistic elegance in plant-based cooking.',
    ),

    // --- MORE MAIN DISHES ---
    LentenRecipe(
      id: 'catholic_main_31',
      name: 'Mushroom & Spinach Lasagna',
      description: 'Rich and earthy meatless lasagna.',
      category: 'Main',
      icon: '🍝',
      ingredients: [
        'Lasagna noodles',
        '2 cups ricotta',
        '1 lb mushrooms',
        '4 cups spinach',
        'Marinara',
        'Mozzarella'
      ],
      instructions: [
        'Sauté mushrooms and spinach.',
        'Layer noodles, sauce, ricotta, and veg mix.',
        'Top with mozzarella and bake at 375°F for 40 mins.'
      ],
      prepTimeMinutes: 30,
      cookTimeMinutes: 40,
      servings: 6,
      nutritionalInfo: 'High in calcium and iron.',
      traditionalNote: 'A hearty staple for Lenten gatherings.',
    ),
    LentenRecipe(
      id: 'catholic_main_32',
      name: 'Roasted Root Medley',
      description: 'Golden roasted carrots, parsnips, and beets.',
      category: 'Main',
      icon: '🥕',
      ingredients: [
        '3 carrots',
        '2 parsnips',
        '2 beets',
        'Olive oil',
        'Rosemary'
      ],
      instructions: [
        'Chop roots into chunks.',
        'Toss with oil and rosemary.',
        'Roast at 400°F for 35 minutes until tender.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 35,
      servings: 4,
      nutritionalInfo: 'Complex carbs and high fiber.',
      traditionalNote: 'Humble earth-harvested meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_33',
      name: 'Mediterranean Orzo Salad',
      description: 'Light pasta salad with fresh garden flavors.',
      category: 'Main',
      icon: '🥗',
      ingredients: [
        '1 cup orzo',
        'Cucumber',
        'Cherry tomatoes',
        'Olives',
        'Lemon vinaigrette'
      ],
      instructions: [
        'Cook orzo and cool.',
        'Toss with chopped veg and dressing.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 10,
      servings: 3,
      nutritionalInfo: 'Hydrating and light.',
      traditionalNote: 'Perfect for a warm Lenten lunch.',
    ),
    LentenRecipe(
      id: 'catholic_main_34',
      name: 'Black-eyed Pea Soup',
      description: 'Nutritious bean soup with smoky notes.',
      category: 'Main',
      icon: '🥣',
      ingredients: [
        '2 cans black-eyed peas',
        '1 onion',
        '2 carrots',
        'Smoked paprika',
        'Veg broth'
      ],
      instructions: [
        'Sauté onion and carrots.',
        'Add peas, broth, and paprika.',
        'Simmer for 25 minutes.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 25,
      servings: 4,
      nutritionalInfo: 'High protein and potassium.',
      traditionalNote: 'Humble and filling pulse-based meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_35',
      name: 'Stuffed Cabbage Rolls',
      description: 'Cabbage leaves filled with savory rice and veg.',
      category: 'Main',
      icon: '🥬',
      ingredients: [
        '1 head cabbage',
        '1 cup rice',
        '1/2 cup lentils',
        'Tomato sauce'
      ],
      instructions: [
        'Boil cabbage leaves to soften.',
        'Roll rice/lentil mix into leaves.',
        'Place in dish, cover with sauce, and bake for 45 mins.'
      ],
      prepTimeMinutes: 30,
      cookTimeMinutes: 45,
      servings: 4,
      nutritionalInfo: 'Fiber and B-vitamins.',
      traditionalNote: 'Traditional Eastern European Lenten dish.',
    ),
    LentenRecipe(
      id: 'catholic_main_36',
      name: 'Tofu "Fish" Tacos',
      description: 'Crispy tofu with a hint of the sea.',
      category: 'Main',
      icon: '🌮',
      ingredients: [
        '1 block tofu',
        '1 sheet nori, crumbled',
        'Cornstarch',
        'Cabbage slaw',
        'Tortillas'
      ],
      instructions: [
        'Press and slice tofu. Press into nori/cornstarch mix.',
        'Pan-fry until crisp.',
        'Serve in tortillas with slaw.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 10,
      servings: 3,
      nutritionalInfo: 'High protein and iodine.',
      traditionalNote: 'Modern clever meatless Friday meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_37',
      name: 'Vegetable Jambalaya',
      description: 'Zesty Cajun rice with all the spice.',
      category: 'Main',
      icon: '🥘',
      ingredients: [
        'Rice',
        'Okra',
        'Bell peppers',
        'Celery',
        'Cajun seasoning',
        'Kidney beans'
      ],
      instructions: [
        'Sauté the "holy trinity" (onion, celery, pepper).',
        'Add rice, beans, okra, and broth. Simmer until absorbed.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      servings: 4,
      nutritionalInfo: 'High fiber and vitamins.',
      traditionalNote: 'A festive yet meat-free Creole meal.',
    ),
    LentenRecipe(
      id: 'catholic_main_38',
      name: 'Polenta with Mushrooms',
      description: 'Creamy cornmeal topped with sautéed fungi.',
      category: 'Main',
      icon: '🌽',
      ingredients: ['1 cup polenta', '1 lb mixed mushrooms', 'Garlic', 'Thyme'],
      instructions: [
        'Cook polenta per package.',
        'Sauté mushrooms with garlic and thyme.',
        'Spoon mushrooms over bowls of polenta.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 20,
      servings: 2,
      nutritionalInfo: 'Gluten-free and sustaining.',
      traditionalNote: 'Rustic Northern Italian fasting food.',
    ),
    LentenRecipe(
      id: 'catholic_main_39',
      name: 'Asparagus & Lemon Risotto',
      description: 'Bright and springtime-fresh rice dish.',
      category: 'Main',
      icon: '🍋',
      ingredients: [
        'Arborio rice',
        '1 bunch asparagus',
        'Lemon zest',
        'Veg broth',
        'Shallots'
      ],
      instructions: [
        'Sauté shallots. Add rice.',
        'Gradually add broth, stirring constantly.',
        'Add asparagus in the last 10 minutes. Finish with zest.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      servings: 3,
      nutritionalInfo: 'Vitamins K and C.',
      traditionalNote: 'Celebrates early spring ingredients during Lent.',
    ),
    LentenRecipe(
      id: 'catholic_main_40',
      name: 'Red Beans and Rice',
      description: 'The ultimate humble comfort food.',
      category: 'Main',
      icon: '🍚',
      ingredients: [
        '1 lb kidney beans',
        '1 onion',
        '1 bell pepper',
        'Rice',
        'Spices'
      ],
      instructions: [
        'Soak and boil beans with veg and spices until creamy.',
        'Serve over hot white rice.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 60,
      servings: 6,
      nutritionalInfo: 'Complete protein and very high fiber.',
      traditionalNote:
          'A traditional Monday meal, perfect for Lenten discipline.',
    ),

    // --- NEW SNACK RECIPES ---
    LentenRecipe(
      id: 'catholic_snack_11',
      name: 'Roasted Pumpkin Seeds',
      description: 'Crunchy and salty seed snack.',
      category: 'Snack',
      icon: '🎃',
      ingredients: ['1 cup pumpkin seeds', '1 tbsp olive oil', 'Sea salt'],
      instructions: [
        'Toss seeds with oil and salt.',
        'Roast at 300°F for 45 minutes until golden.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 45,
      servings: 4,
      nutritionalInfo: 'High in zinc and healthy fats.',
      traditionalNote: 'A humble way to use every part of the harvest.',
    ),
    LentenRecipe(
      id: 'catholic_snack_12',
      name: 'Rice Cakes with Almond Butter',
      description: 'Simple and satisfying crunch.',
      category: 'Snack',
      icon: '🍘',
      ingredients: ['2 rice cakes', '2 tbsp almond butter'],
      instructions: ['Spread and enjoy.'],
      prepTimeMinutes: 2,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Healthy fats and light carbs.',
      traditionalNote: 'Effortless Lenten sustenance.',
    ),
    LentenRecipe(
      id: 'catholic_snack_13',
      name: 'Dried Figs and Walnuts',
      description: 'A classic Mediterranean fasting pairing.',
      category: 'Snack',
      icon: '🥯',
      ingredients: ['4 dried figs', '1/4 cup walnuts'],
      instructions: ['Serve together as a small plate.'],
      prepTimeMinutes: 2,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Iron, fiber, and omega-3s.',
      traditionalNote: 'Ancient foods of the Middle Eastern desert.',
    ),
    LentenRecipe(
      id: 'catholic_snack_14',
      name: 'Salsa and Tortilla Chips',
      description: 'Fresh and zesty plant-based snack.',
      category: 'Snack',
      icon: '🥣',
      ingredients: ['1 cup salsa', 'Baked corn chips'],
      instructions: ['Dip and enjoy.'],
      prepTimeMinutes: 2,
      cookTimeMinutes: 0,
      servings: 2,
      nutritionalInfo: 'Low fat, high vitamin C.',
      traditionalNote: 'Modern light snack.',
    ),
    LentenRecipe(
      id: 'catholic_snack_15',
      name: 'Bell Peppers and Guacamole',
      description: 'Crunchy veg with creamy healthy fat.',
      category: 'Snack',
      icon: '🥑',
      ingredients: ['2 bell peppers', '1/2 cup guacamole'],
      instructions: ['Slice peppers and dip.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'High in Vitamin C and heart-healthy fats.',
      traditionalNote: 'Simple and raw.',
    ),
    LentenRecipe(
      id: 'catholic_snack_16',
      name: 'Nutritional Yeast Popcorn',
      description: 'Savory and light snack.',
      category: 'Snack',
      icon: '🍿',
      ingredients: [
        '4 cups air-popped popcorn',
        '1 tbsp nutritional yeast',
        'Salt'
      ],
      instructions: ['Toss popcorn with yeast and salt.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 5,
      servings: 2,
      nutritionalInfo: 'Low calorie and high in B-vitamins.',
      traditionalNote: 'A light, modern Lenten treat.',
    ),
    LentenRecipe(
      id: 'catholic_snack_17',
      name: 'Steamed Artichoke',
      description: 'A meditative snack of pulling and dipping.',
      category: 'Snack',
      icon: '🍀',
      ingredients: ['1 large artichoke', 'Lemon juice', 'Olive oil'],
      instructions: [
        'Steam artichoke for 40 minutes.',
        'Serve with lemon/oil dipping sauce.'
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 40,
      servings: 1,
      nutritionalInfo: 'Very high fiber and antioxidants.',
      traditionalNote: 'Requires patience and focus, fitting for Lent.',
    ),
    LentenRecipe(
      id: 'catholic_snack_18',
      name: 'Olives and Pickles',
      description: 'Zesty fermented vegetables.',
      category: 'Snack',
      icon: '🫒',
      ingredients: ['Mixed olives', 'Dill pickles', 'Pickled onions'],
      instructions: ['Assort on a small plate.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 2,
      nutritionalInfo: 'Probiotics and healthy fats.',
      traditionalNote: 'Common humble fare for fasting days.',
    ),
    LentenRecipe(
      id: 'catholic_snack_19',
      name: 'Frozen Grapes',
      description: 'Nature\'s tiny sorbets.',
      category: 'Snack',
      icon: '🍇',
      ingredients: ['2 cups grapes'],
      instructions: ['Wash and freeze for 4 hours.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 2,
      nutritionalInfo: 'Hydrating and naturally sweet.',
      traditionalNote: 'Simplest of sweets.',
    ),
    LentenRecipe(
      id: 'catholic_snack_20',
      name: 'Celery & Sunflower Butter',
      description: 'Nut-free savory snack.',
      category: 'Snack',
      icon: '🥬',
      ingredients: ['4 celery stalks', '2 tbsp sunflower butter'],
      instructions: ['Fill celery with butter.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Hydrating and mineral-rich.',
      traditionalNote: 'Simple, uncooked Lenten snack.',
    ),

    // --- NEW DESSERT RECIPES ---
    LentenRecipe(
      id: 'catholic_dessert_6',
      name: 'Baked Apple with Raisins',
      description: 'Warm, spice-filled fruit dessert.',
      category: 'Dessert',
      icon: '🍎',
      ingredients: ['2 apples', '1/4 cup raisins', 'Cinnamon', 'Honey'],
      instructions: [
        'Core apples and fill with raisins and cinnamon.',
        'Bake at 350°F for 30 minutes until soft.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 30,
      servings: 2,
      nutritionalInfo: 'High fiber and vitamins.',
      traditionalNote: 'A classic humble Lenten dessert.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_7',
      name: 'Natural Mango Sorbet',
      description: 'One-ingredient frozen treat.',
      category: 'Dessert',
      icon: '🥭',
      ingredients: ['3 cups frozen mango chunks'],
      instructions: ['Blend in a high-speed blender until perfectly smooth.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 3,
      nutritionalInfo: 'High in Vitamin A and C.',
      traditionalNote: 'Pure fruit indulgence.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_8',
      name: 'Date and Nut Energy Balls',
      description: 'Naturally sweet and sustaining bites.',
      category: 'Dessert',
      icon: '🧆',
      ingredients: ['1 cup dates', '1 cup walnuts', '1/2 cup shredded coconut'],
      instructions: [
        'Process dates and nuts until sticky.',
        'Roll into balls and coat in coconut.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 0,
      servings: 10,
      nutritionalInfo: 'Fiber, healthy fats, and natural sugar.',
      traditionalNote: 'No-bake and humble.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_9',
      name: 'Poached Peaches in Ginger',
      description: 'Warm and spicy fruit dessert.',
      category: 'Dessert',
      icon: '🍑',
      ingredients: [
        '2 peaches',
        '1-inch fresh ginger, sliced',
        'Honey',
        'Water'
      ],
      instructions: [
        'Simmer ginger and honey in water.',
        'Poach peach halves for 10 minutes.',
        'Serve warm with the syrup.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 10,
      servings: 2,
      nutritionalInfo: 'Digestive aid and vitamin-rich.',
      traditionalNote: 'Light and refreshing.',
    ),
    LentenRecipe(
      id: 'catholic_main_41',
      name: 'Ethiopian Misir Wot',
      description: 'Spicy and flavorful red lentil stew.',
      category: 'Main',
      icon: '🍲',
      ingredients: [
        '1 cup red lentils',
        '2 tbsp Berbere spice',
        '1 onion',
        '2 cloves garlic',
        'Ginger'
      ],
      instructions: [
        'Sauté onion, garlic, and ginger.',
        'Add Berbere spice and lentils with 3 cups water.',
        'Simmer for 30 minutes until thick and tender.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 30,
      servings: 3,
      nutritionalInfo: 'High protein and exotic spices.',
      traditionalNote:
          'Traditional fasting food from the Ethiopian Orthodox/Catholic tradition.',
    ),
    LentenRecipe(
      id: 'catholic_main_42',
      name: 'Spanish Tortilla (No-Egg)',
      description: 'Potato and onion "omelette" using chickpea flour.',
      category: 'Main',
      icon: '🍳',
      ingredients: [
        '3 potatoes',
        '1 onion',
        '1 cup chickpea flour',
        '1 cup water'
      ],
      instructions: [
        'Sauté sliced potatoes and onions until soft.',
        'Whisk chickpea flour and water. Mix with potatoes.',
        'Cook in a pan like a thick pancake, flipping halfway.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 20,
      servings: 4,
      nutritionalInfo: 'High in fiber and plant protein.',
      traditionalNote: 'A clever Lenten adaptation of a Spanish classic.',
    ),
    LentenRecipe(
      id: 'catholic_main_43',
      name: 'Vietnamese Pho (Vegan)',
      description: 'Aromatic noodle soup with charred ginger and star anise.',
      category: 'Main',
      icon: '🍜',
      ingredients: [
        'Rice noodles',
        'Star anise',
        'Cinnamon',
        'Charred ginger',
        'Tofu',
        'Mushroom broth'
      ],
      instructions: [
        'Simmer broth with spices for 30 mins.',
        'Pour over cooked noodles and tofu.',
        'Garnish with basil, lime, and sprouts.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 40,
      servings: 2,
      nutritionalInfo: 'Hydrating and light.',
      traditionalNote: 'A clean and satisfying meatless soup.',
    ),
    LentenRecipe(
      id: 'catholic_main_44',
      name: 'Mexican Pozole (Vegan)',
      description: 'Hearty hominy soup with guajillo chilies.',
      category: 'Main',
      icon: '🥣',
      ingredients: [
        '1 can hominy',
        '3 dried guajillo chilies',
        'Garlic',
        'Radishes',
        'Oregano'
      ],
      instructions: [
        'Rehydrate and blend chilies with garlic.',
        'Simmer hominy in broth with chili paste for 40 mins.',
        'Serve with radishes, cabbage, and lime.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 45,
      servings: 4,
      nutritionalInfo: 'Vitamin-rich and high in complex carbs.',
      traditionalNote:
          'A celebratory yet meat-free version of a Mexican staple.',
    ),
    LentenRecipe(
      id: 'catholic_main_45',
      name: 'Indian Aloo Gobi',
      description: 'Classic dry curry of potatoes and cauliflower.',
      category: 'Main',
      icon: '🥦',
      ingredients: [
        '2 potatoes',
        '1 head cauliflower',
        '1 tsp turmeric',
        '1 tsp cumin',
        'Ginger'
      ],
      instructions: [
        'Sauté spices and ginger.',
        'Toss in potato and cauliflower chunks.',
        'Cook covered on low heat until tender.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 20,
      servings: 3,
      nutritionalInfo: 'High in antioxidants and fiber.',
      traditionalNote: 'A simple and nutritious plant-based meal.',
    ),
    LentenRecipe(
      id: 'catholic_snack_21',
      name: 'Spiced Toasted Walnuts',
      description: 'A warm and savory nut snack.',
      category: 'Snack',
      icon: '🥜',
      ingredients: [
        '1 cup walnuts',
        '1/2 tsp cumin',
        '1/4 tsp cayenne',
        '1 tsp maple syrup'
      ],
      instructions: [
        'Toss walnuts with spices and syrup.',
        'Roast at 350°F for 10 minutes, stirring once.'
      ],
      prepTimeMinutes: 2,
      cookTimeMinutes: 10,
      servings: 4,
      nutritionalInfo: 'Excellent brain-healthy fats.',
      traditionalNote: 'Simple and sustaining.',
    ),
    LentenRecipe(
      id: 'catholic_snack_22',
      name: 'Seaweed Snacks (Nori)',
      description: 'Thin and crispy salty sheets.',
      category: 'Snack',
      icon: '🍙',
      ingredients: ['1 pack roasted nori sheets'],
      instructions: ['Enjoy straight from the pack.'],
      prepTimeMinutes: 0,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'High in iodine and vitamins.',
      traditionalNote: 'A very light and humble fasting snack.',
    ),
    LentenRecipe(
      id: 'catholic_snack_23',
      name: 'Sliced Radishes with Sea Salt',
      description: 'Crunchy and peppery raw snack.',
      category: 'Snack',
      icon: '🥗',
      ingredients: ['5 radishes', 'Sea salt', 'Lemon wedge'],
      instructions: ['Slice thin, sprinkle with salt and lemon juice.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Hydrating and zero-fat.',
      traditionalNote: 'A classic European farm-style fasting food.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_11',
      name: 'Pistachio Stuffed Dates',
      description: 'Naturally sweet "candies" from the desert.',
      category: 'Dessert',
      icon: '🌴',
      ingredients: ['6 Medjool dates', '12 shelled pistachios'],
      instructions: ['Pit dates and press two pistachios into each.'],
      prepTimeMinutes: 5,
      cookTimeMinutes: 0,
      servings: 2,
      nutritionalInfo: 'Natural sugars and healthy mineral-rich nuts.',
      traditionalNote: 'Biblical fruits often enjoyed during fasts.',
    ),
    LentenRecipe(
      id: 'catholic_dessert_12',
      name: 'Coconut Water with Lime',
      description: 'Refreshing and hydrating simple ending.',
      category: 'Dessert',
      icon: '🥥',
      ingredients: ['1 cup fresh coconut water', '1/2 lime'],
      instructions: ['Mix and serve chilled.'],
      prepTimeMinutes: 2,
      cookTimeMinutes: 0,
      servings: 1,
      nutritionalInfo: 'Packed with electrolytes.',
      traditionalNote: 'A pure and simple refreshment.',
    ),
    LentenRecipe(
      id: 'catholic_main_21',
      name: 'Mujadara',
      description: 'Middle Eastern lentils, rice, and caramelized onions.',
      category: 'Main',
      icon: '🍛',
      ingredients: [
        '1 cup brown lentils',
        '1 cup basmati rice',
        '3 large onions',
        'Olive oil',
        'Cumin',
        'Coriander'
      ],
      instructions: [
        'Cook lentils until tender.',
        'Sauté onions in plenty of oil until dark brown and caramelized.',
        'Cook rice with cumin and coriander.',
        'Mix lentils and rice, top with the caramelized onions.'
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 45,
      servings: 4,
      nutritionalInfo: 'Complete protein and fiber.',
      traditionalNote:
          'A humble and highly satisfying dish common in Eastern Christian traditions.',
    ),
    LentenRecipe(
      id: 'catholic_main_22',
      name: 'Gallo Pinto',
      description: 'Costa Rican style beans and rice.',
      category: 'Main',
      icon: '🇨🇷',
      ingredients: [
        '2 cups cooked black beans',
        '3 cups cooked white rice',
        'Bell pepper',
        'Onion',
        'Lizano sauce (or Worcestershire)',
        'Cilantro'
      ],
      instructions: [
        'Sauté peppers and onions.',
        'Add beans with a bit of their liquid.',
        'Stir in rice and sauce until well combined and slightly fried.',
        'Garnish with fresh cilantro.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 10,
      servings: 4,
      nutritionalInfo: 'Classic energy-dense plant-based meal.',
      traditionalNote:
          'A staple sustaining meal in Latin American Lenten practice.',
    ),
    LentenRecipe(
      id: 'catholic_main_23',
      name: 'Pasta e Fagioli',
      description: 'Italian pasta and bean soup.',
      category: 'Main',
      icon: '🥣',
      ingredients: [
        '1 can cannellini beans',
        '1/2 lb ditalini pasta',
        '2 cups marinara',
        '2 cups veg broth',
        'Garlic',
        'Rosemary'
      ],
      instructions: [
        'Sauté garlic and rosemary.',
        'Add beans, broth, and sauce. Bring to a boil.',
        'Add pasta and cook until al dente.',
        'Serve thick and warm.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 4,
      nutritionalInfo: 'Hearty and protein-rich.',
      traditionalNote:
          'A traditional "peasant" dish perfect for a simple Lenten dinner.',
    ),
    LentenRecipe(
      id: 'catholic_main_24',
      name: 'Dal Tadka',
      description: 'Indian yellow lentils with tempered spices.',
      category: 'Main',
      icon: '🥘',
      ingredients: [
        '1 cup yellow moong dal',
        'Turmeric',
        'Cumin seeds',
        'Garlic',
        'Ginger',
        'Chili'
      ],
      instructions: [
        'Pressure cook dal with turmeric.',
        'Heat oil, fry cumin, garlic, ginger, and chili (the "Tadka").',
        'Pour tempering over the cooked dal.',
        'Serve with rice or flatbread.'
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 20,
      servings: 3,
      nutritionalInfo: 'Very high in plant protein and easy to digest.',
      traditionalNote: 'Grounding and nourishing for fasting periods.',
    ),
    LentenRecipe(
      id: 'catholic_main_25',
      name: 'Vegetarian Borscht',
      description: 'Eastern European beet soup.',
      category: 'Main',
      icon: '🥣',
      ingredients: [
        '3 beets, grated',
        '2 potatoes',
        '1 carrot',
        '1/2 cabbage',
        'Tomato paste',
        'Dill'
      ],
      instructions: [
        'Boil potatoes and carrots.',
        'Sauté beets with tomato paste and add to the pot.',
        'Add shredded cabbage and cook until tender.',
        'Top with plenty of fresh dill.'
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 40,
      servings: 4,
      nutritionalInfo: 'Blood-purifying and vitamin-rich.',
      traditionalNote: 'A traditional Lenten staple in many Slavic cultures.',
    ),
  ];

  static List<LentenRecipe> getRecipesByCategory(String category) {
    return allRecipes.where((r) => r.category == category).toList();
  }

  static List<String> getCategories() {
    return ['Breakfast', 'Main', 'Snack', 'Dessert', 'Mocktails'];
  }
}
