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
  TextEditingController weightControler = TextEditingController();
  TextEditingController heightControler = TextEditingController();
  String _info = "Informe os valores";
  GlobalKey<FormState> _forKey = GlobalKey<FormState>();

  void _resetFields() {
    weightControler.text = "";
    heightControler.text = "";
    setState(() {
      _info = "Informe os valores";
    });
  }

  void _soma() {
    setState(() {
      double weight = double.parse(weightControler.text);
      double height = double.parse(heightControler.text);
      double valor = weight + height;
      _resetFields();
      _info = "Resultado: (${valor.toStringAsPrecision(4)})";
    });
  }

  void _subtracao() {
    setState(() {
      double weight = double.parse(weightControler.text);
      double height = double.parse(heightControler.text);
      double valor = weight - height;
      _resetFields();
      _info = "Resultado: (${valor.toStringAsPrecision(4)})";
    });
  }

  void _multiplicacao() {
    setState(() {
      double weight = double.parse(weightControler.text);
      double height = double.parse(heightControler.text);
      double valor = weight * height;
      _resetFields();
      _info = "Resultado: (${valor.toStringAsPrecision(4)})";
    });
  }

  void _divisao() {
    setState(() {
      double weight = double.parse(weightControler.text);
      double height = double.parse(heightControler.text);
      double valor = weight / height;
      _resetFields();
      _info = "Resultado: (${valor.toStringAsPrecision(4)})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _forKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "1º Número",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    controller: weightControler,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Digite um número";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "2º Número",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    controller: heightControler,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Digite um número";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_forKey.currentState.validate()) {
                            _soma();
                          }
                        },
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_forKey.currentState.validate()) {
                            _subtracao();
                          }
                        },
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_forKey.currentState.validate()) {
                            _multiplicacao();
                          }
                        },
                        child: Text(
                          "X",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_forKey.currentState.validate()) {
                            _divisao();
                          }
                        },
                        child: Text(
                          "/",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Text(
                    _info,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            )));
  }
}
