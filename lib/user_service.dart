import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  // Dependency injection: providing a Firestore instance (real or mock) when creating the service
  final FirebaseFirestore firestore;

  UserService(this.firestore);

  // Method to fetch user data asynchronously, returning a Map or null if not found
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    // Queries the 'users' collection for a document matching the provided userId
    final doc = await firestore.collection('users').doc(userId).get();
    
    // Checks if the document actually exists in the database
    if (doc.exists) {
      // Returns the document payload as a Map
      return doc.data();
    }
    // Returns null if the user document is not found
    return null;
  }

  // Method to persist user data to the Firestore database
  Future<void> saveUserData(String userId, Map<String, dynamic> data) async {
    // Writes (or overwrites) the document at the given userId with the provided data payload
    await firestore.collection('users').doc(userId).set(data);
  }
}
