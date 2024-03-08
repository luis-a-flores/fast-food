import 'package:fast_food/login.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constantes.dart' as con;
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart'; //const

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("imagenes/Welcome 1.png"),
                fit: BoxFit.fill
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmojiFeedback(
                    onChanged: (value) {
                      print(value);
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: size.height * 0.15,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () { 
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Login()));
                },
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: con.blanco,
                    fontSize: 20
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: con.rojo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  fixedSize: Size(size.width * 0.6, 45),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: size.height * 0.05,
            ),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {  },
                child: Text('Registrarse'),
              ),
            )
          )
        ],
      ),
    );
  }
}
