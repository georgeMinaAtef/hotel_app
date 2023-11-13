// data/hotel_repository.dart

import '../domain/hotel.dart';
import '../domain/hotel_repositry.dart';
import 'hotel_data_provider.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelDataProvider dataProvider;

  HotelRepositoryImpl(this.dataProvider);

  @override
  Future<List<Hotel>> getHotels() async {
    return dataProvider.fetchHotels();
  }
}
