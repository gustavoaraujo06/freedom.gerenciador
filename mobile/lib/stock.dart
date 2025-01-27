import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:mobile/models/stock.dart';

class Stocks extends StatelessWidget {
  const Stocks({super.key});

  final List<StockItem> stockItems = const [
    StockItem(
      name: "Sofá",
      measure: "Unidade",
      quantity: 155,
      pictureUrl: "https://www.extra.com.br/sofa-4-lugares-cama-inbox-belem-retratil-e-reclinavel-revestido-em-suede-velusoft-230cm-de-largura/p/55062675",
    ),
    StockItem(
      name: "Mesa de Jantar",
      measure: "Unidade",
      quantity: 42,
      pictureUrl: "https://abramais.vteximg.com.br/arquivos/ids/223069/mesa-de-jantar-square-diagonal.jpg?v=638521571767970000",
    ),
    StockItem(
      name: "Cadeira de Escritório",
      measure: "Unidade",
      quantity: 80,
      pictureUrl: "https://abracasa.vteximg.com.br/arquivos/ids/180281/cadeira-lala-madeira-tramado-cinza-mescla-diagonal.jpg?v=637865778148530000",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isWindows = false;
    try {
      isWindows = Platform.isWindows;
    } catch (_) {
      isWindows = false;
    }

    return isWindows ? _buildGrid(context) : _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: stockItems.length,
      itemBuilder: (context, index) {
        final item = stockItems[index];
        return InkWell(
          onTap: () {},
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blueGrey,
                        backgroundImage: NetworkImage(item.pictureUrl),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.scale),
                          const SizedBox(width: 5),
                          Text(item.measure),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.numbers),
                          const SizedBox(width: 5),
                          Text(item.quantity.toString()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: stockItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8, 
          mainAxisSpacing: 8,
          childAspectRatio: 1.3, 
        ),
        itemBuilder: (context, index) {
          final item = stockItems[index];
          return InkWell(
            onTap: () {},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.blueGrey,
                        backgroundImage: NetworkImage(item.pictureUrl),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.scale, size: 18),
                        const SizedBox(width: 4),
                        Text(item.measure),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.numbers, size: 18),
                        const SizedBox(width: 4),
                        Text(item.quantity.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
