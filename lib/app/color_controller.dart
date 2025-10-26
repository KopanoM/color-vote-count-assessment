import 'package:color_picker/domain/use_cases/get_most_popular_color.dart';

class ColorController {
  final GetMostPopularColor getMostPopularColor;

  const ColorController({required this.getMostPopularColor});

  Future<String> generate() async {
    final result = await getMostPopularColor.execute();
    if (result == null || result.users.isEmpty) {
      return 'nothing found';
    }
    final buffer = StringBuffer();
    buffer.writeln('Most popular color: ${result.color}');
    buffer.writeln();
    buffer.writeln('Users who voted for ${result.color} (${result.count}):');

    for(final user in result.users){
      buffer.writeln('- ${user.surname} ${user.name}');
    }
    return buffer.toString();
  }
}
