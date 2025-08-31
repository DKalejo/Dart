import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Ejemplo1()));

class Ejemplo1 extends StatefulWidget {
  @override
  State<Ejemplo1> createState() => _Ejemplo1State();
}

class _Ejemplo1State extends State<Ejemplo1> {
  bool grande = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedContainer")),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: grande ? 200 : 100,
          height: grande ? 200 : 100,
          color: grande ? Colors.blue : Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () => setState(() => grande = !grande),
      ),
    );
  }
}
