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
                  width: double.infinity,
                ),
                Row(
                  children: [
                    NotaFiscalField(
                      label: 'Data Emissão',
                      value: DateFormat('dd/MM/yyyy').format(notaFiscal.data),
                      width: 30,
                    ),
                    SizedBox(width: 20),
                    NotaFiscalField(
                      label: 'Valor Nota',
                      value: NumberFormat('###,###.00', 'pt_BR')
                          .format(notaFiscal.valor),
                      width: double.infinity,
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
                    width: 30,
                  ),
                  SizedBox(width: 20),
                  NotaFiscalField(
                    label:
                        (notaFiscal.emitente is PessoaFisica) ? 'CPF' : 'CNPJ',
                    value: (notaFiscal.emitente is PessoaFisica)
                        ? (notaFiscal.emitente as PessoaFisica).cpf
                        : (notaFiscal.emitente as PessoaJuridica).cnpj,
                    width: double.infinity,
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
  final double width;
  const NotaFiscalField(
      {super.key,
      required this.label,
      required this.value,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
        Row(
          children: [
            Container(
              width: width,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 180, 1.0),
                border: Border.all(color: Color.fromRGBO(203, 203, 130, 1.0)),
              ),
              child: Center(
                child: Text(value),
              ),
            )
          ],
        )
      ],
    );
  }
}
