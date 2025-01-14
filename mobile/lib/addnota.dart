import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/confirmNota.dart';
import 'package:mobile/loadingdialog.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:mobile/notas_repository.dart';

class AddNota extends StatefulWidget {
  const AddNota({super.key});
  @override
  AddNotaState createState() => AddNotaState();
}

class AddNotaState extends State<AddNota> {
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Adicionar Nota", style: theme.textTheme.headlineMedium),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Número da Nota",
                    ),
                  )),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;

                        if (mounted) {
                          
                          NotasRepository.getNFE(_controller.text).then((response) {
                            setState(() {
                              isLoading = false;
                            });
                            if (response.statusCode == 200) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ConfirmNota(
                                        nota: NotaFiscal.fromJson(jsonDecode(response.body) as Map<String, dynamic>,),
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ErrorDialog(message: "Nota Fiscal Não Encontrada");
                                  });
                            }
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: theme.colorScheme.secondary,
                        iconColor: theme.colorScheme.onSecondary,
                        foregroundColor: theme.colorScheme.onSecondary,
                        minimumSize: Size(48, 48),
                        padding: EdgeInsets.zero),
                    child: isLoading
                        ? SizedBox(
                            width: theme.iconTheme.size,
                            height: theme.iconTheme.size,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.onSecondary,
                              ),
                            ),
                          )
                        : Icon(
                            Icons.search,
                            size: theme.iconTheme.size,
                          ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
