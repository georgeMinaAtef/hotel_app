// presentation/pages/filters_page.dart

import 'package:flutter/material.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Row(
          children: [
            Text('Reset'),
            Text('Filters'),
          ],
        ),
      ),

    );
  }
}
