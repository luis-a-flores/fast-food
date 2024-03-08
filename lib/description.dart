import 'package:flutter/material.dart';
import 'package:fast_food/utils/singleton.dart';


class description extends StatefulWidget {
  const description({super.key});

  @override
  State<description> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<description> {
  Singleton singleton = Singleton();

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;



    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Card(
              margin: EdgeInsets.only(
                left: size.width *0.2, right: size.width * 0.1
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                    radius: size.width *0.15,
                      child: Image.asset(singleton.productoSeleccianado[4],
                      width: size.width *0.15,)
                    ),
                    for(int i = 0 ; i<4 ;i++ )
                    Text(singleton.productoSeleccianado[i]),
                    
                  ]
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}