import 'package:color_picker/domain/entities/vote.dart';
import 'package:test/test.dart';

void main() {
  group('Vote', () {
    test('creates and equals', () {
      final vote1 = Vote(id: 1, colour: 'blue');
      final vote2 = Vote(id: 1, colour: 'blue');
      
      expect(vote1, vote2);
      expect(vote1.hashCode, vote2.hashCode);
    });
  });
}
