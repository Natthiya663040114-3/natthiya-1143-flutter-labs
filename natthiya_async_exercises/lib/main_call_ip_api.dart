import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  await fetchIPAddress();
}

Future<void> fetchIPAddress() async {
  final url = Uri.parse('https://api.ipify.org?format=json');
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('Your public IP address is: ${data['ip']}');
    } else {
       print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
     print('An error occurred: $e');
  }
}
