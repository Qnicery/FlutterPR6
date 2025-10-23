import 'package:flutter/material.dart';
import '../models/hotel.dart';

class HotelCard extends StatelessWidget{
  final Hotel hotel;
  final void Function(Hotel) onBook;

  const HotelCard({
    super.key,
    required this.hotel,
    required this.onBook
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(hotel.imageAsset, height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(hotel.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('${hotel.price.toStringAsFixed(0)} ₽/ночь'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => onBook(hotel),
              child: const Text('Забронировать'),
            ),
          )
        ],
      ),
    );
  }
}