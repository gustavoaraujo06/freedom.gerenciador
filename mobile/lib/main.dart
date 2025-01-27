import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:mobile/addnota.dart';
import 'package:mobile/dashboard.dart';
import 'package:mobile/notas_repository.dart';
import 'package:mobile/notaswidget.dart';
import 'package:mobile/stock.dart';
import 'package:mobile/workers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotasRepository(),
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
        iconTheme: const IconThemeData(size: 24),
        useMaterial3: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange[400],
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
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
      home: const NotasHome(),
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

  final List<Widget> pages = [
    const Dashboard(),
    const NotasWidget(),
    const Workers(),
    const Stocks(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isWindows = false;
    try {
      isWindows = Platform.isWindows;
    } catch (_) {
      isWindows = false;
    }

    return isWindows ? _buildDesktopLayout() : _buildMobileLayout();
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      floatingActionButton: navigationIndex == 1
          ? FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => const AddNota(),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: "Dashboard"),
          NavigationDestination(icon: Icon(Icons.receipt), label: "Notas"),
          NavigationDestination(icon: Icon(Icons.people), label: "Funcionários"),
          NavigationDestination(icon: Icon(Icons.pallet), label: "Estoque"),
        ],
        selectedIndex: navigationIndex,
        onDestinationSelected: (value) =>
            setState(() => navigationIndex = value),
      ),
      appBar: AppBar(
        title: const Center(child: Text('(Empresa) Gerenciador Notas')),
      ),
      body: pages[navigationIndex],
    );
  }

  Widget _buildDesktopLayout() {
    bool isExpanded = true;
    return Scaffold(
      floatingActionButton: navigationIndex == 1
          ? FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => const AddNota(),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      appBar: AppBar(
        title: const Text('(Empresa) Gerenciador Notas (Windows)'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          NavigationRail(
            useIndicator: true,
            indicatorColor: Colors.amber,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            extended: isExpanded,
            selectedIndex: navigationIndex,
            onDestinationSelected: (int index) {
              setState(() {
                navigationIndex = index;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text("Dashboard"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.receipt),
                label: Text("Notas"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text("Funcionários"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.pallet),
                label: Text("Estoque"),
              ),
            ],
          ),
          Expanded(
            child: pages[navigationIndex],
          ),
        ],
      ),
    );
  }
}
