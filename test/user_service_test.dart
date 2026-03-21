import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_application_1/user_service.dart';

void main() {
  test('getUserData should retrieve and return user data correctly from Fake Firestore', () async {
    // 1. Arrange: Instantiate Fake object and perform Data Seeding
    final fakeFirestore = FakeFirebaseFirestore();
    
    await fakeFirestore.collection('users').doc('user123').set({
      'name': 'VV_std V',
      'email': 'vvlabcode@gmail.com',
    });

    final userService = UserService(fakeFirestore);
    final String targetUserId = 'user123';

    // 2. Act
    final userData = await userService.getUserData(targetUserId);

    // 3. Assert
    expect(userData, isNotNull);
    expect(userData?['name'], 'VV_std V');
    expect(userData?['email'], 'vvlabcode@gmail.com');
  });

  test('getUserData should return null if the document is not found in the database', () async {
    // 1. Arrange
    final fakeFirestore = FakeFirebaseFirestore();
    final userService = UserService(fakeFirestore);
    final String targetUserId = 'user999';

    // 2. Act
    final userData = await userService.getUserData(targetUserId);

    // 3. Assert
    expect(userData, isNull);
  });
}
