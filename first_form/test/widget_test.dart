// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:first_form/form_model.dart';
import 'package:first_form/internal_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('InternalStorage', () {
    test('is not null?', () {
      //PREP
      final model =
          FormModel(internalStorageAdapter: MockInternalStorageAdapter());
      //METHOD
      model.saveUser();
      //EXPECT
      expect(
        model.getFullName(),
        completion(isNotNull),
      );
    });
  });
}

class MockInternalStorageAdapter extends InternalStorageAdapter {
  void saveUser(String name, String surname) {}

  Future<String> getFullName() {
    final name = 'Alexandre';
    final surname = 'Ferreira';
    return Future.value(name + ' ' + surname);
  }
}
