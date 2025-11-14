import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/hotel_details_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/my_bookings_screen.dart';

void main() {
  runApp(const HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/hotel-details': (context) => const HotelDetailsScreen(),
        '/booking': (context) => const BookingScreen(),
        '/my-bookings': (context) => const MyBookingsScreen(),
      },
    );
  }
}