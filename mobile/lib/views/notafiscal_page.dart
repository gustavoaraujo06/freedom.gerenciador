import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:intl/intl.dart';

class NotafiscalPage extends StatelessWidget {
  final NotaFiscal notaFiscal;
  const NotafiscalPage({super.key, required this.notaFiscal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nota 13513"),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotaFiscalCard(
                      label: "Dados NF",
                      children: [
                        [
                          NotaFiscalField(
                              label: "Numero NF", value: notaFiscal.id)
                        ],
                        [
                          NotaFiscalField(
                            label: "Data",
                            value: DateFormat('dd/MM/yyyy')
                                .format(notaFiscal.data),
                          ),
                          NotaFiscalField(
                              label: "Valor",
                              value:
                                  NumberFormat.simpleCurrency(locale: 'pt_BR')
                                      .format(notaFiscal.valor))
                        ]
                      ],
                    ),
                    NotaFiscalCard(label: "Emitente", children: [
                      [
                        NotaFiscalField(
                            label: "Nome", value: notaFiscal.emitente.nome)
                      ],
                      [
                        NotaFiscalField(
                            label: "CNPJ", value: "00.000.000/0000-00")
                      ],
                      [
                        NotaFiscalField(
                            label: "Endereco",
                            value: "Rua dos Bobos, 0, Centro, São Paulo - SP")
                      ]
                    ])
                  ]))
        ],
      ),
    );
  }
}

class NotaFiscalField extends StatelessWidget {
  final String label;
  final String value;

  const NotaFiscalField({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

class NotaFiscalCard extends StatelessWidget {
  final String label;
  List<List<Widget>> children;
  NotaFiscalCard({super.key, required this.label, required this.children});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Card(
            color: Colors.white,
            surfaceTintColor: Colors.yellow,
            shadowColor: Colors.black,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  spacing: 10.0,
                  children: children
                      .map((e) => Row(
                          mainAxisSize: MainAxisSize.max,
                          children: e.map((e) => Expanded(child: e)).toList()))
                      .toList(),
                )))
      ],
    );
  }
}
