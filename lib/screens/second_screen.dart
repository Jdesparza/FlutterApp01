import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final button2 = IconButton(
        icon: const Icon(
          Icons.assignment_return,
          size: 20,
          color: Colors.red,
        ),
        tooltip:'regresar',
        onPressed: (){
          Navigator.pop(context);
        }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Text('Segunda Pantalla'),
                button2
              ],
            ),
          )
      ),
    );
  }
}