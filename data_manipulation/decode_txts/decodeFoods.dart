import "../../back_engine/utils/TxtFile.dart";

Map<String, Map<String, dynamic>> decodeFoods() {
  TxtFile foodsTxt = TxtFile(filePath: "Macros Mapper/Refeições do Dia.txt");

  String foodsAsString = foodsTxt.asRawString;

  Map<String, Map<String, dynamic>> mealsMap = {};

  List<String> mealsString = foodsAsString.split(r"\n\n");
  
  for (String mealString in mealsString) {
    String mealName = mealString.split(r":\n")[0];

    List<String> foodsStrings = mealString.split(r":\n")[1].split(r"\n");

    Map<String, dynamic> foodsMap = {};
    for (String foodString in foodsStrings) {
      List<String> foodInfo = foodString.split(" ");
      foodInfo.remove("");

      String foodName = foodInfo[1];
      dynamic foodGrams = foodInfo[0];

      foodsMap[foodName] = foodGrams;
    }
    mealsMap[mealName] = foodsMap;
  }

  return mealsMap;
}