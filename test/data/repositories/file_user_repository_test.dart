import 'package:color_picker/data/repositories/file_user_repository.dart';
import 'package:test/test.dart';

void main() {
  group('FileUserRepository', () {
    test('loads users from file', () async {
      final repository = FileUserRepository(filePath: 'test/fixtures/users.txt');
      
      final users = await repository.getAllUsers();
      
      expect(users, hasLength(5));
      expect(users[0].name, 'Kwame');
    });

    test('gets user by id', () async {
      final repository = FileUserRepository(filePath: 'test/fixtures/users.txt');
      
      final user = await repository.getUserById(2);
      
      expect(user.name, 'Amara');
    });

    test('throws on missing file', () async {
      final repository = FileUserRepository(filePath: 'nonexistent.txt');
      
      expect(() => repository.getAllUsers(), throwsException);
    });
  });
}
