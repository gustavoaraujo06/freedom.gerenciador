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
        final valor = json['nfeProc']['NFe']['infNFe']['total']['ICMSTot']['vNF'];
        return NotaFiscal(
          id: json['nfeProc']['NFe']['infNFe']['Id'].toString().substring(3),
          valor: valor is int ? valor.toDouble() : valor,
          data: DateTime.parse(json['nfeProc']['NFe']['infNFe']['ide']['dhEmi']),
          emitente: PessoaJuridica.fromJson(json['nfeProc']['NFe']['infNFe']['emit']),
          destinatario: PessoaJuridica.fromJson(json['nfeProc']['NFe']['infNFe']['dest'], isEmitente: false),
          produtos: (json['nfeProc']['NFe']['infNFe']['det'] as List).map((e) => Produto.fromJson(e as Map<String, dynamic>)).toList()
        );
      }
}