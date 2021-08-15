import 'package:bytebankapp/database/database.dart';
import 'package:bytebankapp/models/contatos.dart';
import 'package:bytebankapp/screens/forms/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // container da Estrutura da Página
    return Scaffold(
      // Adiciona a barra de título da Página
      appBar: AppBar(
        // Titulo do AppBar
        title: Text('Contatos'),
      ),
      // Contrução dinãmica da lista com base em Banco
      body: FutureBuilder<List<Contato>>(
        // A criação de listas tem que ser determinada como vazia agora.
        initialData: List.empty(),
        future: Future.delayed(Duration(seconds: 2)).then((value) => findAll()),
        builder: (context, snapshot) {
          // Verificar se a variável está ok antes do carregamento
          if (snapshot.data != null) {
            final List<Contato>? contacts = snapshot.data as List<Contato>;
            // Verificação obrigatória dos nulos
            if (contacts != null) {
              //feito if para validar nulo
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
            }
          }
          // Apresenta o Loading na tela
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Carregando"),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        //Codigo do floating Button Cuidar com os ( e {
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ContactsForm();
              },
            ),
          ).then((newContact) => debugPrint(
                newContact.toString(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contato contato;

  _ContactItem(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contato.numeroDaConta.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
