import 'package:flutter_test/flutter_test.dart'; // Core Flutter testing library
import 'package:flutter_application_1/calculator.dart'; // Target class to be tested

// The main entry point for the test script execution
void main() {
  // The 'test' function defines a single test case with a description of expected behavior
  test('applyDiscount should calculate the discounted price correctly (Happy Path)', () {
    // 1. Arrange: Initialize the object under test and define input parameters
    final calculator = Calculator();
    final double originalPrice = 100.0;
    final double discountPercentage = 20.0;
    
    // 2. Act: Execute the specific method being tested
    final result = calculator.applyDiscount(originalPrice, discountPercentage);
    
    // 3. Assert: Verify that the actual result matches the expected outcome (100 - 20% = 80.0)
    final expected = 80.0;

    if(result == expected){
      print('Test Pass: The actual result ($result) matches the expectation');
    }else{
      print('Test Fail: The actual result ($result) does not match the expectation');
    }
  });

  // Test Block: Error Handling (Edge Cases)
  group('applyDiscount error handling (Edge Cases)', () {
    // 1. Arrange: Initialize the object under test
    final calculator = Calculator();

    test('should throw ArgumentError when a negative price is provided', () {
      // 2. Act & Assert: A negative price must trigger an ArgumentError
      expect(
        () => calculator.applyDiscount(-50.0, 10.0),
        throwsArgumentError,
      );
    });

    test('should throw ArgumentError when a negative discount is provided', () {
      // 2. Act & Assert: A negative discount must trigger an ArgumentError
      expect(
        () => calculator.applyDiscount(100.0, -10.0),
        throwsArgumentError,
      );
    });

    test('should throw ArgumentError when both price and discount are negative', () {
      // 2. Act & Assert: Both values being negative must trigger an ArgumentError
      expect(
        () => calculator.applyDiscount(-100.0, -10.0),
        throwsArgumentError,
      );
    });
  });
}
