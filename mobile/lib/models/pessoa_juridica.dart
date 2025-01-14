import 'package:mobile/models/endereco.dart';
import 'package:mobile/models/pessoa.dart';

class PessoaJuridica extends Pessoa{
  final String cnpj;

  PessoaJuridica(
      {required this.cnpj,
      required super.nome,
      required super.endereco});
      factory PessoaJuridica.fromJson(Map<String, dynamic> json, {bool isEmitente  = true}){
        return PessoaJuridica(
          cnpj: json['CNPJ'],
          nome: json['xNome'],
          endereco: Endereco.fromJson(isEmitente ? json['enderEmit'] : json['enderDest'])
        );
      }
}