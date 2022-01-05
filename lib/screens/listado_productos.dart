import 'package:flutter/material.dart';

class ListadoProductos extends StatelessWidget {
  final String titulo;

  const ListadoProductos({required this.titulo}) :super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.titulo),
      ),
      body: ListView(
        children: const <Widget>[
          FichaProducto(name: 'Aceite', description: 'Aceite de cocina', price: 2.90, imagen: 'aceite.png'),
          FichaProducto(name: 'Azúcar', description: 'Azúcar blanca', price: 1.50, imagen: 'azucar.png'),
          FichaProducto(name: 'La Abejita', description: 'Miel La Abejita', price: 2.00, imagen: 'miel.png'),
          FichaProducto(name: 'Aceite', description: 'Aceite de cocina', price: 2.90, imagen: 'aceite.png'),
          FichaProducto(name: 'Azúcar', description: 'Azúcar blanca', price: 1.50, imagen: 'azucar.png'),
        ],
      ),
    );
  }
}

class FichaProducto extends StatelessWidget{
  final String name;
  final String description;
  final double price;
  final String imagen;


  const FichaProducto({required this.name, required this.description, required this.price, required this.imagen}):super();

  @override
  Widget build(BuildContext context){
    //final ButtonStyle style =
    //ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
              color: Colors.black54,
              width: 1
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.greenAccent[100],
          ),
          height: 150,
          child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/img/"+this.imagen,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(description),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Precio: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: price.toString()
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

