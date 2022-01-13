import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp01/screens/clientes.dart';
import 'package:flutterapp01/screens/second_screen.dart';
import 'package:flutterapp01/screens/listado_productos.dart';
import 'package:flutterapp01/screens/list_product_json.dart';
import 'package:flutterapp01/splash.dart';
import 'package:flutterapp01/screens/screens_notes/notes_screen.dart';
import 'package:flutterapp01/screens/screens_products/products_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ProdClient';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Splash(),
      routes: <String, WidgetBuilder>{
        "/productos" : (BuildContext context) => const ListadoProductos(titulo: 'Productos de Cocina'),
        "/productos_json" : (BuildContext context) => ListProductJson(titulo: 'Productos de Calzado'),
        "/clientes" : (BuildContext context) => Clientes(),
        "/notas" : (BuildContext context) => NotesPage(),
        "/products_sqlite" : (BuildContext context) => ProductsPage(),
        'second': (_) => SecondScreen()
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle estilos = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), primary: Colors.green);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProdClient'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.file_copy),
            tooltip: 'Presentación',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Colors.blue[200],
                    appBar: AppBar(
                      title: const Text('Productos'),
                    ),
                    body: Center(
                      child: Container(
                        color: Colors.blue[100],
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'Entregue funciones más rápido',
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              'Crea hermosas interfaces de usuario',
                              style: TextStyle(fontSize: 25),
                            ),
                            const Text(
                              'Columna en un contenedor',
                              style: TextStyle(fontSize: 10),
                            ),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const FlutterLogo(
                                    size: 350,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.pink,
                                          size: 40,
                                        ),
                                        SizedBox(height: 20),
                                        Icon(
                                          Icons.audiotrack,
                                          color: Colors.green,
                                          size: 40,
                                        ),
                                        SizedBox(height: 20),
                                        Icon(
                                          Icons.beach_access,
                                          color: Colors.blue,
                                          size: 40,
                                        ),
                                      ],
                                  ),
                                ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ElevatedButton(
                                  style: estilos,
                                  onPressed: null,
                                  child: const Text('Mamíferos'),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                  style: estilos,
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute<void>(
                                      builder: (BuildContext context) {
                                        return Scaffold(
                                          backgroundColor: Colors.amberAccent[100],
                                          appBar: AppBar(
                                            title: const Text('Fotografías de Aves'),
                                          ),
                                          body: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black)
                                              ),
                                              //height: 470,
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: <Widget>[
                                                        Card(
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: const <Widget>[
                                                              Image(
                                                                height: 200,
                                                                width: 150,
                                                                fit: BoxFit.cover,
                                                                image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/d/d1/Avestruz_de_cuello_azul_%28Struthio_camelus_australis%29%2C_cabo_de_Buena_Esparanza%2C_Sud%C3%A1frica%2C_2018-07-23%2C_DD_85.jpg'),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                child: Text(
                                                                  'Avestruz',
                                                                  style: TextStyle(fontSize: 20),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Card(
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: const <Widget>[
                                                              //Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Bald_Eagle_%28Haliaeetus_leucocephalus%29_Kachemak_Bay%2C_Alaska.jpg/1200px-Bald_Eagle_%28Haliaeetus_leucocephalus%29_Kachemak_Bay%2C_Alaska.jpg'),
                                                              Image(
                                                                height: 200,
                                                                width: 150,
                                                                fit: BoxFit.cover,
                                                                image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Bald_Eagle_%28Haliaeetus_leucocephalus%29_Kachemak_Bay%2C_Alaska.jpg/1200px-Bald_Eagle_%28Haliaeetus_leucocephalus%29_Kachemak_Bay%2C_Alaska.jpg')
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                child: Text(
                                                                  'Águila',
                                                                  style: TextStyle(fontSize: 20),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: const <Widget>[
                                                        Placeholder(
                                                          fallbackHeight: 200,
                                                          fallbackWidth: 320,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ));
                                  },
                                  child: const Text('Aves'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.people),
            tooltip: 'Clientes',
            onPressed: () {
              Navigator.pushNamed(context, '/clientes');
            },
          ),
        ],
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'Ha pulsado el boton ',
            style: const TextStyle(fontSize: 24),
            children: <TextSpan>[
              TextSpan(
                text: '$_count ',
                style: const TextStyle(fontWeight: FontWeight.bold)
              ),
              const TextSpan(
                text: 'veces.',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Incrementar contador',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



