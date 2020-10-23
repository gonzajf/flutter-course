import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todoApp/services/auth.dart';

class MockUser extends Mock implements User {}

final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  Stream<User> authStateChanges() {
    return Stream.fromIterable([_mockUser]);
  }
}

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final Auth auth = Auth(mockFirebaseAuth);
  setUp(() {});
  tearDown(() {});

  test("emit occurs", () async {
    expectLater(auth.user, emitsInOrder([_mockUser]));
  });

  test("create account", () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: "gonza@mail.com", password: "123456"))
        .thenAnswer((realInvocation) => null);

    expect(
        await auth.createAccount(email: "gonza@mail.com", password: "123456"),
        "Success");
  });
}
