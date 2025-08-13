// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import '../widgets/recipe_list_item.dart';
import '../widgets/empty_state.dart';
import '../main.dart'; // Import color constants

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // --- STATE ---
  // Default selection to show an initial recipe
  final Set<String> _selectedIngredients = {"egg", "onion", "tomato", "green chili"};
  late List<Recipe> _filteredRecipes;

  // --- UPDATED DATA: Indian Household Ingredients & Recipes ---
  final List<Recipe> _allRecipes = [
    Recipe(
        name: "Dal Tadka",
        imageUrl: "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398",
        ingredients: ["lentils", "onion", "tomato", "ginger", "garlic", "turmeric", "ghee", "cumin seeds"],
        instructions: "1. Pressure cook lentils (dal) with turmeric and salt.\n2. For the tadka (tempering), heat ghee in a small pan.\n3. Add cumin seeds, chopped ginger, garlic, and onions. Sauté until golden.\n4. Add tomatoes and cook until soft.\n5. Pour the tadka over the cooked dal and mix well."),
    Recipe(
        name: "Aloo Matar",
        imageUrl: "https://images.unsplash.com/photo-1630383324018-4c8aca054d73",
        ingredients: ["potato", "peas", "onion", "tomato", "ginger", "garlic", "turmeric", "coriander powder", "garam masala"],
        instructions: "1. Sauté onions, ginger, and garlic.\n2. Add tomato puree and cook.\n3. Add spices: turmeric, coriander powder, and garam masala.\n4. Add boiled potatoes and peas. Simmer for 10 minutes."),
    Recipe(
        name: "Simple Paneer Bhurji",
        imageUrl: "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398", // Placeholder, find a paneer bhurji image
        ingredients: ["paneer", "onion", "tomato", "turmeric", "chili powder"],
        instructions: "1. Sauté chopped onions in oil until translucent.\n2. Add tomatoes and cook until soft.\n3. Add turmeric and chili powder.\n4. Add crumbled paneer and mix well. Cook for 5 minutes."),
    Recipe(
        name: "Jeera Aloo",
        imageUrl: "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398", // Placeholder, find a jeera aloo image
        ingredients: ["potato", "cumin seeds", "turmeric", "ghee", "cilantro"],
        instructions: "1. Heat ghee in a pan and add cumin seeds.\n2. When they splutter, add boiled and cubed potatoes.\n3. Add turmeric and salt. Sauté for a few minutes until potatoes are lightly browned.\n4. Garnish with fresh cilantro."),
    Recipe(
        name: "Masala Omelette🍳",
        imageUrl: "https://cdn.pixabay.com/photo/2019/03/10/13/32/food-4046229_1280.jpg",
        ingredients: ["egg", "onion", "tomato", "green chili"],
        instructions: "1. Finely chop onion, tomato, green chili.\n2. Whisk eggs in a bowl and add the chopped vegetables.\n3. Pour the mixture onto a hot, oiled pan.\n4. Cook until set, then fold and serve."),
  ];

  @override
  void initState() {
    super.initState();
    _filterRecipes();
  }

  void _filterRecipes() {
    setState(() {
      // A recipe is shown only if EVERY ingredient required for it is present in the user's selection.
      _filteredRecipes = _allRecipes.where((recipe) {
        return recipe.ingredients.every((requiredIngredient) => _selectedIngredients.contains(requiredIngredient));
      }).toList();
    });
  }

  void _onIngredientSelected(String ingredient) {
    setState(() {
      if (_selectedIngredients.contains(ingredient)) {
        _selectedIngredients.remove(ingredient);
      } else {
        _selectedIngredients.add(ingredient);
      }
      _filterRecipes(); // Re-filter the list every time a selection changes
    });
  }

  @override
  Widget build(BuildContext context) {
    // Generate the master list of all unique ingredients from the recipes
    final allIngredients = _allRecipes.expand((r) => r.ingredients).toSet().toList()..sort();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: linearBlack,
            pinned: true,
            centerTitle: false,
            title: Row(
              children: [
                Icon(Icons.flatware_outlined, color: linearPrimary),
                SizedBox(width: 6),
                Text('zeroWaste Chef App', style: TextStyle(fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Items that you have😁", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: allIngredients.map((ingredient) {
                      final isSelected = _selectedIngredients.contains(ingredient);
                      return ChoiceChip(
                        label: Text(ingredient),
                        selected: isSelected,
                        onSelected: (_) => _onIngredientSelected(ingredient),
                        backgroundColor: isSelected ? linearPrimary : linearGrey,
                        shape: StadiumBorder(
                          side: isSelected ? BorderSide.none : BorderSide(color: linearBorder),
                        ),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.black : Colors.white70,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),

                        pressElevation: 0,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text("Receipes you can make😊", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: _filteredRecipes.isNotEmpty
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: RecipeListItem(recipe: _filteredRecipes[index]),
                        );
                      },
                      childCount: _filteredRecipes.length,
                    ),
                  )
                : const SliverToBoxAdapter(child: EmptyState()),
          ),
        ],
      ),
    );
  }
}