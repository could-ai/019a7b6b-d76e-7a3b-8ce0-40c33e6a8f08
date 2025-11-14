class Booking {
  final String id;
  final String hotelId;
  final String hotelName;
  final String hotelImage;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int guests;
  final int rooms;
  final double totalPrice;
  final String status; // confirmed, pending, cancelled
  final DateTime bookingDate;

  Booking({
    required this.id,
    required this.hotelId,
    required this.hotelName,
    required this.hotelImage,
    required this.checkInDate,
    required this.checkOutDate,
    required this.guests,
    required this.rooms,
    required this.totalPrice,
    required this.status,
    required this.bookingDate,
  });

  int get numberOfNights {
    return checkOutDate.difference(checkInDate).inDays;
  }
}