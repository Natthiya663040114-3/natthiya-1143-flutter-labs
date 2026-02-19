import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Must be called before any async code in main
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferencesWithCache with allowList
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'savedUsername', 'savedPassword'},
    ),
  );

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login SharedPreferences',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // Supports both light/dark mode automatically
      home: LoginPage(prefs: prefs),
    );
  }
}

class LoginPage extends StatefulWidget {
  final SharedPreferencesWithCache prefs;

  const LoginPage({super.key, required this.prefs});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for TextFields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedInfo(); // Load saved data immediately when Widget is created
  }

  // Load data from SharedPreferences
  void _loadSavedInfo() {
    final savedUsername = widget.prefs.getString('savedUsername') ?? '';
    final savedPassword = widget.prefs.getString('savedPassword') ?? '';

    setState(() {
      _usernameController.text = savedUsername;
      _passwordController.text = savedPassword;
    });
  }

  // Save data when Login is pressed
  Future<void> _saveInfo() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Save to SharedPreferences
    await widget.prefs.setString('savedUsername', username);
    await widget.prefs.setString('savedPassword', password);

    // Show SnackBar
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Saved -> username: $username'),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Clean up memory when Widget is destroyed
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Using Shared Preferences With Cache'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Username Field
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),

            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true, // Hide characters
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 32),

            // Login Button
            ElevatedButton(
              onPressed: _saveInfo,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
