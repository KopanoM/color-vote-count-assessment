import 'package:color_picker/data/repositories/file_vote_repository.dart';
import 'package:test/test.dart';

void main() {
  group('FileVoteRepository', () {
    test('loads votes from file', () async {
      final repository = FileVoteRepository(filePath: 'test/fixtures/votes.txt');
      
      final votes = await repository.getAllVotes();
      
      expect(votes, hasLength(5));
      expect(votes[0].colour, 'blue');
    });

    test('filters by color', () async {
      final repository = FileVoteRepository(filePath: 'test/fixtures/votes.txt');
      
      final blueVotes = await repository.getVotesByColor('blue');
      
      expect(blueVotes, hasLength(3));
    });

    test('handles invalid data', () async {
      final repository = FileVoteRepository(
        filePath: 'test/fixtures/votes_invalid.txt',
      );
      
      final votes = await repository.getAllVotes();
      
      expect(votes, hasLength(1));
    });
  });
}
