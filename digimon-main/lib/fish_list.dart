import 'package:digimon/fish_card.dart';
import 'package:flutter/material.dart';
import 'fish_model.dart';

class FishList extends StatelessWidget {
  final List<Fish> fishes;
  const FishList(this.fishes, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: fishes.length,
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (context, int) {
        return FishCard(fishes[int]);
      },
    );
  }
}
