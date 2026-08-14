import 'package:uuid/uuid.dart';

class Memory {
  final String id;
  final String title;
  final String description;
  final String? imagePath;
  final double latitude;
  final double longitude;
  final DateTime date;

  Memory({
    String? id,
    required this.title,
    required this.description,
    this.imagePath,
    required this.latitude,
    required this.longitude,
    DateTime? date,
  })  : id = id ?? const Uuid().v4(),
        date = date ?? DateTime.now();
}
