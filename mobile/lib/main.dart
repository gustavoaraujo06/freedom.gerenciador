import 'package:flutter/material.dart';
import 'package:mobile/dashboard.dart';
import 'package:mobile/notas_repository.dart';
import 'package:mobile/notaswidget.dart';

void main() {
  runApp(const NotasApp());
}

class NotasApp extends StatefulWidget {
  const NotasApp({super.key});
  @override
  State<NotasApp> createState() => _NotasAppState();
}
class _NotasAppState extends State<NotasApp> {
  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas Fiscais',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt),
            label: "Notas",
          ),
        ],
        selectedIndex: navigationIndex,
        onDestinationSelected: (value) => setState(() => navigationIndex = value),
        ),
        appBar: AppBar(
          title: Center(child: Text('(Empresa) Gerenciador Notas')),
        ),
        body: [
          Dashboard(),
          NotasWidget(notas: NotasRepository.getNotas()),
        ][navigationIndex],
      ),
    );
  }
}


