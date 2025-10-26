import 'package:color_picker/domain/entities/color_result.dart';
import 'package:color_picker/domain/entities/user.dart';
import 'package:color_picker/domain/repo/user_repository.dart';
import 'package:color_picker/domain/repo/vote_respository.dart';

class GetMostPopularColor {
  final VoteRespository voteRepository;
  final UserRepository userRepository;

  const GetMostPopularColor({
    required this.voteRepository,
    required this.userRepository,
  });

  Future<ColorResult?> execute() async {
    final votes = await voteRepository.getAllVotes();
    if (votes.isEmpty) {
      return null;
    }
    final counts = <String, int>{};
    final colorUserIds = <String, List<int>>{};
    for (final vote in votes) {
      counts[vote.colour] = (counts[vote.colour] ?? 0) + 1;
      (colorUserIds[vote.colour] ??= []).add(vote.id);
    }
    final mostPopularColor = _getMostPopularColor(counts);
    final voteCount = counts[mostPopularColor]!;
    final userIds = colorUserIds[mostPopularColor]!.toSet().toList();
    final users = await userRepository.findUsersByIds(userIds);
    final sortedUsers = _sortedUsers(users);
    return ColorResult(
      color: mostPopularColor,
      count: voteCount,
      users: sortedUsers,
    );
  }

  String _getMostPopularColor(Map<String, int> counts) {
    int maxCount = 0;
    String? mostPopular;
    for (final entry in counts.entries) {
      if (entry.value > maxCount ||
          (entry.value == maxCount &&
              (mostPopular == null || entry.key.compareTo(mostPopular) < 0))) {
        maxCount = entry.value;
        mostPopular = entry.key;
      }
    }
    return mostPopular!;
  }

  List<User> _sortedUsers(List<User> users) {
    final srted = List<User>.from(users);
    srted.sort((a, b) {
      final surnameComp = a.surname.compareTo(b.surname);
      if (surnameComp != 0) {
        return surnameComp;
      }
      return a.name.compareTo(b.name);
    });
    return srted;
  }
}
