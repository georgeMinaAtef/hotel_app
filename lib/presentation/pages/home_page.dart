import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/presentation/pages/filters_page.dart';
import 'package:hotel_app/presentation/pages/sort_page.dart';
import 'package:hotel_app/presentation/widgets/hotel_card.dart';

import '../bloc/event.dart';
import '../bloc/hotel_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelCubit = BlocProvider.of<HotelCubit>(context);

    hotelCubit.fetchHotels();

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.orange,

        title: Row(children: [
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const FiltersPage()));
            },
          ),

          const Text('Filters',style: TextStyle(color: Colors.black),),

          const Spacer(),


          IconButton(
            icon: const Icon(Icons.sort,color: Colors.black,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) =>  SortPage()));
            },
          ),

          const Text('Sort', style: TextStyle(color: Colors.black),),

          const Spacer(),
        ],),


      ),
      body: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, hotelState) {
          if (hotelState.hotels.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: hotelState.hotels.length,
            itemBuilder: (context, index) => HotelCard(hotel: hotelState.hotels[index]),
          );
        },
      ),

    );
  }
}
