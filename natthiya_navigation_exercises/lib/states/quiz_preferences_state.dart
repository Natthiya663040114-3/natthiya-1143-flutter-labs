/// quiz_preferences_state.dart
///
/// This class manages the state for user preferences, extending ChangeNotifier.
/// It stores and updates values such as userName, userBio, soundEnabled, 
/// vibrationEnabled, and themeMode. When values change, it calls notifyListeners() 
/// to automatically rebuild dependent UI widgets.
import 'package:flutter/material.dart';

class QuizPreferencesState extends ChangeNotifier {
  String userName       = 'Guest';
  String userBio        = 'Quiz Lover';
  bool   soundEnabled   = true;
  bool   vibrationEnabled = true;
  ThemeMode themeMode   = ThemeMode.system;

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  void setUserBio(String bio) {
    userBio = bio;
    notifyListeners();
  }

  void setSoundEnabled(bool enabled) {
    soundEnabled = enabled;
    notifyListeners();
  }

  void setVibrationEnabled(bool enabled) {
    vibrationEnabled = enabled;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}
