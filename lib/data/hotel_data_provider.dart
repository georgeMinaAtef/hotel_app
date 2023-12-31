// data/hotel_data_provider.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/hotel.dart';

class HotelDataProvider {
  Future<List<Hotel>> fetchHotels() async {
    final response = await http.get(Uri.parse('https://www.hotelsgo.co/test/hotels'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Hotel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
