import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'listagem.dart';


class Cadastro_bens extends StatefulWidget {
  @override
  _Cadastro_bens1 createState() => _Cadastro_bens1();
}

class _Cadastro_bens1 extends State<Cadastro_bens> {
  final _formKey = GlobalKey<FormState>();
  final valorDrop = ValueNotifier('');
  final nome = TextEditingController();
  final descricao = TextEditingController();
  final responsavel = TextEditingController();
  final local = TextEditingController();
  final predio = TextEditingController();
  final bloco = TextEditingController();
  final andar = TextEditingController();
  final cpf = TextEditingController();
  final cargo = TextEditingController();
  final estado = TextEditingController();
  final situacao = TextEditingController();
  final data = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CADASTRO DE BENS'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: ("Localização"),
              ),
              Tab(
                text: ("Responsável"),
              ),
              Tab(
                text: ("Bem"),
              ),
            ],
          ),
        ),
        body: TabBarView(
            //physics: NeverScrollableScrollPhysics(),
            children: [
              ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "Local"),
                  controller: local,
                  validator: (text) {
                    if (text!.isEmpty) return "nome inválido!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Predio"),
                  controller: predio,
                  validator: (text) {
                    if (text!.isEmpty) return "predio inválido!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Bloco"),
                  controller: bloco,
                  validator: (text) {
                    if (text!.isEmpty) return "bloco inválido!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Andar"),
                  controller: andar,
                  validator: (text) {
                    if (text!.isEmpty) return "andar inválido!";
                  },
                ),
              ]),
              ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "Nome"),
                  controller: responsavel,
                  validator: (text) {
                    if (text!.isEmpty) return "nome inválido!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "CPF"),
                  controller: cpf,
                  validator: (text) {
                    if (text!.isEmpty) return "cpf inválido!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Cargo"),
                  controller: cargo,
                  validator: (text) {
                    if (text!.isEmpty) return "cargo inválido!";
                  },
                ),
              ]),
              Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(hintText: "Nome"),
                      controller: nome,
                      validator: (text) {
                        if (text!.isEmpty) return "Nome inválido!";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Descrição"),
                      controller: descricao,
                      validator: (text) {
                        if (text!.isEmpty) return "Descrição inválido!";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Estado físico"),
                      controller: estado,
                      validator: (text) {
                        if (text!.isEmpty) return "estado inválido!";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Situação"),
                      controller: situacao,
                      validator: (text) {
                        if (text!.isEmpty) return "situação inválido!";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Data recebimento"),
                      controller: data,
                      validator: (text) {
                        if (text!.isEmpty) return "Recebimento inválido!";
                        return null;
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      //textColor: Colors.white,
                      //color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await FirebaseFirestore.instance
                              .collection('Tombamento')
                              .add({
                            'nome': nome.text,
                            'descrição': descricao.text,
                            'responsavel': responsavel.text,
                            'local': local.text,
                            'predio': predio.text,
                            'bloco': bloco.text,
                            'andar': andar.text,
                            'cpf': cpf.text,
                            'cargo': cargo.text,
                            'estado': estado.text,
                            'situação': situacao.text,
                            'data': data.text,
                          });
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Listagem()));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
