import 'package:cercle_mystique/src/features/home/presentation/home_screen.dart';
import 'package:cercle_mystique/src/features/splash/presentation/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cercle_mystique/main.dart';
import 'package:cercle_mystique/src/common_widgets/theme_toggle_button.dart'; // Import ThemeToggleButton

void main() {
  testWidgets('App smoke test - Splash and Home Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify that SplashScreen is shown first.
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('Cercle Mystique'), findsOneWidget); // Text on splash

    // Wait for splash screen animation to complete (3s) and navigation to occur.
    // Add a little buffer.
    await tester.pumpAndSettle(const Duration(milliseconds: 3500));

    // Verify that HomeScreen is now shown.
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Home Screen - Theme Test'), findsOneWidget);

    // Verify ThemeToggleButton is present
    expect(find.byType(ThemeToggleButton), findsOneWidget);
  });
}
