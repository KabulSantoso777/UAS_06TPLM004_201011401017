import 'package:cuaca/model/model_cuaca.dart';
import 'package:cuaca/service/service_cuaca.dart';
import 'package:flutter/cupertino.dart';

class ProviderCuaca extends ChangeNotifier {
  TextEditingController cityNameText = TextEditingController();

  ServiceCuaca serviceCuaca = ServiceCuaca();
  ModelCuaca modelCuaca = ModelCuaca();

  get formattedDate => null;

  showWeatherData() async {
    modelCuaca = await serviceCuaca.getCurrentWeather(cityNameText.text);
    print(modelCuaca.weather?.first.main);
    notifyListeners();
  }
}
