import 'package:bytebankapp/models/contatos.dart';
import 'package:flutter/material.dart';

class contactsForm extends StatefulWidget {
  const contactsForm({Key? key}) : super(key: key);

  @override
  _contactsFormState createState() {
    return _contactsFormState();
  }
}

class _contactsFormState extends State<contactsForm> {
  final TextEditingController _nameEditingController = TextEditingController();

  final TextEditingController _contaEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Formulário de entrada de dados container scaffold
    return Scaffold(
      // app bar navegacao e título
      appBar: AppBar(
        title: Text('Form de Cadastro'),
      ),
      // Column para conteúdo
      // column precisa de children
      body: Padding(
        // Padding (Margem da página)
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Textfield para entrada de dados
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nameEditingController,
                // Define o título do campo
                decoration: InputDecoration(labelText: 'Nome'),
                // Define o tamanho da fonte
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _contaEditingController,
                // Define o título do campo
                decoration: InputDecoration(labelText: 'Numero da Conta'),
                // Define o tamanho da fonte
                style: TextStyle(fontSize: 24),
                // Define o teclado numerico
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    // Precisamos buscar os valores dos campos
                    final String _nome = _nameEditingController.text;
                    // solução para checagem de int no campo text.
                    // IMPORTANTE
                    final String _conta_text = _contaEditingController.text;
                    int _conta = int.tryParse(_conta_text) != null
                        ? int.parse(_conta_text)
                        : 0;
                    // agora sim executar o processamento
                    final Contato novoContato = Contato(_nome, _conta);
                    // e navegamos para fora
                    Navigator.pop(context, novoContato);
                  },
                  child: const Text('Cadastrar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
