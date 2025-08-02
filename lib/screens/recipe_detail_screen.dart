// lib/screens/recipe_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/recipe_model.dart';
import '../main.dart'; // Import color constants

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: linearBlack,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'recipe-image-${recipe.name}',
                child: Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                  // Add a subtle dark gradient overlay for better text contrast
                  color: Colors.black.withOpacity(0.3),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Ingredients Section
                  const Row(
                    children: [
                      Text('🥕', style: TextStyle(fontSize: 24)),
                      SizedBox(width: 8),
                      Text(
                        'Ingredients',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...recipe.ingredients.map((ingredient) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                        child: Text(
                          '•  ${ingredient[0].toUpperCase()}${ingredient.substring(1)}',
                          style: const TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      )),
                      
                  const SizedBox(height: 24),

                  // Instructions Section
                  const Row(
                    children: [
                      Text('📝', style: TextStyle(fontSize: 24)),
                      SizedBox(width: 8),
                      Text(
                        'Instructions',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      recipe.instructions,
                      style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).animate().fadeIn(duration: 300.ms),
    );
  }
}