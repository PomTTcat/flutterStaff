import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final appLightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Color(0xFFF0F0F0),
    ),
    scrolledUnderElevation: 0.0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Color(0xFFF0F0F0),
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Color(0xFFF9FBFB),
      systemNavigationBarColor: Color(0xFFF9FBFB),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFF2193B0),
    unselectedLabelColor: Color(0xFFCCCCCC),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xFF2193B0), width: 3.0),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Color(0xFFE8ECEA),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF5F5F5),
    selectedItemColor: Color(0xFF2193B0),
    unselectedItemColor: Color(0xFFCCCCCC),
    selectedIconTheme: IconThemeData(color: Color(0xFF2193B0)),
    unselectedIconTheme: IconThemeData(color: Color(0xFFCCCCCC)),
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFF9FBFB),
    onSurface: Color(0xFF4D4D4D),
    primary: Color(0xFF2193B0),
    secondary: Color(0xFF27A742),
    onTertiary: Color(0xFFB2B2B2),
    tertiaryContainer: Color(0xFFF5F6F6),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF2193B0);
      }
      return const Color(0xFFCCCCCC);
    }),
    thumbColor: WidgetStateProperty.all(const Color(0xFFF5F5F5)),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF2193B0);
      }
      return const Color(0xFFCCCCCC);
    }),
  ),
  cardTheme: const CardTheme(color: Color(0xFFF5F5F5)),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF2193B0);
        }
        return const Color(0xFFB2B2B2);
      },
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF2193B0);
        }
        return const Color(0xFFF5F5F5);
      },
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF4D4D4D)),
    titleMedium: TextStyle(fontSize: 16, color: Color(0xFF4D4D4D)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
    ),
    filled: true,
    fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFFF5F5F5);
      }
      if (states.contains(WidgetState.error)) {
        return const Color(0xFFFFF7F7);
      }
      if (states.contains(WidgetState.disabled)) {
        return const Color(0xFFEFEFEF);
      }
      return const Color(0xFFF5F5F5);
    }),
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
    ),
    hintStyle: const TextStyle(color: Color(0xFFCCCCCC)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFE65151)),
    ),
    errorMaxLines: 3,
    errorStyle: const TextStyle(
      color: Color(0xFFE65151),
      overflow: TextOverflow.visible,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFE65151)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFF2193B0)),
    ),
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: Color(0xFF2193B0)),
);

final appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  dividerTheme: const DividerThemeData(color: Color(0xFF666666)),
  canvasColor: const Color(0xFF2A2A2A),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Color(0xFFE0E0E0),
    ),
    scrolledUnderElevation: 0.0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Color(0xFFE0E0E0),
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color(0xFF1A1A1A),
      systemNavigationBarColor: Color(0xFF2A2A2A),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFF00C770),
    unselectedLabelColor: Color(0xFFAAAAAA),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xFF00C770), width: 3.0),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Color(0xFF666666),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF2A2A2A),
    selectedItemColor: Color(0xFFE0E0E0),
    unselectedItemColor: Color(0xFFAAAAAA),
    selectedIconTheme: IconThemeData(color: Color(0xFF00C770)),
    unselectedIconTheme: IconThemeData(color: Color(0xFFAAAAAA)),
  ),
  scaffoldBackgroundColor: const Color(0xFF1A1A1A),
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF2A2A2A),
    onSurface: Color(0xFFE0E0E0),
    primary: Color(0xFF00C770),
    secondary: Color(0xFF35DB00),
    onTertiary: Color(0xFFAAAAAA),
    tertiaryContainer: Color(0xFF888888),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF00C770);
      }
      return const Color(0xFF888888);
    }),
    thumbColor: WidgetStateProperty.all(const Color(0xFFE0E0E0)),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF00C770);
      }
      return const Color(0xFF888888);
    }),
  ),
  cardTheme: const CardTheme(color: Color(0xFF2A2A2A)),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF00C770);
        }
        return const Color(0xFF888888);
      },
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF00C770);
        }
        return const Color(0xFFE0E0E0);
      },
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, color: Color(0xFFE0E0E0)),
    titleMedium: TextStyle(fontSize: 16, color: Color(0xFFE0E0E0)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFF666666)),
    ),
    filled: true,
    fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFF2A2A2A);
      }
      if (states.contains(WidgetState.error)) {
        return const Color(0xFF111111);
      }
      if (states.contains(WidgetState.disabled)) {
        return Colors.transparent;
      }
      return const Color(0xFF2A2A2A);
    }),
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFF666666)),
    ),
    hintStyle: const TextStyle(color: Color(0xFFAAAAAA)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFF15555)),
    ),
    errorMaxLines: 3,
    errorStyle: const TextStyle(
      color: Color(0xFFF15555),
      overflow: TextOverflow.visible,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFF15555)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: Color(0xFF00C770)),
);
