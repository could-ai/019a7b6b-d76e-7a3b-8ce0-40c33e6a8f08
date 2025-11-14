import 'package:flutter/material.dart';
import '../models/booking.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  // Mock bookings data
  final List<Booking> _bookings = [
    Booking(
      id: '1',
      hotelId: '1',
      hotelName: 'Grand Plaza Hotel',
      hotelImage: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
      checkInDate: DateTime.now().add(const Duration(days: 7)),
      checkOutDate: DateTime.now().add(const Duration(days: 10)),
      guests: 2,
      rooms: 1,
      totalPrice: 899.97,
      status: 'confirmed',
      bookingDate: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Booking(
      id: '2',
      hotelId: '5',
      hotelName: 'Tropical Paradise Resort',
      hotelImage: 'https://images.unsplash.com/photo-1520256862855-398228c41684?w=800',
      checkInDate: DateTime.now().add(const Duration(days: 30)),
      checkOutDate: DateTime.now().add(const Duration(days: 35)),
      guests: 4,
      rooms: 2,
      totalPrice: 3499.90,
      status: 'confirmed',
      bookingDate: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Booking(
      id: '3',
      hotelId: '3',
      hotelName: 'Mountain View Lodge',
      hotelImage: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800',
      checkInDate: DateTime.now().subtract(const Duration(days: 20)),
      checkOutDate: DateTime.now().subtract(const Duration(days: 17)),
      guests: 3,
      rooms: 1,
      totalPrice: 599.97,
      status: 'completed',
      bookingDate: DateTime.now().subtract(const Duration(days: 35)),
    ),
  ];

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      case 'completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  List<Booking> get upcomingBookings {
    return _bookings
        .where((booking) => booking.checkInDate.isAfter(DateTime.now()))
        .toList();
  }

  List<Booking> get pastBookings {
    return _bookings
        .where((booking) => booking.checkOutDate.isBefore(DateTime.now()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Bookings'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming', icon: Icon(Icons.calendar_month)),
              Tab(text: 'Past', icon: Icon(Icons.history)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookingsList(upcomingBookings, 'upcoming'),
            _buildBookingsList(pastBookings, 'past'),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingsList(List<Booking> bookings, String type) {
    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'upcoming' ? Icons.calendar_today : Icons.history,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No ${type} bookings',
              style: TextStyle(color: Colors.grey[600], fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              type == 'upcoming'
                  ? 'Book your next stay now!'
                  : 'Your past bookings will appear here',
              style: TextStyle(color: Colors.grey[500], fontSize: 14),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () {
              _showBookingDetails(context, booking);
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          booking.hotelImage,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child: const Icon(Icons.hotel, size: 40),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking.hotelName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _getStatusColor(booking.status).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                booking.status.toUpperCase(),
                                style: TextStyle(
                                  color: _getStatusColor(booking.status),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '\$${booking.totalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Check-in',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatDate(booking.checkInDate),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward, color: Colors.grey),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Check-out',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatDate(booking.checkOutDate),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.nights_stay, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${booking.numberOfNights} nights',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.people, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${booking.guests} guests',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.meeting_room, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${booking.rooms} room(s)',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBookingDetails(BuildContext context, Booking booking) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Booking Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Booking ID', booking.id),
            _buildDetailRow('Hotel', booking.hotelName),
            _buildDetailRow('Check-in', _formatDate(booking.checkInDate)),
            _buildDetailRow('Check-out', _formatDate(booking.checkOutDate)),
            _buildDetailRow('Nights', '${booking.numberOfNights}'),
            _buildDetailRow('Guests', '${booking.guests}'),
            _buildDetailRow('Rooms', '${booking.rooms}'),
            _buildDetailRow('Status', booking.status.toUpperCase()),
            _buildDetailRow('Booked on', _formatDate(booking.bookingDate)),
            const Divider(height: 24),
            _buildDetailRow(
              'Total Amount',
              '\$${booking.totalPrice.toStringAsFixed(2)}',
              isTotal: true,
            ),
            const SizedBox(height: 16),
            if (booking.status == 'confirmed') ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cancellation policy applies')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Cancel Booking'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              fontSize: isTotal ? 20 : 14,
              color: isTotal ? Theme.of(context).colorScheme.primary : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}