import 'model/data_food.dart';
import 'service/network_service.dart';

void main() async {

  /// Malumotlarni api ga jo'natishdan oldin Canstructorlar orqali class dani property larga qiymatlarni berib olamiz

  Ingredient ingredient = Ingredient(name: "sold", quantity: "100 g", unit: "3");

  List<Ingredient> listIngredient = [ingredient];
  
  List<String> preparationSteps = ["Mahsulotlarni solish", "Mahsulotlarni pishirish"];
  
  NutritionalInformation nutritionalInformation = NutritionalInformation(calories: 100, carbohydrates: "carbs", protein: "milk", fat: "Eggs", fiber: "split peas", sugar: "100 g");

  Food food = Food(dishName: "dishName", ingredients: listIngredient, nutritionalInformation: nutritionalInformation, preparationSteps: preparationSteps);

  /// Endi esa qiymatlarni berib bo'lgandan so'ng, api ga ma'lumotlarni post qilamiz va for orqali bu ishni 10 marta takrorlaymiz

  // for (int i = 0; i < 10; i++){
  //   String response = await NetworkService.postData(food.toJson());
  //
  //   print(response);
  // }

  /// Bu yerda esa api ga joylangan ma'lumotlarni get orqali String toifali o'zgaruvchiga ma'lumotlarni saqlab olamiz

  String data = await NetworkService.getData(NetworkService.apiFood);

  /// Saqlab olgan ma'lumotlarni funksiya orqali List toifali o'zgaruvchiga saqlab olamiz

  List<Food> dataFoodList = foodFromJsonData(data);

  /// Saqlab olgan List turidagi ma'lumotning juft index da turgan object larni o'chirib tashlaymiz

  for (int i = 0; i < dataFoodList.length; i++) {
    if (i.isEven) {
      String result = await NetworkService.deleteData(dataFoodList[i].id);
      print(result);
    }
  }

  print("Hello");
}