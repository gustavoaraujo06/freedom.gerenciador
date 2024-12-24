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