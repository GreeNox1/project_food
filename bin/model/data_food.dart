import 'dart:convert';

List<Food> foodFromJsonData(String data)
=> List<Food>.from(jsonDecode(data).map((e)
=> Food.fromJson(e)));

String foodToJsonData(Food food)
=> jsonEncode(food.toJson());

class Food {

  late String id;
  late String dishName;
  late List<Ingredient> ingredients;
  late NutritionalInformation nutritionalInformation;
  late List<String> preparationSteps;

  Food({
    required this.dishName,
    required this.ingredients,
    required this.nutritionalInformation,
    required this.preparationSteps,
  });

  Food.fromJson(Map<String, dynamic> json){
    id = json["id"];
    dishName = json["dish_name"];
    ingredients = List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x)));
    nutritionalInformation = NutritionalInformation.fromJson(json["nutritional_information"]);
    preparationSteps = List<String>.from(json["preparation_steps"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "dish_name": dishName,
      "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      "nutritional_information": nutritionalInformation.toJson(),
      "preparation_steps": List<dynamic>.from(preparationSteps.map((x) => x)),
    };
    return map;
  }

}
class Ingredient {

  late String name;
  late String quantity;
  String? unit;

  Ingredient({
    required this.name,
    required this.quantity,
    this.unit,
  });

  Ingredient.fromJson(Map<String, dynamic> json){
    name = json["name"];
    quantity = json["quantity"];
    unit = json["unit"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "quantity": quantity,
      "unit": unit,
    };
    return map;
  }
}
class NutritionalInformation {

  late int calories;
  late String carbohydrates;
  late String protein;
  late String fat;
  late String fiber;
  late String sugar;

  NutritionalInformation({
    required this.calories,
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.fiber,
    required this.sugar,
  });

  NutritionalInformation.fromJson(Map<String, dynamic> json){
    calories = json["calories"];
    carbohydrates = json["carbohydrates"];
    protein = json["protein"];
    fat = json["fat"];
    fiber = json["fiber"];
    sugar = json["sugar"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "calories": calories,
      "carbohydrates": carbohydrates,
      "protein": protein,
      "fat": fat,
      "fiber": fiber,
      "sugar": sugar,
    };
    return map;
  }

}
