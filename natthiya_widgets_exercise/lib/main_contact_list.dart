import 'package:flutter/material.dart';
import   'models/contact_model.dart';

void main() {
  runApp(ContactListScreen());
}

class ContactListScreen extends StatelessWidget {

  final List<Map<String, String>> _contacts = [
    {'name': 'John Doe', 'phoneNumber':"123-456-7890"},
    {'name': 'Jane Smith', 'phoneNumber':"098-765-4321"},
    {'name': 'AliceJohnson', 'phoneNumber':'555-555-5555'},
  ];

  ContactListScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Contacts',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system, // Follow system preference
      home: ContactListScreen(),
    );
  }
}