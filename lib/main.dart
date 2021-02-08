import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculadora IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _IMC = 0.0;
  double altura = 0.0;
  double peso = 0.0;


  void _calcIMC(double p, double a) {
    setState(() {
      _IMC = p / (a*a/1000);
    });
  }
  String _text(double i) {

      if(i < 18.5){
        return 'Você está abaixo do peso.';
      }
      else if(i >= 18.5 && i < 25.0){
        return 'Seu peso está normal.';
      }
      else if(i >= 25.0 && i < 30.0){
        return 'Você está com pré-obesidade.';
      }
      else if(i >= 30.0 && i < 35.0){
        return 'Você está com obesidade grau I.';
      }
      else if(i >= 35.0 && i < 40.0){
        return 'Você está com obesidade grau II.';
      }
      else if(i >= 40.0) {
        return 'Você está com obesidade grau III.';
      }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 50), child: TextField(keyboardType: TextInputType.number,
            onChanged: (text){
              altura = double.parse(text);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Digite sua altura em centimetros'
            ),
          ),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 50), child:TextField(keyboardType: TextInputType.number,
              onChanged: (text){
                peso = double.parse(text);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Digite seu peso em quilos'
              ),
          ),),
          Padding(padding: EdgeInsets.symmetric(vertical: 50), child:RaisedButton(
                onPressed: ()=> _calcIMC(peso, altura),
                child: Text(
                    'Calcule',
                    style: TextStyle(fontSize: 20)
                )
            ),),
            Text(
              'Seu IMC é:',
            ),
            Text(
              '$_IMC',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
                _text(_IMC),
            ),
          ],
        ),
      ),

    );
  }
}
