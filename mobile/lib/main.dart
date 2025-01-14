import 'package:flutter/material.dart';
import 'package:mobile/addnota.dart';
import 'package:mobile/dashboard.dart';
import 'package:mobile/loadingdialog.dart';
import 'package:mobile/notas_repository.dart';
import 'package:mobile/notaswidget.dart';
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
      ][navigationIndex],
    );
  }
}
