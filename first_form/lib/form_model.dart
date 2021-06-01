import 'package:first_form/internal_storage.dart';
import 'package:first_form/secure_storage_adapter.dart';
import 'package:first_form/shared_preferences_adapter.dart';

class FormModel {
  String name;
  String surname;
  final InternalStorageAdapter internalStorage =
      InternalStorageAdapter ?? SharedPreferencesAdapter();

  FormModel({InternalStorageAdapter internalStorageAdapter});

  void saveUser() {
    if (name == null) return;
    if (surname == null) return;
    internalStorage.saveUser(name, surname);
  }

  Future<String> getFullName() {
    return internalStorage.getFullName();
  }
}
