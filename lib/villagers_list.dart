import 'package:animal_crossing_villagers/villagers_card.dart';
import 'package:flutter/material.dart';
import 'villagers_model.dart';

class VillagerList extends StatelessWidget {
  final List<Villager> villagers;
  VillagerList(this.villagers);

  @override
  Widget build(BuildContext context){
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: villagers.length,
      itemBuilder: (context, int) {
        return new VillagerCard(villagers[int]);
      },
    );

  }
}