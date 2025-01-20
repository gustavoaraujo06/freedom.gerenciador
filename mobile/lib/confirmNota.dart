// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:mobile/notas_repository.dart';
import 'package:mobile/views/notafiscal_page.dart';
import 'package:provider/provider.dart';

class ConfirmNota extends StatelessWidget {
  final NotaFiscal nota;
  const ConfirmNota({super.key, required this.nota});
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NotaFiscalCard(label: "Nota Fiscal", children: [
                [
                  NotaFiscalField(
                      label: "Emitente", value: nota.emitente.nome),
                ],
                [
                  NotaFiscalField(
                      label: "Valor", value: NumberFormat.simpleCurrency(locale: 'pt_BR').format(nota.valor))
                ],
                [
                  NotaFiscalField(
                      label: "Data", value: DateFormat('dd/MM/yyyy').format(nota.data))
                ],
                [
                  Row(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.red,
                            iconColor: Colors.white,
                            minimumSize: Size(48, 48),
                            padding: EdgeInsets.zero),
                        child: Icon(
                          Icons.close,
                          size: 24,
                        ),),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<NotasRepository>(context, listen: false).addNota(nota);
                          Navigator.of(context).pop(true);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.green,
                            iconColor: Colors.white,
                            minimumSize: Size(48, 48),
                            padding: EdgeInsets.zero),
                        child: Icon(
                          Icons.check,
                          size: 24,
                        ),
                      )
                    ],
                  )
                ]
              ])
            ],
          ),
        ));
  }
}
