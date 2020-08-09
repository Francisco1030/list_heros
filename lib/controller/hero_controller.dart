import 'package:flutter/widgets.dart';
import 'package:test_provider/model/hero.dart';

class HerosController extends ChangeNotifier {
  List<HeroModel> heros = [
    HeroModel(name: 'Homem de Ferro'),
    HeroModel(name: 'Homem Arranha', isFavorte: true),
    HeroModel(name: 'Lanterna Verde'),
    HeroModel(name: 'Thor'),
    HeroModel(name: 'Capitan America'),
  ];

  checkedFavort(HeroModel hero) {
    hero.isFavorte = !hero.isFavorte;
    notifyListeners();
  }
}
