class Hotel {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final double pricePerNight;
  final List<String> amenities;
  final String description;
  final List<String> images;

  Hotel({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.amenities,
    required this.description,
    required this.images,
  });
}