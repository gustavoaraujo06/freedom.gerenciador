import 'package:flutter/material.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:mobile/models/pessoa_fisica.dart';
import 'package:mobile/models/pessoa_juridica.dart';
import 'package:intl/intl.dart';

class NotafiscalPage extends StatelessWidget {
  final NotaFiscal notaFiscal;
  const NotafiscalPage({super.key, required this.notaFiscal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalhes Nota Fiscal'),
        ),
        body: Column(children: [
          NotaFiscalSection(
              title: 'Dados NF',
              child: Column(children: [
                NotaFiscalField(
                  label: 'Codigo NF',
                  value: notaFiscal.id,
                  textStyle: TextStyle(fontSize: 12.5),
                ),
                Row(
                  children: [
                    NotaFiscalField(
                      label: 'Data Emissão',
                      value: DateFormat('dd/MM/yyyy').format(notaFiscal.data),
                    ),
                    SizedBox(width: 20),
                    NotaFiscalField(
                      label: 'Valor Nota',
                      value: NumberFormat('###,###.00', 'pt_BR')
                          .format(notaFiscal.valor),
                    )
                  ],
                )
              ])),
          NotaFiscalSection(
              title: 'Emitente',
              child: Column(children: [
                Row(children: [
                  NotaFiscalField(
                    label: 'Nome/Razão Social',
                    value: notaFiscal.emitente.nome,
                    width: 150,
                  ),
                  SizedBox(width: 20),
                  NotaFiscalField(
                    label:
                        (notaFiscal.emitente is PessoaFisica) ? 'CPF' : 'CNPJ',
                    value: (notaFiscal.emitente is PessoaFisica)
                        ? (notaFiscal.emitente as PessoaFisica).cpf
                        : (notaFiscal.emitente as PessoaJuridica).cnpj,
                  )
                ])
              ])),
        ]));
  }
}

class NotaFiscalSection extends StatelessWidget {
  final String title;
  final Widget child;
  const NotaFiscalSection(
      {super.key, required this.title, required this.child});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(253, 253, 150, 1.0),
              border: Border.all(color: Color.fromRGBO(203, 203, 130, 1.0)),
            ),
            child: child)
      ],
    );
  }
}

class NotaFiscalField extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle textStyle;
  final double? width;
  const NotaFiscalField(
      {super.key,
      required this.label,
      required this.value,
      this.textStyle = const TextStyle(fontSize: 14.0),
      this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
            Row(
              children: [
                Flexible(
                    child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 180, 1.0),
                    border:
                        Border.all(color: Color.fromRGBO(203, 203, 130, 1.0)),
                  ),
                  child: Center(child: SelectableText(value, style: textStyle)),
                ))
              ],
            )
          ],
        ));
  }
}
