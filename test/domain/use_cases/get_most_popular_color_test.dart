import 'package:color_picker/data/repositories/file_user_repository.dart';
import 'package:color_picker/data/repositories/file_vote_repository.dart';
import 'package:color_picker/domain/use_cases/get_most_popular_color.dart';
import 'package:test/test.dart';

void main() {
  group('GetMostPopularColor', () {
    test('returns most popular color', () async {
      final voteRepo = FileVoteRepository(filePath: 'test/fixtures/votes.txt');
      final userRepo = FileUserRepository(filePath: 'test/fixtures/users.txt');
      final useCase = GetMostPopularColor(
        voteRepository: voteRepo,
        userRepository: userRepo,
      );

      final result = await useCase.execute();

      expect(result!.color, 'blue');
      expect(result.count, 3);
      expect(result.users, hasLength(3));
    });

    test('returns null when no votes', () async {
      final voteRepo = FileVoteRepository(filePath: 'test/fixtures/votes_empty.txt');
      final userRepo = FileUserRepository(filePath: 'test/fixtures/users.txt');
      final useCase = GetMostPopularColor(
        voteRepository: voteRepo,
        userRepository: userRepo,
      );

      final result = await useCase.execute();

      expect(result, isNull);
    });

    test('sorts users by surname', () async {
      final voteRepo = FileVoteRepository(filePath: 'test/fixtures/votes.txt');
      final userRepo = FileUserRepository(filePath: 'test/fixtures/users.txt');
      final useCase = GetMostPopularColor(
        voteRepository: voteRepo,
        userRepository: userRepo,
      );

      final result = await useCase.execute();

      expect(result!.users[0].surname, 'Kamau');
      expect(result.users[1].surname, 'Mensah');
    });
  });
}
