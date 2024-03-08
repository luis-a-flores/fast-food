class Singleton {
  static Singleton? _instance; //Crea la instancia para usar singleton

  Singleton._internal() { //Si ya existe una instancia nos la devuelve
    _instance = this;
  }

  //Verifica si singleton es null/vacio, si es así crea una nueva instancia
  //si no devuelve la que ya existe
  factory Singleton() => _instance ?? Singleton._internal();

  String user = '';
  String pass = '';
/*
  int variablesEntera = 0;
  double variable = 0.0;
  String dato = "";
*/

  var productoSeleccianado;

  List listTitle = [];
  List products = [];

  void limpiarVariables() {
    user = '';
    pass = '';
  }

  void iniciar() {
    listTitle.add('1#Comida');
    listTitle.add('2#Bebidas');
    listTitle.add('3#Snacks');
    listTitle.add('4#Complementos');

    products.add('0#Arrachera 300g#Comida#150#imagenes/welcome 1.png');
    products.add('1#Homburgesa#Comida#200#imagenes/welcome 1.png');
    products.add('2#Hot-Dog#Comida#25.00#imagenes/welcome 1.png#');
    products.add('3#Papas con queso#Snacks#45#imagenes/welcome 1.png');
    products.add('4#Elote#Snacks#30#imagenes/welcome 1.png');
    products.add('5#Coca-Cola#Bebidas#17#imagenes/welcome 1.png');
    products.add('6#Ranch#Complementos#10#imagenes/welcome 1.png');
    products.add('7#Malteada de fresa#Bebidas#50#imagenes/welcome 1.png');
    products.add('8#Esparragos#Complementos#45#imagenes/welcome 1.png');
  }
}