import 'package:color_picker/domain/entities/user.dart';

class ColorResult {
  final String color;
  final int count;
  final List<User> users;

  const ColorResult({
    required this.color,
    required this.count,
    required this.users,
  });
}
