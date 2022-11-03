import 'dart:math';

class CifraVigenere {
  Random random = Random();

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
    var codificado = '';
    for (var i = 0; i < list.length; i++) {
      codificado += String.fromCharCode(list[i]);
    }
    print('TEXTO CODIFICADO $codificado');
    print('-----------------------------------');
  }

  // FUNCAO DECODIFICAR
  void decodificar(String key, String message) {
    var out = 0;
    List<int> list = [];
    for (var i = 0; i < message.length; i++) {
      var char = message[i].codeUnits;
      //print(char);
      var charkey = key[i].codeUnits;
      //print(charkey);
      out = ((char[0] - charkey[0]) + 26) % 26 + 65; // - 2 * 65) % 26 + 65;
      //print('SAIDA $out');
      list.add(out);
      //print(String.fromCharCode(out));
      //print(list);
    }
    var decodificado = '';
    for (var i = 0; i < list.length; i++) {
      decodificado += String.fromCharCode(list[i]);
    }
    print('TEXTO DECODIFICADO $decodificado');
    print('-----------------------------------');
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
}
