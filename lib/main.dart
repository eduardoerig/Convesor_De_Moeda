import 'dart:io';
import 'conversor.dart';
import 'taxas.dart';

void main() {
  print('Conversor de moedas:');
  print('''
Escolha a moeda de destino: 
1 - USD
2 - EUR
3 - ARS
''');

  print('Sua escolha: ');
  var escolha = int.parse(stdin.readLineSync()!);

  print('Digite a quantia em R\$ que deseja converter: ');
  var valor = double.parse(stdin.readLineSync()!);

  switch (escolha) {
    case 1:
      print('USD');
      print('O valor em USD é de: ${calcularConversao(valor, taxas['EUA']!).toStringAsFixed(2)}');
      break;
    case 2:
      print('EUR');
      print('O valor em EUR é de: ${calcularConversao(valor, taxas['EURO']!).toStringAsFixed(2)}');
      break;
    case 3:
      print('ARS');
      print('O valor em ARS é de: ${calcularConversao(valor, taxas['PESO']!).toStringAsFixed(2)}');
      break;
    default:
      print('Opção inválida.');
  }
}