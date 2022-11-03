import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:cifra_vigenere/cifra_vigenere.dart' as cifra_vigenere;

Random random = Random();
void main() {
  var isRunning = true;
  while (isRunning) {
    print(
        'Escolha uma opção: \n 1 - Codificar Mensagem \n 2 - Decodificar Mensagem');
    print('-----------------------------------');
    var option = stdin.readLineSync();

    //CODIFICAR
    if (option == '1') {
      print('Digite a mensagem a ser codificada');
      var message = stdin.readLineSync()!.toUpperCase();
      // print('Digite a chave do codigo');
      // var key = stdin.readLineSync();

      var key = randomKey(message.length);

      codificar(key, message);
    }
    isRunning = false;
  }
}

//FUNCAO CODIFICAR
void codificar(String key, String message) {
  var out = 0;
  List<int> list = [];
  for (var i = 0; i < message.length; i++) {
    var char = message[i].codeUnits;
    //print(char);
    var charkey = key[i].codeUnits;
    //print(charkey);
    out = (char[0] + charkey[0]) % 26 + 65; // - 2 * 65) % 26 + 65;
    //print('SAIDA $out');
    list.add(out);
    //print(String.fromCharCode(out));
    //print(list);
  }
  for (var i = 0; i < list.length; i++) {
    print('TEXTO CODIFICADO ${String.fromCharCode(list[i])}');
  }
}

String randomKey(int length) {
  const _abcd = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var randomText = String.fromCharCodes(
    List.generate(
      length,
      (index) => _abcd.codeUnitAt(
        random.nextInt(length),
      ),
    ),
  ).toString();
  return randomText;
}
