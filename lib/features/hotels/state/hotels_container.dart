import 'package:flutter/material.dart';
import '../models/hotel.dart';
import '../models/booking.dart';
import '../screens/hotels_list_screen.dart';
import '../screens/history_screen.dart';
import '../screens/hotel_detail_screen.dart';

class HotelsContainer extends StatefulWidget {
  const HotelsContainer({super.key});

  @override
  State<HotelsContainer> createState() => _HotelsContainerState();
}

class _HotelsContainerState extends State<HotelsContainer> {
  int _currentIndex = 0;

  final List<Hotel> _hotels = [
    Hotel(
      id: '1',
      name: 'Отель Сочи',
      city: 'Сочи',
      imageAsset: 'assets/images/hotel11.jpg',
      price: 3200,
      description: 'Уютный отель у моря с видом на горы.',
    ),
    Hotel(
      id: '2',
      name: 'Москва Гранд',
      city: 'Москва',
      imageAsset: 'assets/images/hotel12.jpg',
      price: 4500,
      description: 'Отель в центре столицы рядом с достопримечательностями.',
    ),
    Hotel(
      id: '3',
      name: 'Казань Ривер',
      city: 'Казань',
      imageAsset: 'assets/images/hotel15.jpg',
      price: 2800,
      description: 'Современный отель с панорамным видом на реку.',
    ),
    Hotel(
      id: '4',
      name: 'Невский Палас',
      city: 'Санкт-Петербург',
      imageAsset: 'assets/images/hotel14.jpg',
      price: 3900,
      description: 'Отель в историческом центре с видом на Невский проспект.',
    ),
    Hotel(
      id: '5',
      name: 'Алтай Резорт',
      city: 'Горно-Алтайск',
      imageAsset: 'assets/images/hotel27.jpg',
      price: 2700,
      description: 'Экологичный отель в окружении гор и природы.',
    ),
    Hotel(
      id: '6',
      name: 'Байкал Резиденс',
      city: 'Иркутск',
      imageAsset: 'assets/images/hotel21.jpg',
      price: 3100,
      description: 'Комфортабельный отель у берега Байкала с видом на озеро.',
    ),
  ];

  final List<Booking> _history = [];

  void _openHotelDetail(Hotel hotel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HotelDetailScreen(
          hotel: hotel,
          onConfirm: _addBookingToHistory,
        ),
      ),
    );
  }

  void _addBookingToHistory(Booking booking) {
    setState(() {
      _history.add(booking);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Забронировано: ${booking.hotelName} на ${booking.guests} гостей')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HotelsListScreen(hotels: _hotels, onBook: _openHotelDetail),
      HistoryScreen(history: _history),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'История'),
        ],
      ),
    );
  }
}
