import 'package:fast_food/description.dart';
import 'package:fast_food/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constantes.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//SINGLETON -> un punto acceso global
//BD LOCAL

class _HomeState extends State<Home> {
  Singleton singleton = Singleton();

  @override
  void initState() {
    singleton.iniciar();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: con.blanco,
        appBar: AppBar(
        backgroundColor: con.blanco,
        //elevation: 10,
        //shadowColor: Colors.white,
        title: Center( // cualquier tipo widget o cualquier widget
        child: Image.asset("imagenes/Welcome 2.png",
        width: size.width * 0.1,),
    ),
    iconTheme: IconThemeData(color: con.blanco),
    actions: [
      Text(singleton.user)
    /*IconButton(
    onPressed: (){},
    icon: Icon(Icons.local_grocery_store),
    ),*/
    ],
    ),
      //endDrawer: //derecha,
      //drawer: drawerWidget(), // izquierda
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ya hace hambre ¿no?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            letterSpacing: 1.5,
                          )
                      ),
                    ]
                ),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: Container(
                    color: Colors.grey[300],
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemCount: singleton.listTitle.length,
                        itemBuilder: (BuildContext context, int index) {
                          var datos = singleton.listTitle[index].toString().split('#');

                          return InkWell(
                            onTap: () {
                              setState(() {
                                singleton.limpiarVariables();
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.05,
                                right: size.width * 0.05,
                                top: 12
                              ),
                              child: Text(
                                datos[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ),
                SizedBox(
                    height: size.height * 0.65,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // SCROLL  DE IZQ A DER
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: singleton.products.length,
                    itemBuilder: (BuildContext context, int index) {
                        var datos = singleton.products[index].split('#');
                      return Column(
                        children: [
                          Expanded(
                              child:InkWell(
                                onTap:(){
                                  setState(() {
                                    singleton.productoSeleccianado = datos;
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const description()));
                                    //print(singleton.productoSeleccianado);
                                  });
                                },
                                child: Card(
                                  margin: EdgeInsets.only(
                                    left: size.width * 0.2, right: size.width * 0.1,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          radius: size.width * 0.15,
                                          child: Image.asset("imagenes/Welcome 1.png",
                                            width: size.width * 0.15,),
                                        ), //circleAvatar
                                        Text(
                                          datos[1],
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          datos[3],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, color: Colors.red
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],

                      )
                        ;
                    }
                  )
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}
