import '../models/hotel.dart';

class HotelService {
  // Mock data service - in a real app, this would fetch from an API or database
  static List<Hotel> getHotels() {
    return [
      Hotel(
        id: '1',
        name: 'Grand Plaza Hotel',
        location: 'New York, USA',
        imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
        rating: 4.8,
        reviewCount: 1250,
        pricePerNight: 299.99,
        amenities: ['Free WiFi', 'Pool', 'Spa', 'Restaurant', 'Gym', 'Parking'],
        description: 'Experience luxury at its finest in the heart of Manhattan. Our Grand Plaza Hotel offers stunning city views, world-class amenities, and exceptional service.',
        images: [
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
          'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
        ],
      ),
      Hotel(
        id: '2',
        name: 'Seaside Resort & Spa',
        location: 'Miami Beach, Florida',
        imageUrl: 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
        rating: 4.6,
        reviewCount: 890,
        pricePerNight: 249.99,
        amenities: ['Beach Access', 'Pool', 'Spa', 'Restaurant', 'Bar'],
        description: 'Relax and unwind at our beautiful beachfront resort. Enjoy pristine beaches, luxurious spa treatments, and delicious dining options.',
        images: [
          'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
          'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
          'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
        ],
      ),
      Hotel(
        id: '3',
        name: 'Mountain View Lodge',
        location: 'Aspen, Colorado',
        imageUrl: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800',
        rating: 4.7,
        reviewCount: 654,
        pricePerNight: 199.99,
        amenities: ['Ski Access', 'Fireplace', 'Restaurant', 'Hot Tub', 'Parking'],
        description: 'Nestled in the Rocky Mountains, our lodge offers breathtaking views and direct access to world-class skiing.',
        images: [
          'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800',
          'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
          'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
        ],
      ),
      Hotel(
        id: '4',
        name: 'Downtown Boutique Hotel',
        location: 'San Francisco, California',
        imageUrl: 'https://images.unsplash.com/photo-1549294413-26f195200c16?w=800',
        rating: 4.5,
        reviewCount: 432,
        pricePerNight: 179.99,
        amenities: ['Free WiFi', 'Restaurant', 'Bar', 'Rooftop Terrace'],
        description: 'A charming boutique hotel in the heart of San Francisco, walking distance to all major attractions.',
        images: [
          'https://images.unsplash.com/photo-1549294413-26f195200c16?w=800',
          'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800',
          'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800',
        ],
      ),
      Hotel(
        id: '5',
        name: 'Tropical Paradise Resort',
        location: 'Honolulu, Hawaii',
        imageUrl: 'https://images.unsplash.com/photo-1520256862855-398228c41684?w=800',
        rating: 4.9,
        reviewCount: 1876,
        pricePerNight: 349.99,
        amenities: ['Beach Access', 'Pool', 'Spa', 'Restaurant', 'Water Sports', 'Kids Club'],
        description: 'Experience paradise at our luxury resort in Waikiki. Perfect for families and couples seeking tropical bliss.',
        images: [
          'https://images.unsplash.com/photo-1520256862855-398228c41684?w=800',
          'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800',
          'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800',
        ],
      ),
      Hotel(
        id: '6',
        name: 'Historic Inn & Suites',
        location: 'Boston, Massachusetts',
        imageUrl: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
        rating: 4.4,
        reviewCount: 567,
        pricePerNight: 159.99,
        amenities: ['Free WiFi', 'Restaurant', 'Parking', 'Pet Friendly'],
        description: 'A beautifully restored historic hotel offering modern comfort with classic charm in the heart of Boston.',
        images: [
          'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
          'https://images.unsplash.com/photo-1559599101-f09722fb4948?w=800',
          'https://images.unsplash.com/photo-1590490359854-8fac8eb5eaba?w=800',
        ],
      ),
    ];
  }

  static Hotel? getHotelById(String id) {
    try {
      return getHotels().firstWhere((hotel) => hotel.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Hotel> searchHotels(String query) {
    if (query.isEmpty) return getHotels();
    
    final lowerQuery = query.toLowerCase();
    return getHotels().where((hotel) {
      return hotel.name.toLowerCase().contains(lowerQuery) ||
             hotel.location.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}