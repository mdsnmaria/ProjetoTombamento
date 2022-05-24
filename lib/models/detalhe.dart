import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detalhe extends StatelessWidget {
  final String? nome;
  final String? descricao;
  final String? local;
  final String? responsavel;
  final String? predio;
  final String? bloco;
  final String? andar;
  final String? cpf;
  final String? cargo;
  final String? estado;
  final String? situacao;
  final String? data;

  Detalhe(
      {this.local,
        this.predio,
        this.bloco,
        this.andar,
        this.responsavel,
        this.cpf,
        this.cargo,
        this.nome,
        this.descricao,
        this.estado,
        this.situacao,
        this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$nome")),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Local: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$local", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Predio: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$predio", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Bloco: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$bloco", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Andar: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$andar", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Responsável: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$responsavel", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("CPF: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$cpf", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Cargo: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$cargo", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Nome: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$nome", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Descrição: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$descricao", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Estado: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$estado", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Situação: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$situacao", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text("Data: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                    Text("$data", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.black)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
