import 'package:flutter/material.dart';
import 'package:flutterapp01/screens/aplicacion.dart';
import 'dart:math' as math;

class Splash extends StatefulWidget{
  const Splash({Key? Key }): super(key: Key);

  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState(){
    super.initState();
    super.initState();
    _navigatetoHome();
  }
  _navigatetoHome () async{
    await Future.delayed(Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedBuilder(
                    animation: _controller,
                    child: Image.asset(
                      'assets/img/logoapp01.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                          angle: _controller.value * 10.0 * math.pi,
                          child: child,
                      );
                    },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Prod',
                      style: TextStyle(color: Colors.yellow[500])
                    ),
                    TextSpan(
                        text: 'Client',
                        style: TextStyle(color: Colors.redAccent[100])
                    ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}