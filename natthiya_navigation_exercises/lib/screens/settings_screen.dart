/// settings_screen.dart
///
/// This file defines the Settings Screen for the user.
/// It uses ListTile and SwitchListTile widgets to display and edit user profile 
/// data, sound, vibration, and app theme settings using the Provider.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/quiz_preferences_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showNameDialog(BuildContext context, String field, String current) {
    final controller = TextEditingController(text: current);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit $field'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (field == 'Name') {
                context.read<QuizPreferencesState>().setUserName(controller.text.trim());
              } else {
                context.read<QuizPreferencesState>().setUserBio(controller.text.trim());
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/profile'),
        icon: const Icon(Icons.person),
        label: const Text('View Profile'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Profile',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Name'),
            subtitle: Text(prefs.userName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showNameDialog(context, 'Name', prefs.userName),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Bio'),
            subtitle: Text(prefs.userBio),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showNameDialog(context, 'Bio', prefs.userBio),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Sound & Feedback',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.volume_up),
            title: const Text('Sound Enabled'),
            subtitle: const Text('Play sounds when answering'),
            value: prefs.soundEnabled,
            onChanged: (val) => context.read<QuizPreferencesState>().setSoundEnabled(val),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.vibration),
            title: const Text('Vibration Enabled'),
            subtitle: const Text('Vibrate on correct/wrong answers'),
            value: prefs.vibrationEnabled,
            onChanged: (val) => context.read<QuizPreferencesState>().setVibrationEnabled(val),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Theme',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Default'),
            value: ThemeMode.system,
            groupValue: prefs.themeMode,
            onChanged: (val) {
              if (val != null) context.read<QuizPreferencesState>().setThemeMode(val);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: prefs.themeMode,
            onChanged: (val) {
              if (val != null) context.read<QuizPreferencesState>().setThemeMode(val);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: prefs.themeMode,
            onChanged: (val) {
              if (val != null) context.read<QuizPreferencesState>().setThemeMode(val);
            },
          ),
          const SizedBox(height: 80), // To prevent FAB overlapping content
        ],
      ),
    );
  }
}
