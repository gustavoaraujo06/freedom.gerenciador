import 'dart:ffi';

import 'package:mobile/models/pessoa.dart';
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
}
class NotaFiscalResume{
  String emitente;
  double valor;
  DateTime data;
  NotaFiscalResume({required this.emitente, required this.valor, required this.data});
  factory NotaFiscalResume.fromJson(Map<String, dynamic> json){
    print(json['nfeProc']['NFe']['infNFe']['total']['ICMSTot']);
    return NotaFiscalResume(
      emitente: json['nfeProc']['NFe']['infNFe']['emit']['xFant'],
      valor: (json['nfeProc']['NFe']['infNFe']['total']['ICMSTot']['vNF'] as int).toDouble(),
      data: DateTime.parse(json['nfeProc']['NFe']['infNFe']['ide']['dhEmi'])
    );
  }
}