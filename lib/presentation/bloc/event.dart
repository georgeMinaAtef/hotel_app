import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../domain/hotel.dart';
import 'hotel_state.dart';

abstract class HotelEvent {}

class SortHotelsEvent extends HotelEvent {
  final String sortBy;

  SortHotelsEvent(this.sortBy);
}

class FetchHotelsEvent extends HotelEvent {}

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelState(hotels: [],minPrice: 0, maxPrice: 1000,));

  void sortHotels(String sortBy) {
    // Implement your sorting logic here
    // Update state with the sorted list
    emit(HotelState(hotels: [],minPrice: 0, maxPrice: 1000,)); // Replace with your sorted list
  }

  Future<void> fetchHotels() async {
    try {
      // Make an API call to fetch hotels data
      final response = await http.get(Uri.parse('https://www.hotelsgo.co/test/hotels'));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final List<dynamic> data = json.decode(response.body);

        // Convert the JSON data into a list of Hotel objects
        final List<Hotel> hotels = data.map((item) {
          return Hotel(
            name: item['name'],
            stars: item['starts'].toInt(),
            price: item['price'].toDouble(),
            image: item['image'],
            review: item['review'],
            reviewScore: item['review_score'].toDouble(),
            address: item['address'],
            currency:  item['currency'],
          );
        }).toList();

        // Update the state with the fetched hotels data
        emit(HotelState(hotels: hotels,minPrice: 0, maxPrice: 1000,));
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load hotels');
      }
    } catch (error) {
      // Handle errors
      print('Error: $error');
    }
  }
}

