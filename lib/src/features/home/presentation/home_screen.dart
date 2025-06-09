import 'package:flutter/material.dart';
import 'package:cercle_mystique/src/common_widgets/theme_toggle_button.dart';
import 'package:cercle_mystique/src/app/theme/app_spacing.dart'; // Import AppSpacing

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          ThemeToggleButton(),
        ],
      ),
      body: Padding( // Use screen padding
        padding: AppSpacing.screenPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card( // Use CardTheme
                child: Padding(
                  padding: AppSpacing.cardPadding, // Use card padding
                  child: Text(
                    'This is a themed card!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              AppSpacing.gapVlg, // Use vertical spacing
              ElevatedButton( // Use ElevatedButtonTheme
                onPressed: () {},
                child: const Text('Themed Button'),
              ),
              AppSpacing.gapVmd,
              Text(
                'Home Screen - Theme Test',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
