import 'package:flutter/cupertino.dart';

class Contato {
  final String nome;
  final int numeroDaConta;

  Contato(this.nome, this.numeroDaConta);
  @override
  String toString() {
    return 'Nome: {valor: $nome, conta: $numeroDaConta}';
  }
}
