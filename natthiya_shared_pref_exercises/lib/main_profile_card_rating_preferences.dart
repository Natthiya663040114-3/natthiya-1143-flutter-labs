import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize SharedPreferences with an allow list for the rating key
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'user_rating'},
    ),
  );

  runApp(ProfileCardRatingApp(prefs: prefs));
}

class ProfileCardRatingApp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;

  const ProfileCardRatingApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Rating',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: ProfileCardScreen(prefs: prefs),
    );
  }
}

class ProfileCardScreen extends StatefulWidget {
  final SharedPreferencesWithCache prefs;

  const ProfileCardScreen({super.key, required this.prefs});

  @override
  State<ProfileCardScreen> createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  int _rating = 0; // Default rating

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  // Load the persisted rating
  void _loadRating() {
    setState(() {
      _rating = widget.prefs.getInt('user_rating') ?? 0;
    });
  }

  // Save the new rating
  Future<void> _updateRating(int newRating) async {
    setState(() {
      _rating = newRating;
    });
    await widget.prefs.setInt('user_rating', newRating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Rating'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: orientation == Orientation.portrait
                ? _buildPortraitLayout()
                : _buildLandscapeLayout(),
          );
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildProfileImage(),
          const SizedBox(height: 20),
          _buildProfileDetails(),
          const SizedBox(height: 20),
          _buildRatingSection(),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileImage(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileDetails(),
               const SizedBox(height: 20),
              _buildRatingSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return const CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage('https://picsum.photos/200'),
      // Fallback if network image fails or while loading
      child: Icon(Icons.person, size: 80), 
    );
  }

  Widget _buildProfileDetails() {
    return Column(
      children: [
        Text(
          'Natthiya C.',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Column(
      children: [
        Text(
          'Rate this profile:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return IconButton(
              iconSize: 40,
              icon: Icon(
                index < _rating ? Icons.star : Icons.star_border,
                color: index < _rating ? Colors.amber : Colors.grey,
              ),
              onPressed: () => _updateRating(index + 1),
            );
          }),
        ),
        const SizedBox(height: 10),
        Text(
          'Rating: $_rating / 5',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
