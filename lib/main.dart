import 'package:flutter/material.dart';
import 'conversor.dart';
import 'taxas.dart';

void main() => runApp(ConversorApp());

class ConversorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ConversorHome(),
    );
  }
}

class ConversorHome extends StatefulWidget {
  @override
  _ConversorHomeState createState() => _ConversorHomeState();
}

class _ConversorHomeState extends State<ConversorHome> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';
  String _moedaSelecionada = 'USD';

  void _converter() {
    double valor = double.tryParse(_controller.text) ?? 0.0;
    double? taxa;

    switch (_moedaSelecionada) {
      case 'USD':
        taxa = taxas['EUA'];
        break;
      case 'EUR':
        taxa = taxas['EURO'];
        break;
      case 'ARS':
        taxa = taxas['PESO'];
        break;
    }

    if (taxa != null) {
      double convertido = calcularConversao(valor, taxa);
      setState(() {
        _resultado = 'Valor em $_moedaSelecionada: ${convertido.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversor de Moedas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite o valor em R\$'),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _moedaSelecionada,
              items: ['USD', 'EUR', 'ARS'].map((moeda) {
                return DropdownMenuItem(value: moeda, child: Text(moeda));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _moedaSelecionada = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _converter,
              child: Text('Converter'),
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
