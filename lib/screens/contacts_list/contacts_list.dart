import 'package:bytebankapp/models/contatos.dart';
import 'package:bytebankapp/screens/forms/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<Contato> contatos = [];

  @override
  Widget build(BuildContext context) {
    contatos.add(Contato(1, 'Alex', 1));
    // container da Estrutura da Página
    return Scaffold(
      // Adiciona a barra de título da Página
      appBar: AppBar(
        // Titulo do AppBar
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contato contato = contatos[index];
          return _ContactItem(contato);
        },
        itemCount: contatos.length,
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
