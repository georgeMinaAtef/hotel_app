// hotel_state.dart

import '../../domain/hotel.dart';


class HotelState {
  final List<Hotel> hotels;

  final int minPrice;
  final int maxPrice;

  const HotelState({
    required this.minPrice,
    required this.maxPrice,
    required this.hotels
  });

  @override
  List<Object?> get props => [minPrice, maxPrice];

  HotelState copyWith({
    int? minPrice,
    int? maxPrice,
  }) {
    return HotelState(
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      hotels: [],
    );
  }
}