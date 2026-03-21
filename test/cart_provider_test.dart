import 'package:flutter_test/flutter_test.dart'; // Core testing library
import 'package:flutter_application_1/cart_provider.dart'; // Target class to be tested

// The entry point for the test execution
void main() {
  // Defines a specific test case with a descriptive expected behavior
  test('Item count should increment by 1 when addItem is invoked', () {
    // 1. Arrange: Instantiate the provider independently of the UI tree
    final cart = CartProvider();
    
    // 2. Act: Trigger the state-mutating method
    cart.addItem();
    
    // 3. Assert: Verify the internal state reflects the expected changes
    expect(cart.itemCount, 1);
  });
}
