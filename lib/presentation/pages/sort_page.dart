// sort_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/event.dart';
import '../bloc/hotel_state.dart';



class SortPage extends StatelessWidget {
  const SortPage({super.key});

  // ... existing code ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Sort Options'),
      ),
      body: Center(
        child: BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.hotels.length,
                itemBuilder: (context, index) {
                  final hotel = state.hotels[index];
                  return ListTile(
                    title: Text(hotel.name),
                    subtitle: Text('stars: ${hotel.stars} | price: ${hotel.price} | address: ${hotel.address}'),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSortOptions(context);
        },
        child: const Icon(Icons.check_box),
      ),
    );
  }


  void _showSortOptions(BuildContext context) async {

    final selectedOption = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Sort By'),
            ),
            Wrap(
              children: [
                _buildSortOption(context, 'our recommendations'),
                _buildSortOption(context, 'Price & recommended'),
                _buildSortOption(context, 'rating & recommended'),
                _buildSortOption(context, 'distance & recommended'),
                _buildSortOption(context, 'Rating only'),
                _buildSortOption(context, 'price only'),
                _buildSortOption(context, 'distance only'),
              ],
            ),
          ],
        );
      },
    );

    if (selectedOption != null) {
      // Use the captured context instead of 'context'
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected Option: $selectedOption'),
        ),
      );

      // Trigger the sorting in your HotelCubit
      context.read<HotelCubit>().sortHotels(selectedOption);
    }
  }



  Widget _buildSortOption(BuildContext context, String option) {
    return ListTile(
      title: Text(option),
      onTap: () {
        // Close the bottom sheet and return the selected option
        Navigator.pop(context, option);
      },
    );
  }
}

