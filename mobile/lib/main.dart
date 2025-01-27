import 'package:flutter/material.dart';
import 'package:mobile/addnota.dart';
import 'package:mobile/dashboard.dart';
import 'package:mobile/notas_repository.dart';
import 'package:mobile/notaswidget.dart';
import 'package:mobile/views/stock_page.dart';
import 'package:mobile/workers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => NotasRepository(),
    child: const NotasApp(),
    ),
  );
}

class NotasApp extends StatelessWidget {
  const NotasApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas Fiscais',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blueGrey[700]!,
          onPrimary: Colors.white,
          secondary: Colors.orange[400]!,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            color: Colors.orange[400],
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          size: 24,
        ),
        useMaterial3: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange[400],
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          elevation: 5,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: NotasHome(),
    );
  }
}

class NotasHome extends StatefulWidget {
  const NotasHome({super.key});
  @override
  NotasHomeState createState() => NotasHomeState();
}

class NotasHomeState extends State<NotasHome> {
  int navigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: navigationIndex == 1
          ? FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const AddNota();
                    });
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt),
            label: "Notas",
          ),
           NavigationDestination(
            icon: Icon(Icons.people),
            label: "Funcionarios",
          ),
          NavigationDestination(
            icon: Icon(Icons.pallet),
            label: "Estoque",
          ),
        ],
        selectedIndex: navigationIndex,
        onDestinationSelected: (value) =>
            setState(() => navigationIndex = value),
      ),
      appBar: AppBar(
        title: Center(child: Text('(Empresa) Gerenciador Notas')),
      ),
      body: [
        Dashboard(),
        NotasWidget(),
        Workers(),
        StockPage(item: StockItem(name: "Sofa", measure: "Unidade", quantity: 155, pictureUrl: "https://a-static.mlcdn.com.br/800x560/sofa-retratil-reclinavel-zurique-250m-suede-velut-cinza-c-molas-no-assento-king-house/kingkongcomeletronico/250884x487445/f72674347aa24cd07234ba27a2592514.jpeg"),)
      ][navigationIndex],
    );
  }
}
