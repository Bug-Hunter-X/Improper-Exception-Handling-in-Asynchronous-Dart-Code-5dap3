```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final name = jsonData['name'];
      print(name);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
  } on FormatException catch (e) {
    print('Invalid JSON format: $e');
  } on Exception catch (e) {
    print('An unexpected error occurred: $e');
  } catch (e) {
    print('An unknown error occurred: $e');
  }
}
```