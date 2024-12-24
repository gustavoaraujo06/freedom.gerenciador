import 'package:mobile/models/pessoa.dart';

class PessoaJuridica extends Pessoa{
  final String cnpj;

  PessoaJuridica(
      {required this.cnpj,
      required super.nome,
      required super.endereco});
}