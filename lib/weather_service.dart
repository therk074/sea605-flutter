import 'dart:convert'; // Core library for JSON encoding and decoding
import 'package:http/http.dart' as http; // Library for making HTTP requests

// Data Model representing the weather information
class Weather {
  final int temp; // Stores the temperature value
  Weather({required this.temp});
}

// Service layer responsible for external API communications
class WeatherService {
  // Dependency Injection: The HTTP client is passed via the constructor
  final http.Client client; 
  WeatherService(this.client);

  // Asynchronous function to fetch weather data from the remote server
  Future<Weather> fetchWeather() async {
    // Executes an HTTP GET request to the specified endpoint
    final response = await client.get(Uri.parse('[https://api.weather.com/data](https://api.weather.com/data)'));
    
    // Validates the HTTP status code (200 indicates a successful request)
    if (response.statusCode == 200) {
      // Parses the JSON string response into a Dart Map
      final jsonMap = jsonDecode(response.body);
      
      // Maps the parsed data to the Weather object and returns it
      return Weather(temp: jsonMap['temp']);
    } else {
      // Throws an Exception if the server responds with an error (e.g., 404, 500)
      throw Exception('Failed to load weather');
    }
  }
}
