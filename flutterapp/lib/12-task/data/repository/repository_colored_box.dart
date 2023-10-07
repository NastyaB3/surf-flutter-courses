import 'package:flutterapp/12-task/data/model/color_model.dart';
import 'package:flutterapp/12-task/data/model/colors_list.dart';

class ColoredBoxRepository {
  Future<ColorsList> getColors() async {
    await Future.delayed(const Duration(seconds: 2));
    return ColorsList.fromJson(jsonColor);
  }
}
