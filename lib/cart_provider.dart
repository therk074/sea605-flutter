import 'package:flutter/foundation.dart';

// Extends ChangeNotifier to allow UI components to listen to state changes
class CartProvider extends ChangeNotifier {
  // Private state variable to ensure encapsulation
  int _itemCount = 0;
  
  // Public getter to safely expose the current state to the outside world
  int get itemCount => _itemCount;

  // Method to mutate the state
  void addItem() {
    _itemCount++; // Increment the private state variable
    
    // Crucial step: Broadcasts the state change to all listening UI widgets
    notifyListeners(); 
  }

  // Method to remove an item while enforcing a lower bound of zero
  void removeItem() {
    // Logical constraint: prevent item count from dropping below zero
    if (_itemCount > 0) {
      _itemCount--;
    }

    // Broadcast the state change to all listening UI widgets
    notifyListeners();
  }
}
