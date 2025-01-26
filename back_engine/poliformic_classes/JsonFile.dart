import "../utils/TxtFile.dart";

import "dart:convert";

abstract class JsonFile {
  final String path;
  late final dynamic jsonContent;

  JsonFile({required this.path}) {
    returnJson();
  }

  void returnJson() {
    TxtFile jsonFileObject = TxtFile(filePath: path);
    String jsonFile = jsonFileObject.asString;

    try {
      jsonContent = jsonDecode(jsonFile);

    } catch (e) {
      throw Exception("Error at decoding json file: $e");
    }

    return jsonContent;
  }
}