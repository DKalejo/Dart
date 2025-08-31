
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Animaciones Implícitas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ImplicitAnimationsDemo(),
    );
  }
}

class ImplicitAnimationsDemo extends StatefulWidget {
  const ImplicitAnimationsDemo({super.key});

  @override
  State<ImplicitAnimationsDemo> createState() => _ImplicitAnimationsDemoState();
}

class _ImplicitAnimationsDemoState extends State<ImplicitAnimationsDemo> {
  bool _cambiado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animaciones Implícitas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animación de posición
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: _cambiado ? Alignment.topCenter : Alignment.bottomCenter,
              child: Column(
                children: [
                  // Animación de opacidad + tamaño + color
                  AnimatedOpacity(
                    opacity: _cambiado ? 1.0 : 0.3,
                    duration: const Duration(seconds: 1),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      width: _cambiado ? 200 : 100,
                      height: _cambiado ? 200 : 100,
                      decoration: BoxDecoration(
                        color: _cambiado ? Colors.blue : Colors.red,
                        borderRadius:
                            BorderRadius.circular(_cambiado ? 100 : 0),
                      ),
                      child: const Icon(Icons.flutter_dash,
                          color: Colors.white, size: 50),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Animación de estilo de texto
                  AnimatedDefaultTextStyle(
                    duration: const Duration(seconds: 1),
                    style: TextStyle(
                      fontSize: _cambiado ? 32 : 18,
                      color: _cambiado ? Colors.blue : Colors.red,
                      fontWeight:
                          _cambiado ? FontWeight.bold : FontWeight.normal,
                    ),
                    child: const Text("Hola Flutter"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            _cambiado = !_cambiado;
          });
        },
      ),
    );
  }
}

