import 'package:color_picker/domain/entities/vote.dart';
import 'package:color_picker/domain/repo/vote_respository.dart';
import 'dart:io';

class FileVoteRepository implements VoteRespository {
  final String filePath;
  List<Vote>? _votes;

  FileVoteRepository({required this.filePath});

  Future<void> _loadIfNeeded() async {
    if (_votes != null) return;
    final file = File(filePath);
    if (!await file.exists()) throw Exception("File not found");

    final lines = await file.readAsLines();

    _votes = lines
        .where((line) => line.trim().isNotEmpty)
        .map(parseVote)
        .whereType<Vote>()
        .toList();
  }

  @override
  Future<List<Vote>> getAllVotes() async {
    await _loadIfNeeded();
    return _votes!;
  }

  @override
  Future<List<Vote>> getVotesByColor(String color) async {
    await _loadIfNeeded();
    return _votes!.where((vote) => vote.colour == color).toList();
  }

  Vote? parseVote(String line) {
    final trimmedLine = line.trim();
    if (trimmedLine.isEmpty) return null;

    final parts = trimmedLine.split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      final id = int.tryParse(parts[0]);
      if (id == null) return null;
      final color = parts[1];
      return Vote(id: id, colour: color);
    }
    return null;
  }
}
