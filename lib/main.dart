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

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _texto = "Digite os dados";

  void _resetarCampos(){
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
    _texto = "Digite os dados";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _texto = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      }
      // falta o restante do imc
    });
  }

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
            onPressed: _resetarCampos,
          )
        ],
      ),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.accessibility, size: 120.0, color: Colors.black),
              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: pesoController,
                validator: (value){
                  if(value.isEmpty){
                    return "Peso deve ser informado";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: alturaController,
                validator: (value){
                  if(value.isEmpty){
                    return "Altura deve ser informada";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: (){
                        if (_formKey.currentState.validate()) {
                          _calcular();
                        }
                      },
                      color: Colors.black26,
                      child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                    )
                ),
              ),
              Text(_texto,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),)

            ],
          ),
        ),
      ),
    );
  }
}
