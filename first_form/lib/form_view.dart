import 'package:first_form/text_form_widget.dart';
import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  FormView({Key key}) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
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
                    },
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
                    },
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
                      _formKey.currentState.save();
                      if (_isValid) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Validação'),
                              content: Text(
                                  'Muito bem, $actualName $actualLastName.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
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
