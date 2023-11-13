// domain/hotel_repository.dart

import 'hotel.dart';

abstract class HotelRepository {
  Future<List<Hotel>> getHotels();
}
