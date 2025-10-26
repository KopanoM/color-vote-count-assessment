import 'package:color_picker/domain/entities/vote.dart';

abstract class VoteRespository {
  Future<List<Vote>> getAllVotes();
  Future<List<Vote>> getVotesByColor(String color);
}
