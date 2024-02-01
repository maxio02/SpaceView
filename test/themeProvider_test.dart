import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_view/theme/themeProvider.dart';

void main() {
  test('ThemeProvider toggles themes correctly', () {
    // Arrange
    final themeProvider = ThemeProvider();
    final lightThemeColors = ThemeData.light().colorScheme;
    final darkThemeColors = ThemeData.dark().colorScheme;

    // Act
    // Initially, the theme is set to dark. Check if the colors match dark theme.
    expect(themeProvider.isDarkMode, true);

    // Toggle to light theme
    themeProvider.toggleTheme(false);

    // Assert
    // Check if the colors match light theme after toggling
    expect(themeProvider.isDarkMode, false);

    expect(
        themeProvider.themeMode == ThemeMode.light &&
            lightThemeColors == ThemeData.light().colorScheme,
        true);

    // Toggle back to dark theme
    themeProvider.toggleTheme(true);

    // Check if the colors match dark theme after toggling back
    expect(themeProvider.isDarkMode, true);

    expect(
        themeProvider.themeMode == ThemeMode.dark &&
            darkThemeColors == ThemeData.dark().colorScheme,
        true);
  });
}
