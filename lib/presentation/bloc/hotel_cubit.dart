// presentation/cubit/hotel_cubit.dart

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/hotel.dart';
import 'hotel_state.dart';
import 'package:http/http.dart' as http;


class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelState(hotels: [],minPrice: 0, maxPrice: 1000,));
  void sortHotels(String sortBy) {
    List<Hotel> sortedHotels = List.from(state.hotels);

    switch (sortBy) {
      case 'our recommendations':
      // Implement sorting logic for 'our recommendations'
      // Example: Sort by stars, then by price
        sortedHotels.sort((a, b) {
          if (a.stars != b.stars) {
            return b.stars.compareTo(a.stars); // Sort by stars descending
          } else {
            return a.price.compareTo(b.price); // Sort by price ascending for hotels with the same stars
          }
        });
        break;

      case 'Price & recommended':
      // Implement sorting logic for 'Price & recommended'
      // Example: Sort by price ascending
        sortedHotels.sort((a, b) => a.price.compareTo(b.price));
        break;

      case 'rating & recommended':
      // Implement sorting logic for 'rating & recommended'
      // Example: Sort by stars descending, then by price ascending
        sortedHotels.sort((a, b) {
          if (a.stars != b.stars) {
            return b.stars.compareTo(a.stars);
          } else {
            return a.price.compareTo(b.price);
          }
        });
        break;

    // Add other sorting options...

      default:
      // Default sorting logic (if no matching case)
      // Example: Sort by name alphabetically
        sortedHotels.sort((a, b) => a.name.compareTo(b.name));
    }

    // Update state with the sorted list
    emit(HotelState(hotels: sortedHotels,minPrice: 0, maxPrice: 1000,));
  }

  Future<void> fetchHotels() async {
    try {
      // Make an API call to fetch hotels data
      final response = await http.get(Uri.parse('https://www.hotelsgo.co/test/hotels')); // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint

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


  void updatePrices(double minPrice, double maxPrice) {
    // Implement your logic to filter hotels based on price range
    List<Hotel> filteredHotels = state.hotels
        .where((hotel) => hotel.price >= minPrice && hotel.price <= maxPrice)
        .toList();

    // Update state with the filtered list
    emit(HotelState(hotels: filteredHotels,minPrice: 0, maxPrice: 1000,));
  }




}


