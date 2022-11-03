import 'dart:io';
import 'package:cifra_vigenere/cifra_vigenere.dart';

CifraVigenere cifra = CifraVigenere();
void main() {
  var key;
  var isRunning = true;
  while (isRunning) {
    print(
        'Escolha uma opção: \n 1 - Codificar Mensagem \n 2 - Decodificar Mensagem \n 0 - Para sair');
    print('-----------------------------------');
    var option = stdin.readLineSync();

    //CODIFICAR
    if (option == '1') {
      print('Digite a mensagem a ser codificada');
      var message = stdin.readLineSync()!.toUpperCase();
      // print('Digite a chave do codigo');
      // var key = stdin.readLineSync();
      key = cifra.randomKey(message.length);
      cifra.codificar(key, message);
    } else if (option == '2') {
      print('Digite a mensagem a ser decodificada');
      var message = stdin.readLineSync()!.toUpperCase();
      cifra.decodificar(key, message);
    } else if (option == '0') {
      print('vlw');
      isRunning = false;
    } else {
      print('comando [ $option ] invalido, tente novamente');
    }
  }
}
