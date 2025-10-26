import 'package:color_picker/di/service_locator.dart';
import 'package:test/test.dart';

void main() {
  group('ServiceLocator', () {
    test('wires dependencies', () async {
      final locator = ServiceLocator(
        userFilePath: 'test/fixtures/users.txt',
        voteFilePath: 'test/fixtures/votes.txt',
      );

      final output = await locator.colorController.generate();

      expect(output, contains('blue'));
    });
  });
}
