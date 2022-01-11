import 'package:flutter/material.dart';

class Clientes extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final products = SizedBox(
      width: 200,
      child: ElevatedButton.icon(
          icon: const Icon(
            Icons.production_quantity_limits_rounded,
            size: 20,
            color: Colors.red,
          ),
          label: const Text('Productos Cocina', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),
          onPressed: (){
            Navigator.pushNamed(context, '/productos');
          }
      )
    );
    final button2 = SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        icon: const Icon(
            Icons.featured_play_list,
            size: 20,
            color: Colors.deepOrangeAccent
        ),
        label: const Text('Productos Calzado', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),
        onPressed: (){
          Navigator.pushNamed(context, '/productos_json');
        }
      )
    );
    final button3 = SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        icon: const Icon(
            Icons.radio_button_checked,
            size: 20,
            color: Colors.red
        ),
        label: const Text('Botón3'),
        onPressed: null,
      ),
    );
    final button4 = SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        icon: const Icon(
            Icons.radio_button_checked,
            size: 20,
            color: Colors.red
        ),
        label: const Text('Botón4'),
        onPressed: null,
      ),
    );
    final button5 = SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        icon: const Icon(
            Icons.radio_button_checked,
            size: 20,
            color: Colors.red
        ),
        label: const Text('Botón5'),
        onPressed: null,
      ),
    );
    final button6 = SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        icon: const Icon(
            Icons.radio_button_checked,
            size: 20,
            color: Colors.red
        ),
        label: const Text('Botón6'),
        onPressed: null,
      ),
    );
    final button7 = SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        icon: const Icon(
            Icons.radio_button_checked,
            size: 20,
            color: Colors.red
        ),
        label: const Text('Botón7'),
        onPressed: null,
      ),
    );
    final button8 = SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        icon: const Icon(
            Icons.radio_button_checked,
            size: 20,
            color: Colors.red
        ),
        label: const Text('Botón8'),
        onPressed: null,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/img/productos.png',
                      width: 450,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                ),
                const SizedBox(height: 20),
                Botonera(primerboton: products, segundoboton: button2),
                const SizedBox(height: 20),
                Botonera(primerboton: button3, segundoboton: button4),
                const SizedBox(height: 20),
                Botonera(primerboton: button5, segundoboton: button6),
                const SizedBox(height: 20),
                Botonera(primerboton: button7, segundoboton: button8),
              ],
            ),
          ),
      ),
    );
  }
}

class Botonera extends StatelessWidget {
  final SizedBox primerboton;
  final SizedBox segundoboton;

  const Botonera({required this.primerboton, required this.segundoboton}):super();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        primerboton,
        const SizedBox(width: 30),
        segundoboton,
      ],
    );
  }
}