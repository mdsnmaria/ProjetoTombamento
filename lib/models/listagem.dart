import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetotomb/models/atualiza%C3%A7%C3%A3o.dart';
import 'package:projetotomb/models/cadastro_bens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projetotomb/models/detalhe.dart';

class Listagem extends StatefulWidget {
  @override
  _ListagemState createState() => _ListagemState();

  const Listagem({Key? key}) : super(key: key);
}

class _ListagemState extends State<Listagem> {
  @override
  Widget build(BuildContext context) {
    var snapchots =
        FirebaseFirestore.instance.collection('Tombamento').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tombamento"),
        backgroundColor: Color.fromARGB(255, 54, 216, 244),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Cadastro_bens()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 54, 216, 244),
      ),
      body: StreamBuilder(
        stream: snapchots,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.length == 0) {
            return Center(child: Text('Não há Tombamentos cadastrados'));
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int i) {
              var item = snapshot.data!.docs[i];
              return Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(13, 0, 223, 243),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(2),
                child: ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    child: Text(
                      item['nome'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 8.0),
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  title: Text(item['nome']),
                  subtitle: Text(item['descrição']),
                  trailing: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Atualiza_bens(
                                    local: item['local'],
                                    predio: item['predio'],
                                    bloco: item['bloco'],
                                    andar: item['andar'],
                                    responsavel: item['responsavel'],
                                    cpf: item['cpf'],
                                    cargo: item['cargo'],
                                    item: item)));
                          },
                          icon: Icon(Icons.edit),
                          color: Color.fromARGB(129, 62, 141, 161),

                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Deseja realmente excluir esse Tombamento?"),
                                    actions: <Widget> [
                                      FlatButton(onPressed: (){
                                        item.reference.delete();
                                        Navigator.pop(context);
                                      }, child: Text('Excluir'),
                                      ),
                                      FlatButton(onPressed: ()=> Navigator.pop(context),
                                          child: Text('Cancelar')),
                                    ],

                                  );
                                });
                          },
                          icon: Icon(Icons.delete),
                          color: Color.fromARGB(129, 62, 141, 161),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Detalhe(
                                      local: item['local'],
                                      predio: item['predio'],
                                      bloco: item['bloco'],
                                      andar: item['andar'],
                                      responsavel: item['responsavel'],
                                      cpf: item['cpf'],
                                      cargo: item['cargo'],
                                      nome: item['nome'],
                                      descricao: item['descrição'],
                                      estado: item['estado'],
                                      situacao: item['situação'],
                                      data: item['data'],
                                    )));
                          },
                          icon: Icon(Icons.visibility),
                          color: Color.fromARGB(129, 62, 141, 161),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
