import 'package:color_picker/domain/entities/color_result.dart';
import 'package:color_picker/domain/entities/user.dart';
import 'package:test/test.dart';

void main() {
  group('ColorResult', () {
    test('creates with users', () {
      final users = [
        User(id: 1, name: 'Kwame', surname: 'Mensah'),
      ];
      final result = ColorResult(color: 'blue', count: 1, users: users);
      
      expect(result.color, 'blue');
      expect(result.users, users);
    });
  });
}
