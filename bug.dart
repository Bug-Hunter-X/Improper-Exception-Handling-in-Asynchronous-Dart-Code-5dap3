```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, process the JSON response
      final jsonData = jsonDecode(response.body);
      // Accessing data (example)
      final name = jsonData['name'];
      print(name);
    } else {
      // Error handling for non-200 status codes
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during network requests or JSON decoding
    print('Error: $e');
    // Re-throw the exception to be handled higher up in the call stack if needed.
    rethrow;
  }
}
```