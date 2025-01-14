import 'dart:ffi';

import 'package:mobile/models/pessoa.dart';
import 'package:mobile/models/pessoa_juridica.dart';
import 'package:mobile/models/produto.dart';

class NotaFiscal {
  String id;
  double valor;
  DateTime data;
  Pessoa emitente;
  Pessoa destinatario;
  List<Produto> produtos;
  NotaFiscal(
      {required this.id,
      required this.valor,
      required this.data,
      required this.emitente,
      required this.destinatario,
      required this.produtos});
      factory NotaFiscal.fromJson(Map<String, dynamic> json){
        return NotaFiscal(
          id: json['nfeProc']['NFe']['infNFe']['Id'].toString().substring(3),
          valor: (json['nfeProc']['NFe']['infNFe']['total']['ICMSTot']['vNF'] as int).toDouble(),
          data: DateTime.parse(json['nfeProc']['NFe']['infNFe']['ide']['dhEmi']),
          emitente: PessoaJuridica.fromJson(json['nfeProc']['NFe']['infNFe']['emit']),
          destinatario: PessoaJuridica.fromJson(json['nfeProc']['NFe']['infNFe']['dest']),
          produtos: (json['nfeProc']['NFe']['infNFe']['det'] as List).map((e) => Produto.fromJson(e as Map<String, dynamic>)).toList()
        );
      }
}
class NotaFiscalResume{
  String emitente;
  double valor;
  DateTime data;
  NotaFiscalResume({required this.emitente, required this.valor, required this.data});
  factory NotaFiscalResume.fromJson(Map<String, dynamic> json){
    return NotaFiscalResume(
      emitente: json['nfeProc']['NFe']['infNFe']['emit']['xFant'],
      valor: (json['nfeProc']['NFe']['infNFe']['total']['ICMSTot']['vNF'] as int).toDouble(),
      data: DateTime.parse(json['nfeProc']['NFe']['infNFe']['ide']['dhEmi'])
    );
  }
}