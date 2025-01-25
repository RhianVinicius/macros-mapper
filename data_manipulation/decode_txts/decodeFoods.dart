import "../../back_engine/utils/TxtFile.dart";

Map<String, List<dynamic>> decodeFoods() {
  TxtFile file = new TxtFile(filePath: "Macros Mapper/Cadastro de Alimentos.txt");

  String fileAsString = file.asRawString;

  List<String> foodsStrings = fileAsString.split(r"\n\n");

  Map<String, List<dynamic>> foodsMap = {};

  for (String foodString in foodsStrings) {
    String foodName = foodString.split(r":\n")[0];

    List<dynamic> foodMacros = foodString.split(r":\n")[1].replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "").replaceAll(r"\n", '').split(", ");

    foodsMap[foodName] = foodMacros;
  }
  return foodsMap;
}