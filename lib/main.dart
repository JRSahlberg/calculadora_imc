import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.black26,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.accessibility, size: 120.0, color: Colors.black),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){},
                    color: Colors.black26,
                    child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                  )
              ),
            ),
            Text("Teste",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 20.0),)

          ],
        ),
      ),
    );
  }
}
