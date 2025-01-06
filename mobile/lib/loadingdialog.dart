import 'package:flutter/material.dart';

Future<void> showLoadingDialog(BuildContext context, bool isSuccess) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return LoadingDialog(isSuccess: isSuccess);
    },
  );
}

class LoadingDialog extends StatefulWidget {
  final bool isSuccess;
  const LoadingDialog({super.key, required this.isSuccess});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 240,
        height: 240,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),)
              : InfoMessage(message: "Não Foi Possivel Encontrar a NF", icon: Icons.error, color: theme.colorScheme.error)
        ),
      ),
    );
  }
}

class InfoMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color color;
  const InfoMessage({super.key, required this.message, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
      ],
    );
  }
}
