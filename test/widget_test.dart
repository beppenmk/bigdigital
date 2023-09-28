// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bigdigital/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bigdigital/main.dart';

void main() {
  group('UserEntity Tests', () {
    test('Creazione di un nuovo utente', () {
      final user = UserEntity(name: 'Mario Rossi', email: 'mario@example.com', phone: '123-456-7890');
      expect(user.name, 'Mario Rossi');
      expect(user.email, 'mario@example.com');
      expect(user.phone, '123-456-7890');
    });

    test('Copia di un utente', () {
      final user = UserEntity(name: 'Mario Rossi', email: 'mario@example.com', phone: '123-456-7890');
      final updatedUser = user.copyWith(name: 'Luigi Verdi');
      expect(updatedUser.name, 'Luigi Verdi');
      expect(updatedUser.email, 'mario@example.com');
      expect(updatedUser.phone, '123-456-7890');
    });

    test('Test di uguaglianza', () {
      final user1 = UserEntity(name: 'Mario Rossi', email: 'mario@example.com', phone: '123-456-7890');
      final user2 = UserEntity(name: 'Mario Rossi', email: 'mario@example.com', phone: '123-456-7890');
      final user3 = UserEntity(name: 'Luigi Verdi', email: 'luigi@example.com', phone: '555-555-5555');

      expect(user1, equals(user2));
      expect(user1, isNot(equals(user3)));
    });
  });
}
