import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/loadingdialog.dart';

class AddNota extends StatefulWidget {
  const AddNota({super.key});
  @override
  AddNotaState createState() => AddNotaState();
}

class AddNotaState extends State<AddNota> {
  bool isLoading = false;
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
                    decoration: InputDecoration(
                      labelText: "Número da Nota",
                    ),
                  )),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                        Future.delayed(const Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              isLoading = false;
                            });
                            
                          }
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: theme.colorScheme.secondary,
                      iconColor: theme.colorScheme.onSecondary,
                      foregroundColor: theme.colorScheme.onSecondary,
                      minimumSize: Size(48, 48),
                      padding: EdgeInsets.zero
                    ),
                    child: isLoading ? SizedBox(
                      width: theme.iconTheme.size,
                      height: theme.iconTheme.size,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          theme.colorScheme.onSecondary,
                        ),
                      ),
                    ): Icon(Icons.search, size: theme.iconTheme.size,),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
