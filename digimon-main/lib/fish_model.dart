import 'dart:convert';
import 'package:http/http.dart' as http;

class Fish {
  final String name;
  String? imageUrl;
  String? fish;
  int rating = 10;
  String? rarity = "";
  String? shadow = "";
  String? location = "";

  Fish(this.name,
  {
      this.imageUrl,
      this.fish,
    });

  // Método para simular la asignación de la rareza desde la API
  void setRarity(String newRarity) {
    rarity = newRarity;
  }
  
  // Sobrescribir toString para debuguear si es necesario
  @override
  String toString() {
    return 'Fish: $name, Rarity: $rarity, Rating: $rating';
  }

  Future<void> getImageUrl() async {
    if (imageUrl != null) return;

    try {
      fish = name.replaceAll(' ', '_');
      String apiKey = "9e8f3ea8-af2c-4946-a216-b6e637f87143";

      final url = Uri.parse('https://api.nookipedia.com/nh/fish/$fish');

      final headers = {
        'X-API-KEY': apiKey,
        'Accept': 'application/json',
        'Version': '1.0'
      };

      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Datos recibidos: $data');
        imageUrl = data['image_url'];
        // name = data['name'];
        rarity = data['rarity'];
        shadow = data['shadow_size'];
        location = data['location'];
      }else{
           print(response.statusCode);
      }
    } catch (e) {
      print('Excepción: $e');
    }
  }
}
