import 'package:color_picker/domain/entities/user.dart';
import 'package:test/test.dart';

void main() {
  group('User', () {
    test('creates and equals', () {
      final user1 = User(id: 1, name: 'Kwame', surname: 'Mensah');
      final user2 = User(id: 1, name: 'Kwame', surname: 'Mensah');
      
      expect(user1, user2);
      expect(user1.hashCode, user2.hashCode);
    });
  });
}
