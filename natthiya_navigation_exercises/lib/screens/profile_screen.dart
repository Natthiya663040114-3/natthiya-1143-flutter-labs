/// profile_screen.dart
///
/// This file bounds the User Profile Screen that displays data saved in the Provider.
/// It acts as a read-only view presenting the username, user initials, sound/vibration 
/// settings, and includes a button to navigate back to the Settings Screen for editing.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/quiz_preferences_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();
    final theme = Theme.of(context);

    // Provide a default letter if name is empty
    String userInitial = prefs.userName.isNotEmpty ? prefs.userName[0].toUpperCase() : '?';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                userInitial,
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              prefs.userName,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              prefs.userBio,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  avatar: Icon(prefs.soundEnabled ? Icons.volume_up : Icons.volume_off, size: 18),
                  label: Text(prefs.soundEnabled ? 'Sound On' : 'Sound Off'),
                ),
                const SizedBox(width: 16),
                Chip(
                  avatar: Icon(prefs.vibrationEnabled ? Icons.vibration : Icons.mobile_off, size: 18),
                  label: Text(prefs.vibrationEnabled ? 'Vibration On' : 'Vibration Off'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Chip(
              avatar: const Icon(Icons.palette, size: 18),
              label: Text('Theme: ${prefs.themeMode.name}'),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.settings),
              label: const Text('Edit Settings'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primaryContainer,
                foregroundColor: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
