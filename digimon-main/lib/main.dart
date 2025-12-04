import 'package:flutter/material.dart';
import 'dart:async';
import 'fish_model.dart';
import 'fish_list.dart';
import 'new_fish_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My fav Animal Crossing Fishes',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'My fav Animal Crossing Fishes',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Fish> _allFishes = [
    Fish('Cherry Salmon'),
    Fish('Bitterling'),
    Fish('Pale chub'),
    Fish('Golden trout'),
    Fish('Stringfish'),
    Fish('Great white shark'),
    Fish('Barreleye'),
    Fish('Coelacanth'),
    Fish('Whale shark'),
    Fish('Saw shark'),
    Fish('Arowana'),
    Fish('Arapaima'),
    Fish('Sturgeon'),
    Fish('Napoleonfish'),
    Fish('Blue marlin'),
    Fish('Oarfish'),
    Fish('Hammerhead shark'),
  ];
  
  Future _showNewFishForm() async {
    final newFish = await Navigator.of(context)
        .push(MaterialPageRoute<Fish>(builder: (BuildContext context) {
      return const AddFishFormPage();
    }));

    if (newFish != null) {
      setState(() {
        _allFishes.add(newFish);
      });     
      newFish.setRarity(newFish.rarity!);    
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFAE17),
        actions: <Widget>[
          // Botón para Añadir
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: _showNewFishForm,
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFFFD78C),
        child: Center(
          // Pasa la lista filtrada al widget FishList
          child: FishList(_allFishes),
        ),
      ),
    );
  }
}