import 'package:flutter/material.dart';

class ConfirmNota extends StatelessWidget{
  const ConfirmNota({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(18),
      ),
    );
  }
}