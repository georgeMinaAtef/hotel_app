import 'package:flutter/material.dart';

import '../../domain/hotel.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                hotel.image,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 70.0,
                right: 20.0,
                child: IconButton(
                  icon: Icon(
                    hotel.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    // Handle like button press
                    // You may want to toggle the 'isLiked' status in your model
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildRatingStars(hotel.stars ),
                  ],
                ),
                Text(
                  hotel.name,
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                        child: Text('${hotel.reviewScore}') ),

                     Text(hotel.review),

                    const Icon(Icons.location_on),

                    Text(
                      ' ${hotel.address}',
                      style: const TextStyle(fontSize: 12.0), // Use a smaller font for the address
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 2)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Text('Out lowest price') ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$${hotel.price}', style: const TextStyle(color: Colors.orange),),

                            const Text('View Deal >', style: TextStyle(fontSize: 20),) ,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Text('Moore prices', style: TextStyle(
                        fontSize: 16, color: Colors.black54,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey, // Specify the underline color
                        decorationThickness: 2.0,
                      ),),
                    ],
                  ),
                ) ,

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(int rating) {
    // Calculate the number of full and half stars
    int fullStars = rating.floor();
    int halfStars = (rating * 2).round() % 2;

    // Build the star icons
    List<Widget> stars = List.generate(
      fullStars,
          (index) => const Icon(Icons.star, color: Colors.amber,size: 18,),
    );

    if (halfStars == 1) {
      stars.add(const Icon(Icons.star_half, color: Colors.black));
    }

    return Row(children: stars);
  }
}
