import 'package:bytebankapp/models/contatos.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'byteBank02.db');
  //byteBank.db é o nome do arquivo que representará o banco de dados
  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY, '
        'nome TEXT, '
        'numeroDaConta INTEGER)');
  }, version: 2, onDowngrade: onDatabaseDowngradeDelete);
}

Future<int> save(Contato contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['nome'] = contact.nome;
  contactMap['numeroDaConta'] = contact.numeroDaConta;
  return db.insert('contacts', contactMap);
}

Future<List<Contato>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contato> contacts = [];
  for (Map<String, dynamic> row in result) {
    final Contato contact = Contato(
      row['id'],
      row['nome'],
      row['numeroDaConta'],
    );
    contacts.add(contact);
  }
  return contacts;
}
