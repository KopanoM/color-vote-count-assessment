import 'package:color_picker/di/service_locator.dart';

void main() async {
  final serviceLocator = ServiceLocator(
    userFilePath: 'data/users.txt',
    voteFilePath: 'data/favourites.txt',
  );
  final controller = serviceLocator.colorController;
  final result = await controller.generate();
  print(result);
}
