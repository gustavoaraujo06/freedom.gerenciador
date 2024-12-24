import 'package:mobile/models/pessoa.dart';

class PessoaFisica extends Pessoa {
  final String cpf;

  PessoaFisica(
      {required this.cpf,
      required super.nome,
      required super.endereco});
}