import "dart:io";

class TxtFile {
  String filePath;
  late String asString;
  late String asRawString;

  TxtFile({required this.filePath}) {
    asString = _readAsString();
    asRawString = asString.replaceAll(RegExp(r'\r?\n'), r'\n');
  }

  String _readAsString() {
    try {
      String fileContent = File(filePath).readAsStringSync();
      return fileContent;
    } catch (e) {
      throw Exception("Erro ao ler arquivo ${e}");
    }
  }
}