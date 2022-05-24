import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'listagem.dart';

enum Selecao { cadeira, mesa, patrileira, ventilador }

class Atualiza_bens extends StatefulWidget {
  final String? local;
  final String? predio;
  final String? bloco;
  final String? andar;
  final String? responsavel;
  final String? cpf;
  final String? cargo;
  QueryDocumentSnapshot? item;

  Atualiza_bens({
    this.local,
    this.predio,
    this.bloco,
    this.andar,
    this.responsavel,
    this.cpf,
    this.cargo,
    this.item
  });

  @override
  _Atualiza_bens1 createState() => _Atualiza_bens1();
}

class _Atualiza_bens1 extends State<Atualiza_bens> {
  final _formKey = GlobalKey<FormState>();
  final valorDrop = ValueNotifier('');
  final responsavel = TextEditingController();
  final local = TextEditingController();
  final predio = TextEditingController();
  final bloco = TextEditingController();
  final andar = TextEditingController();
  final cpf = TextEditingController();
  final cargo = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.local.text = widget.local!;
    this.predio.text = widget.predio!;
    this.bloco.text = widget.bloco!;
    this.andar.text = widget.andar!;
    this.responsavel.text = widget.responsavel!;
    this.cpf.text = widget.cpf!;
    this.cargo.text = widget.cargo!;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ATUALIZAÇÃO DE BENS'),
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
              ElevatedButton(
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                //textColor: Colors.white,
                //color: Theme.of(context).primaryColor,
                onPressed: () async {
                  widget.item?.reference.update({
                    'local': local.text,
                    'responsavel': responsavel.text,
                    'cpf': cpf.text,
                    'cargo': cargo.text,
                    'predio': predio.text,
                    'bloco': bloco.text,
                    'andar': andar.text,
                  });

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Listagem()));
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
