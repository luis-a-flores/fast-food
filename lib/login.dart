import 'package:fast_food/home.dart';
import 'package:fast_food/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Singleton singleton = Singleton();
  //Forma de accerder a las variables de la clase

  final usuario = TextEditingController();
  final contra = TextEditingController();

  late final SharedPreferences prefs; //Inicializar shared preferences

  ///Singleton: Un punto de acceso global - CACHE - cerrar la app se limpia singleton (automatico)
  ///SharedPref: Preferencias del usuario - CACHE - cerrar la app no se limpia (no automitico)

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    checkIsLogin();
  }

  void checkIsLogin(){
    // IF(TIENE VALOR SHARED) VALOR ELSE ''
   // String pass = (prefs.getString('pass') ?? '');
    //String user = (prefs.getString('user') ?? '');
    bool band = (prefs.getBool('logeado') ?? false);
    //String idProduct = (prefs.getString('idProducto') ?? '');

    if(band) {
      /*if(isNewPage) {
        //consulta del idProduct
        //LO ENVIAN A LA VISTA
      } else {*/
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home()));
      //}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              TextFormField(
                controller: usuario,
              ),
              TextFormField(
                controller: contra,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(usuario.text == 'luis' && contra.text == '123'){
                      //almacenando en singleton y shared
                      singleton.user = usuario.text;
                      singleton.pass = contra.text;

                      prefs.setString('user', usuario.text);
                      prefs.setString('pass', contra.text);
                      prefs.setBool('logeado', true);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Home()));
                    }
                    else {
                      //aperece el mensaje de error
                    }
                  });
                },
                child: Text("ingresar"),
              )
            ],
          )
        ],
      ),
    );
  }
}
