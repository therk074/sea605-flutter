import 'package:flutter_test/flutter_test.dart'; // Core testing library
import 'package:mockito/mockito.dart'; // Provides mocking capabilities
import 'package:mockito/annotations.dart'; // Provides the @GenerateMocks annotation
import 'package:http/http.dart' as http; // The HTTP package we are mocking
import 'package:flutter_application_1/weather_service.dart'; // The target service to be tested

// @GenerateMocks tells the build_runner to generate a mock class for http.Client.
// The generated file will be named 'weather_service_test.mocks.dart'.
@GenerateMocks([http.Client])
import 'weather_service_test.mocks.dart'; // Import the auto-generated mock file

void main() {
  test('fetchWeather should return a Weather object if the HTTP call completes with 200', () async {
    // 1. Arrange: Instantiate the automatically generated Mock object
    final client = MockClient();
    
    // Stubbing: Define the expected behavior when the specific URL is called.
    // We use thenAnswer instead of thenReturn because HTTP requests return a Future (asynchronous).
    when(client.get(Uri.parse('[https://api.weather.com/data](https://api.weather.com/data)')))
        .thenAnswer((_) async => http.Response('{"temp": 25}', 200));
        
    // Dependency Injection: Pass the mock client into our WeatherService
    final weatherService = WeatherService(client);

    // 2. Act: Call the method being tested
    final weather = await weatherService.fetchWeather();

    // 3. Assert: Verify the results match our expected JSON response
    expect(weather.temp, 25);
  });

  // Test Case: Server Malfunction Scenario (Server Lapse — 404 Not Found)
  test('fetchWeather should throw an Exception if the HTTP call completes with 404', () async {
    // 1. Arrange: Instantiate the automatically generated Mock object
    final client = MockClient();

    // Stubbing: Configure the mock to simulate a server malfunction by returning a 404 response
    when(client.get(Uri.parse('[https://api.weather.com/data](https://api.weather.com/data)')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    // Dependency Injection: Pass the mock client into our WeatherService
    final weatherService = WeatherService(client);

    // 2. Act & Assert: Verify that a 404 response causes fetchWeather to throw an Exception
    expect(
      () async => await weatherService.fetchWeather(),
      throwsException,
    );
  });
}
