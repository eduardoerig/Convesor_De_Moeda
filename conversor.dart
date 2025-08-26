import 'dart:io';

void main() {
  Map<String, double> taxas = {
    'EUA': 5.4,
    'EURO': 6.3,
    'PESO': 0.004,
  };

  print('Conversor de moedas:');
  print('''
Escolha a moeda de destino: 
1 - USD
2 - EUR
3 - ARS
''');

  stdout.write('Sua escolha: ');
  var escolha = int.parse(stdin.readLineSync()!);

  stdout.write('Digite a quantia em R\$ que deseja converter: ');
  var valor = double.parse(stdin.readLineSync()!);

  switch (escolha) {
    case 1:
      print('USD');
      print('O valor em USD é de: ${calculo(valor, taxas['EUA']!).toStringAsFixed(2)}');
      break;
    case 2:
      print('EUR');
      print('O valor em EUR é de: ${calculo(valor, taxas['EURO']!).toStringAsFixed(2)}');
      break;
    case 3:
      print('ARS');
      print('O valor em ARS é de: ${calculo(valor, taxas['PESO']!).toStringAsFixed(2)}');
      break;
    default:
      print('Opção inválida.');
  }
}

double calculo(double valor, double taxa) {
  return valor / taxa;
}
