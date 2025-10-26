import 'package:color_picker/app/color_controller.dart';
import 'package:color_picker/data/repositories/file_user_repository.dart';
import 'package:color_picker/data/repositories/file_vote_repository.dart';
import 'package:color_picker/domain/use_cases/get_most_popular_color.dart';
import 'package:test/test.dart';

void main() {
  group('ColorController', () {
    test('generates output', () async {
      final voteRepo = FileVoteRepository(filePath: 'test/fixtures/votes.txt');
      final userRepo = FileUserRepository(filePath: 'test/fixtures/users.txt');
      final useCase = GetMostPopularColor(
        voteRepository: voteRepo,
        userRepository: userRepo,
      );
      final controller = ColorController(getMostPopularColor: useCase);

      final output = await controller.generate();

      expect(output, contains('Most popular color: blue'));
      expect(output, contains('(3)'));
      expect(output, contains('Kamau Zuri'));
    });

    test('returns nothing found when empty', () async {
      final voteRepo = FileVoteRepository(filePath: 'test/fixtures/votes_empty.txt');
      final userRepo = FileUserRepository(filePath: 'test/fixtures/users.txt');
      final useCase = GetMostPopularColor(
        voteRepository: voteRepo,
        userRepository: userRepo,
      );
      final controller = ColorController(getMostPopularColor: useCase);

      final output = await controller.generate();

      expect(output, 'nothing found');
    });
  });
}
