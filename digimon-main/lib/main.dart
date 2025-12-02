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
  // --- Listas y Variables de Estado ---
  List<Fish> _allFishes = [
    Fish('Cherry Salmon')
    // Fish('Bitterling'),
    // Fish('Pale chub'),
    // Fish('Golden trout'),
    // Fish('Stringfish'),
    // Fish('Great white shark'),
    // Fish('Barreleye'),
    // Fish('Coelacanth'),
    // Fish('Whale shark'),
    // Fish('Saw shark'),
    // Fish('Arowana'),
    // Fish('Arapaima'),
    // Fish('Sturgeon'),
    // Fish('Napoleonfish'),
    // Fish('Blue marlin'),
    // Fish('Oarfish'),
    // Fish('Hammerhead shark'),
  ];
  
  // Lista que se mostrará y filtrará
  // late List<Fish> _filteredFishes;

  // // Variable para guardar la rareza seleccionada por el usuario
  // String? _selectedRarity;

  // // Colección de todas las rarezas únicas disponibles
  // Set<String> _availableRarities = {};



  // @override
  // void initState() {
  //   super.initState();
  //   // Inicializar la lista filtrada con todos los peces al inicio
  //   _filteredFishes = _allFishes;

  //   // 1. Recopilar todas las rarezas únicas para las opciones del Dropdown
  //   _availableRarities = _allFishes
  //       .map((f) => f.rarity ?? "")
  //       .where((r) => r.isNotEmpty)
  //       .toSet();
    
  //   // Iniciar la carga de la rareza desde la "API"
  //   // _loadAllFishRarities(); 
  // }
  // // Lógica principal de filtrado
  // void _applyFilter(String? newRarity) {
  //   setState(() {
  //     _selectedRarity = newRarity;
      
  //     // Si el filtro es nulo (opción "Mostrar Todos"), mostramos la lista completa
  //     if (newRarity == null || newRarity.isEmpty) {
  //       _filteredFishes = _allFishes;
  //     } else {
  //       // 2. Filtrar la lista comparando la propiedad 'rarity' (String)
  //       _filteredFishes = _allFishes.where((fish) {
  //         // Asegurarse de que 'rarity' no sea nulo y coincida con el filtro
  //         return fish.rarity == newRarity;
  //       }).toList();
  //     }
  //   });
  // }
  

  
  // Función para cargar la rareza de todos los peces
  // Future<void> _loadAllFishRarities() async {
  //   for (var fish in _allFishes) {      
  //     // Asignar la rareza al objeto Fish
  //     fish.setRarity(fish.rarity!); 
  //   }
  //   // Después de cargar todos, actualiza la UI para mostrar los valores
  //   setState(() {
  //     _filterFishes(_selectedRarity); // Vuelve a aplicar el filtro actual
  //   });
  // }

  // // --- Lógica de Filtrado ---
  // void _filterFishes(String? newRarity) {
  //   if (newRarity == null) return;
    
  //   setState(() {
  //     _selectedRarity = newRarity;
      
  //     if (newRarity == 'Todos') {
  //       _filteredFishes = _allFishes;
  //     } else if (newRarity == 'Sin Rareza') {
  //       // Filtrar aquellos que aún no tienen la rareza cargada
  //       _filteredFishes = _allFishes
  //           .where((fish) => fish.rarity == "")
  //           .toList();
  //     } else {
  //       // Filtrar por la rareza seleccionada
  //       _filteredFishes = _allFishes
  //           .where((fish) => fish.rarity == newRarity)
  //           .toList();
  //     }
  //   });
  // }

  // --- Lógica para añadir nuevo pez ---
  Future _showNewFishForm() async {
    final newFish = await Navigator.of(context)
        .push(MaterialPageRoute<Fish>(builder: (BuildContext context) {
      return const AddFishFormPage();
    }));

    if (newFish != null) {
      setState(() {
        _allFishes.add(newFish);
      });
      
      // Llamar a la API solo para el nuevo pez
      // String rarity = await _fetchRarityFromApi(newFish.name);
      newFish.setRarity(newFish.rarity!);
      
      // setState(() {
      //    // Vuelve a aplicar el filtro actual para incluir el nuevo pez cargado
      //   _applyFilter(_selectedRarity);
      // });
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
          // 1. Dropdown para el Filtro
          // Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: DropdownButton<String>(
          //     value: _selectedRarity,
          //     icon: const Icon(Icons.filter_list, color: Colors.white),
          //     dropdownColor: const Color(0xFFFFAE17),
          //     elevation: 16,
          //     style: const TextStyle(color: Colors.white, fontSize: 16),
          //     underline: Container(
          //       height: 2,
          //       color: Colors.white,
          //     ),
          //     onChanged: _applyFilter, // Llama a la función de filtrado
          //     items: [
          //       // Opción para resetear el filtro
          //       const DropdownMenuItem<String>(
          //         value: null, 
          //         child: Text('Mostrar Todos los Peces', style: TextStyle(fontWeight: FontWeight.bold)),
          //       ),
          //       // Mapear el Set de rarezas únicas a las opciones del Dropdown
          //       ..._availableRarities.map((String rarity) {
          //         return DropdownMenuItem<String>(
          //           value: rarity,
          //           child: Text(rarity),
          //         );
          //       }).toList(),
          //     ],
          //   ),
          // ),
          // const Divider(),

          // La lista de peces filtrados
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _filteredFishes.length,
          //     itemBuilder: (context, index) {
          //       final fish = _filteredFishes[index];
          //       return ListTile(
          //         title: Text(fish.name),
          //         subtitle: Text('Rareza: ${fish.rarity ?? "N/A"}'),
          //         trailing: Text('Rating: ${fish.rating}/10'),
          //       );
          //     },
          //   ),
          // ),
  
          // 2. Botón para Añadir
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