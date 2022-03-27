import 'package:flutter/material.dart';
import 'dart:math';

void main(){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful()

  ));

}

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {

  var _frases = [
    'Enfrente os problemas e leve a melhor!',
    'Levanta, sacode a poeira, dá a volta por cima.',
    'A vida nada mais é do que a soma de todos os hábitos.',
    'Respire fundo e fique atento às surpresas deliciosas que a vida preparou para você!',
    'Nem todos os dias são bons, mas há algo bom em cada dia.',
    'Um passo de cada vez. Até meio passo serve. Siga firme, não há motivo para ter pressa.',
    'Suba o primeiro degrau com fé. Não é necessário que você veja toda a escada, apenas dê o primeiro passo.',
    'Toda manhã você tem duas escolhas: continuar dormindo com seus sonhos ou acordar e persegui-los!',
  ];

  var _fraseGerada = 'Clique no botao >, para gerar uma frase!';
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _gerarFrase(){

    var _numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[_numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.coffee_rounded,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
        //color: Colors.red
      },
    )
  ],
        title: Text('Frases do dia'),
        centerTitle: true,
        backgroundColor: Colors.red, 
      ),
      body: Container(
        //decoration: BoxDecoration(
          //border: Border.all(width: 3, color: Colors.amber)
        //),
        // width: double.infinity, neste caso nao é necessário devido ao tamanho da imagem.
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                        const Text(
              'Curtidas:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
        
          Padding
            (padding: EdgeInsets.fromLTRB(20, 50, 20, 140),
            child: Text(
                _fraseGerada,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
      RawMaterialButton(
      onPressed: _gerarFrase,
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
      Icons.arrow_right_outlined,
      size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
     shape: CircleBorder(),
),

FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.sentiment_satisfied_alt_rounded),
      ),
          ],
      ),
      ),
    );
  }
}