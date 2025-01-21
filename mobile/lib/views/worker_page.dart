import 'package:flutter/material.dart';
import 'package:mobile/models/worker.dart';

class WorkerPage extends StatelessWidget {
  final Worker worker;
  const WorkerPage({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados do Trabalhador"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WorkerCard(
                  label: "Informações",
                  children: [
                    [
                      WorkerField(
                        label: "Nome",
                        value: worker.name,
                      ),
                    ],
                    [
                      WorkerField(
                        label: "Email",
                        value: worker.email,
                      ),
                    ],
                  ],
                ),
                WorkerCard(
                  label: "Detalhes",
                  children: [
                    [
                      WorkerField(
                        label: "Cargo",
                        value: worker.role,
                      ),
                      WorkerField(
                        label: "Salário",
                        value: "R\$ ${worker.salary.toStringAsFixed(2)}",
                      ),
                    ],
                    [
                      WorkerField(
                        label: "Chave Pix",
                        value: worker.pixKey,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Implement your Nubank payment logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Processando pagamento via NuPay...")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("NuPay"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkerField extends StatelessWidget {
  final String label;
  final String value;

  const WorkerField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}

class WorkerCard extends StatelessWidget {
  final String label;
  final List<List<Widget>> children;

  const WorkerCard({
    super.key,
    required this.label,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Card(
          color: Colors.white,
          surfaceTintColor: Colors.yellow,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: children
                  .map(
                    (row) => Row(
                      mainAxisSize: MainAxisSize.max,
                      children: row.map((widget) => Expanded(child: widget)).toList(),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}