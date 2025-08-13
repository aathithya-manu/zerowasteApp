// lib/widgets/recipe_list_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/recipe_model.dart';
import '../screens/recipe_detail_screen.dart'; // Import the new detail screen
import 'package:google_fonts/google_fonts.dart';

class RecipeListItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeListItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipe: recipe),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(153, 158, 158, 158),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.transparent, width: 1.5),
        ),
        child: Row(
          children: [
            // Hero widget enables the image transition animation
            Hero(
              tag: 'recipe-image-${recipe.name}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(
                  recipe.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Ingredients: ${recipe.ingredients.join(', ')}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white54),
          ],
        ),
      ),
    )
    // Add a subtle fade-in and slide-up animation to each list item
    .animate()
    .fadeIn(duration: 500.ms)
    .slideY(begin: 0.2, end: 0, curve: Curves.easeOut);
  }
}