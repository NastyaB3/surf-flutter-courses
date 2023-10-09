import 'package:flutterapp/12-task/data/model/color_data.dart';
import 'package:flutterapp/12-task/data/model/color_model.dart';

class ColoredBoxRepository {
  Future<List<ColorData>> getColors() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<Map<String, Object?>> colorList =
        List<Map<String, Object?>>.from(jsonColor["colors"] as List);
    final List<ColorData> colors = colorList.map((json) {
      return ColorData.fromJson(json);
    }).toList();

    return colors;
  }
}
