import 'package:flutter/material.dart';

class StockItem {
  final String name;
  final String measure;
  final double quantity;
  final String pictureUrl;

  const StockItem({
    required this.name,
    required this.measure,
    required this.quantity,
    required this.pictureUrl,
  });
}

class StockPage extends StatelessWidget {
  final StockItem item;
  const StockPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StockCard(
                label: "Dados Estoque",
                pictureUrl: item.pictureUrl,
                children: [
                  [
                    StockField(
                      label: "Nome",
                      value: item.name,
                    ),
                  ],
                  [
                    StockField(
                      label: "Medida",
                      value: item.measure,
                    ),
                  ],
                  [
                    StockField(
                      label: "Quantidade",
                      value: item.quantity.toString(),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      );
  }
}

class StockField extends StatelessWidget {
  final String label;
  final String value;

  const StockField({super.key, required this.label, required this.value});

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
        const SizedBox(height: 5),
      ],
    );
  }
}

class StockCard extends StatelessWidget {
  final String label;
  final List<List<Widget>> children;
  final String pictureUrl;

  const StockCard({
    super.key,
    required this.label,
    required this.children,
    required this.pictureUrl,
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
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    pictureUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                ...children.map(
                  (row) => Row(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        row.map((widget) => Expanded(child: widget)).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
