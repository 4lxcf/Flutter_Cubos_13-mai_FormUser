// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:first_form/form_model.dart';
import 'package:first_form/internal_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InternalStorage', () {
    test('is not null?', () {
      //PREP
      final model =
          FormModel(internalStorageAdapter: MockInternalStorageAdapter());
      model.name = 'Nome';
      model.surname = 'Sobrenome';
      //METHOD
      model.saveUser();
      model.getFullName();
      //EXPECT
      expect(
        model.name,
        isNotEmpty,
      );
      expect(
        model.surname,
        isNotEmpty,
      );
    });
  });
}

class MockInternalStorageAdapter extends InternalStorageAdapter {
  String userName;
  String userSurname;

  void saveUser(String name, String surname) {
    userName = name;
    userSurname = surname;
  }

  Future<String> getFullName() {
    if ((userName != null) && (userSurname != null)) {
      return Future.value(userName + ' ' + userSurname);
    } else {
      return Future.value('Sem Usuario.');
    }
  }
}
