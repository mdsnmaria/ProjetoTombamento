import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projetotomb/controles/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'listagem.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final login = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BEM VINDO"),
          centerTitle: true,
        ),
        body: Form(
          //return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                controller: login,
                decoration: InputDecoration(hintText: "email"),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                    if (text!.isEmpty || !text.contains("@"))
                      return "Email inválido!";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: senha,
                decoration: InputDecoration(hintText: "senha"),
                obscureText: true,
                validator: (text) {
                  if (text!.isEmpty || text.length < 6) return "Senha inválida";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 44.0,
                child: RaisedButton(
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    if (_formKey.currentState!.validate() && login.text=="tombamento@" && senha.text == "tombapp"){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Listagem()));

                    }
                  },
                ),
              ),
            ],
          ),
          //  );
          // },
        ));
  }
}
