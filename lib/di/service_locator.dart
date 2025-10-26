import 'package:color_picker/app/color_controller.dart';
import 'package:color_picker/data/repositories/file_user_repository.dart';
import 'package:color_picker/data/repositories/file_vote_repository.dart';
import 'package:color_picker/domain/repo/user_repository.dart';
import 'package:color_picker/domain/repo/vote_respository.dart';
import 'package:color_picker/domain/use_cases/get_most_popular_color.dart';

class ServiceLocator {
  late final UserRepository _userRepository;
  late final VoteRespository _voteRepository;

  late final GetMostPopularColor _getMostPopularColor;
  late final ColorController _colorController;

  ServiceLocator({required String userFilePath, required String voteFilePath}) {
    _initialiseRepositories(userFilePath, voteFilePath);
    _initialiseUseCases();
    _initialiseControllers();
  }

  void _initialiseRepositories(String userFilePath, String votesFilePath) {
    _userRepository = FileUserRepository(filePath: userFilePath);
    _voteRepository = FileVoteRepository(filePath: votesFilePath);
  }

  void _initialiseUseCases() {
    _getMostPopularColor = GetMostPopularColor(
      userRepository: _userRepository,
      voteRepository: _voteRepository,
    );
  }

  void _initialiseControllers() {
    _colorController = ColorController(
      getMostPopularColor: _getMostPopularColor,
    );
  }

  ColorController get colorController => _colorController;
  UserRepository get userRepository => _userRepository;
  VoteRespository get voteRepository => _voteRepository;
  GetMostPopularColor get getMostPopularColor => _getMostPopularColor;
}
