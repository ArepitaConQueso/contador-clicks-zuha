import 'package:flutter/material.dart';

void main() => runApp(ContadorApp());

class ContadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Clicks',
      home: ContadorHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContadorHomePage extends StatefulWidget {
  @override
  _ContadorHomePageState createState() => _ContadorHomePageState();
}

class _ContadorHomePageState extends State<ContadorHomePage> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  void decrementar() {
    setState(() {
      if (contador > 0) contador--;
    });
  }

  void resetear() {
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Stack(
        children: [
          // Imagen decorativa en la esquina inferior izquierda
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/fondo.png'),
              ),
            ),
          ),
          // Contenido principal
          // Texto de bienvenida arriba
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Center(
              child: Text(
                'Bienvenidos a un contador básico',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[800],
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.white,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$contador ${contador == 1 ? "click" : "clicks"}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: decrementar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Icon(Icons.remove, size: 30),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: resetear,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Reset', style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: incrementar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Icon(Icons.add, size: 30),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
