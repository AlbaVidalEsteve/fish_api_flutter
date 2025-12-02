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
      theme: ThemeData(brightness: Brightness.dark),
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
  List<Fish> initialFishes = [
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
    Fish newFish = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const AddFishFormPage();
    }));
    //print(newFish);
    initialFishes.add(newFish);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFAE17),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showNewFishForm,
          ),
        ],
      ),
      body: Container(
          color: const Color(0xFFFFD78C),
          child: Center(
            child: FishList(initialFishes),
          )),
    );
  }
}
