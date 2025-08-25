import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// Clase para inicializar y configurar la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widget constructor
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Pornhub',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// El ChangeNotifier es para notificar a los demas widget
// Sus propios cambios
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // Funcion para cambiar una nueva asignacion al current
  void getNext() {
    current = WordPair.random();
    // Funcion de ChangeNotifier para notificar a todos los
    // widget que lo estan mirando de suscambios
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  // Widget constructor
  Widget build(BuildContext context) {
    // El watch es para seguir el estado actual
    // de la app
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: Color.fromARGB(255, 1, 238, 255),
            child: Center(child: Text("AppBar")),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Text('A random:'),
                BigCard(pair: pair),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width: 50, height: 50, color: Color.fromRGBO(2, 240, 2, 1)),
              Container(width: 50, height: 50, color: Color.fromRGBO(255, 50, 40, 1)),
              Container(width: 50, height: 50, color: Color.fromRGBO(255, 127, 42, 1)),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 150, height: 60, color: Color.fromRGBO(146, 0, 234, 1)),
              SizedBox(width: 20),
              Container(width: 150, height: 60, color: Color.fromRGBO(0, 160, 234, 1)),
            ],
          ),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width: 50, height: 120, color: Color.fromRGBO(231, 170, 3, 1)),
              Container(width: 50, height: 50, color: Color.fromRGBO(255, 50, 40, 1)),
              Container(width: 50, height: 120, color: Color.fromRGBO(255, 127, 42, 1)),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
}
