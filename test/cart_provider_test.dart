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

  // Test Block: removeItem() deletion logic and negative value prevention
  group('removeItem deletion logic and negative value prevention', () {
    test('Item count should decrement by 1 when removeItem is invoked', () {
      // 1. Arrange: Start with one item in the cart
      final cart = CartProvider();
      cart.addItem();

      // 2. Act: Remove the item
      cart.removeItem();

      // 3. Assert: Item count should be back to zero
      expect(cart.itemCount, 0);
    });

    test('Item count should not drop below zero when removeItem is called on an empty cart', () {
      // 1. Arrange: Cart starts empty (itemCount == 0)
      final cart = CartProvider();

      // 2. Act: Attempt to remove an item from an already empty cart
      cart.removeItem();

      // 3. Assert: Item count must remain at zero, never negative
      expect(cart.itemCount, 0);
    });

    test('Item count should reflect correct value after multiple add and remove operations', () {
      // 1. Arrange: Build up the cart
      final cart = CartProvider();
      cart.addItem();
      cart.addItem();
      cart.addItem();

      // 2. Act: Remove two items
      cart.removeItem();
      cart.removeItem();

      // 3. Assert: One item should remain
      expect(cart.itemCount, 1);
    });
  });
}
