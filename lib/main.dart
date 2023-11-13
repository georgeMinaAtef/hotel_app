// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/presentation/bloc/event.dart';
import 'package:hotel_app/presentation/pages/filters_page.dart';
import 'package:hotel_app/presentation/resourse/theme.dart';
import 'data/hotel_repositry.dart';
import 'domain/hotel_repositry.dart';
import 'data/hotel_data_provider.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HotelRepository repository = HotelRepositoryImpl(HotelDataProvider());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel App',
      theme: HotelAppTheme.lightTheme(),
      home: BlocProvider(
        create: (context) => HotelCubit()..fetchHotels(),
        child: const HomePage(),
      ),
      routes: {
        '/filters': (context) => BlocProvider.value(
          value: context.read<HotelCubit>(),
          child: const FiltersPage(),
        ),
      },
    );
  }
}