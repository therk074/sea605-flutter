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

  test('saveUserData should successfully commit the payload to the mocked database', () async {
    // 1. Arrange: Instantiate Fake Firestore and UserService with no pre-seeded data
    final fakeFirestore = FakeFirebaseFirestore();
    final userService = UserService(fakeFirestore);
    final String targetUserId = 'user456';
    final Map<String, dynamic> payload = {
      'name': 'VV_std VI',
      'email': 'vvlabcode2@gmail.com',
    };

    // 2. Act: Invoke saveUserData to persist the payload to the mocked database
    await userService.saveUserData(targetUserId, payload);

    // 3. Assert: Directly query Fake Firestore to confirm the document was committed
    final snapshot = await fakeFirestore.collection('users').doc(targetUserId).get();

    expect(snapshot.exists, isTrue);
    expect(snapshot.data()?['name'], 'VV_std VI');
    expect(snapshot.data()?['email'], 'vvlabcode2@gmail.com');
  });
}
