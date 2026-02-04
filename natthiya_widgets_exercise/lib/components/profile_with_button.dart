import 'package:flutter/material.dart';

class ProfileWithButton extends StatelessWidget {
  const ProfileWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Header Information
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  'Taylor Swift',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary, // Keep original color
                  ),
                ),
                Text(
                  '663040114-3',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                     fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 150),

          // Profile Image
          Container(
             width: double.infinity,
             height: 300, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Image.asset(
              'assets/images/taylor.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 300,
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 60),

          // Photo Credit Information
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Text(
                  'Photo Credit: KKU Library',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
                const SizedBox(height: 30),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    _showConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    foregroundColor: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 12,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 30,),

                  ),
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text(
            'Submitting Information',
          ), // Exact text from screenshot
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss dialog
                // Add any other submission logic here
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
