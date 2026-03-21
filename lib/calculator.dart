class Calculator {
  // Method to calculate the final price after applying a discount percentage
  double applyDiscount(double price, double discount) {
    // Guard clause: ensure neither price nor discount is a negative value
    if (price < 0 || discount < 0) throw ArgumentError();
    
    // Calculate and return the discounted price
    return price - (price * discount / 100);
  }
}
