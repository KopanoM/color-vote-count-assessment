import 'package:color_picker/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User> getUserById(int id);
  Future<List<User>> findUsersByIds(List<int> ids);
}