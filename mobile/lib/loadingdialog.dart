import 'package:flutter/material.dart';

/// Função que exibe o diálogo modal.
/// Recebe um [isSuccess] para simular se deu certo ou errado.
Future<void> showLoadingDialog(BuildContext context, bool isSuccess) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // impede fechar tocando fora
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
    // Simula algum processamento (ex.: chamada de API).
    // Depois de 2 segundos, altera estado para "carregado" (sucesso/erro).
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        // Depois de mais 1 seg, fecha o diálogo.
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            Navigator.of(context).pop(); // fecha o diálogo
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Card "flutuante"
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: isLoading
              // Mostra circulo de loading se está carregando
              ? const CircularProgressIndicator()
              // Caso contrário, mostra ícone de sucesso ou erro
              : Icon(
                  widget.isSuccess ? Icons.check_circle : Icons.error,
                  size: 60,
                  color: widget.isSuccess ? Colors.green : Colors.red,
                ),
        ),
      ),
    );
  }
}