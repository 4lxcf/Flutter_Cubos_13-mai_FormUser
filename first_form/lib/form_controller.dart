import 'package:first_form/form_model.dart';

class FormController {
  final model = FormModel();

  String get name => model.name;
  String get surname => model.surname;
  Future<String> get fullName => model.getFullName();

  void updateName(String name) {
    model.name = name;
    model.saveUser();
  }

  void updateSurname(String surname) {
    model.surname = surname;
    model.saveUser();
  }

  // void saveUser() {
  //   model.saveUser();
  // }
}
