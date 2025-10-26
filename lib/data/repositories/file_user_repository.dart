import 'package:color_picker/domain/entities/user.dart';
import 'package:color_picker/domain/repo/user_repository.dart';
import 'dart:io';

class FileUserRepository implements UserRepository {
  List<User>? _users;
  Map<int, User>? _userIndex;
  final String filePath;

  FileUserRepository({required this.filePath});

  Future<void> _loadIfNeeded() async {
    if (_users != null) return;
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception("File not found: $filePath");
    }
    final lines = await file.readAsLines();
    _users = lines
        .where((line) => line.trim().isNotEmpty)
        .map(_parseUser)
        .whereType<User>()
        .toList();

      _userIndex = {for (final user in _users!) user.id: user};
  }

  @override
  Future<List<User>> findUsersByIds(List<int> ids) async{
     await _loadIfNeeded();
     return ids.map((id) => _userIndex![id]).whereType<User>().toList();
  }

  @override
  Future<List<User>> getAllUsers() async{
    await _loadIfNeeded();
    return _users!;
  }

  @override
  Future<User> getUserById(int id)async {
    await _loadIfNeeded();
    return _userIndex![id]!;

  }

  User? _parseUser(String line) {
    final trimmedLine = line.trim();
    if (trimmedLine.isEmpty) return null;

    final parts = trimmedLine.split('\t');
    if (parts.length >= 2) {
      final id = int.tryParse(parts[0]);
      if (id == null) return null;
      final nameParts = parts[1].trim().split(RegExp(r'\s+'));
      if (nameParts.length >= 2) {
        final name = nameParts[0];
        final surname = nameParts[1];
        return User(id: id, name: name, surname: surname);
      }
    }
    return null;
  }
}
