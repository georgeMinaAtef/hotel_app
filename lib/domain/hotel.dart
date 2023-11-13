

class Hotel {
  final String name;
  final int stars;
  final double price;
  final String currency;
  final String image;
  final double reviewScore;
  final String review;
  final String address;
  final bool isLiked;

  Hotel({
    required this.name,
    required this.stars,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
    this.isLiked = false
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
      stars: json['starts'],
      price: json['price'].toDouble(),
      currency: json['currency'],
      image: json['image'],
      reviewScore: json['review_score'].toDouble(),
      review: json['review'],
      address: json['address'],
      isLiked: json['isLiked'] ?? false,
    );
  }
}



// class Hotel {
//   final String name;
//   final double price;
//   final String imageUrl;
//   final double rating;
//   final double distance;
//   final String reviewText;
//   final double reviewScore;
//   final String address;
//   bool isLiked;
//
//   Hotel({
//     required this.name,
//     required this.price,
//     required this.imageUrl,
//     required this.rating,
//     required this.distance,
//     required this.reviewText,
//     required this.reviewScore,
//     required this.address,
//     this.isLiked = false,
//   });
//
//   factory Hotel.fromJson(Map<String, dynamic> json) {
//     return Hotel(
//       name: json['name'] ?? '',
//       price: json['price']?.toDouble() ?? 0.0,
//       imageUrl: json['image'] ?? '',
//       rating: json['starts']?.toDouble() ?? 0.0,
//       distance: json['distance']?.toDouble() ?? 0.0,
//       reviewText: json['review'] ?? '',
//       reviewScore: json['review_score']?.toDouble() ?? 0.0,
//       address: json['address'] ?? '',
//     );
//   }
//
//   @override
//   List<Object?> get props => [name, rating, price, distance];
// }
