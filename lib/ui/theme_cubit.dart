import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 有一个bug，修改颜色主题后，字体会重置为默认字体
class ThemeCubit extends Cubit<MyTheme> {
  ThemeCubit()
      : super(
          MyTheme(
              theme: ThemeData(useMaterial3: true, colorScheme: defaultLightColorScheme),
              darkTheme: ThemeData(useMaterial3: true, colorScheme: defaultDarkColorScheme),
              themeMode: ThemeMode.light),
        );

  void toggleDarkMode(bool darkMode) {
    var newState = state.copyWith(
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
    );
    emit(newState);
  }

  void setThemeColorSeed(Color colorSeed) {
    var newState = state.copyWith(
      theme: ThemeData(colorSchemeSeed: colorSeed, useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(colorSchemeSeed: colorSeed, useMaterial3: true, brightness: Brightness.dark),
    );
    emit(newState);
  }

  void setFont(String fontFamily) {
    var newState = state.copyWith(
        theme: ThemeData(
          fontFamily: fontFamily,
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: state.theme.colorScheme.primary,
        ),
        darkTheme: ThemeData(
          fontFamily: fontFamily,
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: state.theme.colorScheme.primary,
        ));
    emit(newState);
  }
}

class MyTheme {
  ThemeData theme;
  ThemeData darkTheme;
  ThemeMode themeMode;

  MyTheme({
    required this.theme,
    required this.darkTheme,
    required this.themeMode,
  });

  MyTheme copyWith({
    ThemeData? theme,
    ThemeData? darkTheme,
    ThemeMode? themeMode,
  }) {
    return MyTheme(
      theme: theme ?? this.theme,
      darkTheme: darkTheme ?? this.darkTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

const defaultLightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF00696D),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF6FF6FC),
  onPrimaryContainer: Color(0xFF002021),
  secondary: Color(0xFF4A6364),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCCE8E9),
  onSecondaryContainer: Color(0xFF041F20),
  tertiary: Color(0xFF4D5F7C),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD5E3FF),
  onTertiaryContainer: Color(0xFF071C36),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFDFC),
  onBackground: Color(0xFF191C1C),
  surface: Color(0xFFFAFDFC),
  onSurface: Color(0xFF191C1C),
  surfaceVariant: Color(0xFFDAE4E4),
  onSurfaceVariant: Color(0xFF3F4949),
  outline: Color(0xFF6F7979),
  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2D3131),
  inversePrimary: Color(0xFF4CD9DF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF00696D),
  outlineVariant: Color(0xFFBEC8C8),
  scrim: Color(0xFF000000),
);

const defaultDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF4CD9DF),
  onPrimary: Color(0xFF003739),
  primaryContainer: Color(0xFF004F52),
  onPrimaryContainer: Color(0xFF6FF6FC),
  secondary: Color(0xFFB1CCCD),
  onSecondary: Color(0xFF1B3436),
  secondaryContainer: Color(0xFF324B4C),
  onSecondaryContainer: Color(0xFFCCE8E9),
  tertiary: Color(0xFFB5C7E9),
  onTertiary: Color(0xFF1F314C),
  tertiaryContainer: Color(0xFF364764),
  onTertiaryContainer: Color(0xFFD5E3FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1C),
  onBackground: Color(0xFFE0E3E2),
  surface: Color(0xFF191C1C),
  onSurface: Color(0xFFE0E3E2),
  surfaceVariant: Color(0xFF3F4949),
  onSurfaceVariant: Color(0xFFBEC8C8),
  outline: Color(0xFF899393),
  onInverseSurface: Color(0xFF191C1C),
  inverseSurface: Color(0xFFE0E3E2),
  inversePrimary: Color(0xFF00696D),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4CD9DF),
  outlineVariant: Color(0xFF3F4949),
  scrim: Color(0xFF000000),
);
