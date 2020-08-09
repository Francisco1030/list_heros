import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/controller/hero_controller.dart';
import 'package:test_provider/model/hero.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Herois'),
        leading: Consumer<HerosController>(
            builder: (context, herosController, widget) {
          return Center(
              child: Text(
            '${herosController.heros.where((i) => i.isFavorte).length}',
            style: TextStyle(fontSize: 18),
          ));
        }),
      ),
      body: Consumer<HerosController>(
          builder: (context, herosController, widget) {
        return _buildList();
      }),
    );
  }

  _buildList() {
    HerosController herosController = Provider.of<HerosController>(context);

    return ListView.builder(
      itemCount: herosController.heros.length,
      itemBuilder: (context, index) {
        return _builItem(herosController.heros[index]);
      },
    );
  }

  _builItem(HeroModel hero) {
    HerosController herosController = Provider.of<HerosController>(context);
    return ListTile(
        onTap: () {
          herosController.checkedFavort(hero);
        },
        title: Text(hero.name),
        trailing: hero.isFavorte
            ? Icon(Icons.star, color: Colors.yellow)
            : Icon(Icons.star_border));
  }
}
