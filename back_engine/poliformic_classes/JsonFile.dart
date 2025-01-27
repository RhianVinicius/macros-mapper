import "../utils/TxtFile.dart";

import "dart:convert";

abstract class JsonFile {
  final String path;
  late final dynamic _jsonContent;
  late TxtFile jsonFileObject;

  JsonFile({required this.path}) {
    jsonFileObject = TxtFile(filePath: path);
  }

  void returnJsonContent() {
    try {
      _jsonContent = jsonDecode(jsonFileObject.asString);

    } catch (e) {
      throw Exception("Error at decoding json file: $e");

    }
    return _jsonContent;
  }

  void updateJsonContent(dynamic content) {
    final String contentToJson = JsonEncoder.withIndent("  ").convert(content);

    jsonFileObject.writeAsString();
  }
}