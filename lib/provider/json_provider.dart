import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/modals/json_modal.dart';

class JsonProvider extends ChangeNotifier {
  String? data;

  List<JsonDecodeModel> planetsDetails = [];

  FavoriteModel favoriteModel = FavoriteModel(favoriteList: [],);

  Future<void> loadJson() async {
    data = await rootBundle.loadString('json/planets_detail_json.json');

    List decodedList = jsonDecode(data!);

    planetsDetails = decodedList
        .map(
          (e) => JsonDecodeModel.map(data: e),
    )
        .toList();
  }

  // index save
  int planetIndex = 0;

  void saveIndex(int index)
  {
    planetIndex = index;
    notifyListeners();
  }

  favoritePlanet(int index) {
    if (planetsDetails[index].favorite)
    {
      planetsDetails[index].favorite = false;
      planetsDetails.remove(planetsDetails[index],);
    } else {
      planetsDetails[index].favorite = true;
      favoriteModel.favoriteList.add(planetsDetails[index],);
    }
    notifyListeners();
  }

  removeFavoritePlanet(int index) {
    planetsDetails[int.parse(favoriteModel.favoriteList[index].position)]
        .favorite = false;
    favoriteModel.favoriteList.remove(favoriteModel.favoriteList[index]);
    notifyListeners();
  }
}