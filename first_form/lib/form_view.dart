import 'package:first_form/form_controller.dart';
import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  FormView({Key key}) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  final controller = FormController();
  String actualName;
  String actualLastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 10.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nome',
                    ),
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                    onChanged: (input) {
                      actualName = input;
                      controller.updateName(actualName);
                    },
                    initialValue: controller.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Sobrenome',
                    ),
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                    onChanged: (input) {
                      actualLastName = input;
                      controller.updateSurname(actualLastName);
                    },
                    initialValue: controller.surname,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  ElevatedButton(
                    child: Text('Validar'),
                    onPressed: () {
                      final _isValid = _formKey.currentState.validate();
                      if (_isValid) {
                        controller.updateName(actualName);
                        controller.updateSurname(actualLastName);
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Validação'),
                              content: Text(
                                  'Deseja salvar \{$actualName $actualLastName\} como usuário ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    //controller.saveUser();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Sim'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                  FutureBuilder<String>(
                    future: controller.fullName,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data);
                      } else {
                        return Text('');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
