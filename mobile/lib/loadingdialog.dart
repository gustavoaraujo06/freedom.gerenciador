import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  const ErrorDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child:
          Padding(padding: EdgeInsets.all(18),
          child: SizedBox(width: 128, height: 128, child: InfoMessage(message: message, icon: Icons.error, color: Colors.red),),),
    );
  }
}

class InfoMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color color;
  const InfoMessage(
      {super.key,
      required this.message,
      required this.icon,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 60,
        ),
        Text(
          message,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
