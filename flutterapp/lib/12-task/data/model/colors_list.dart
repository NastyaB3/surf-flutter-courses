import 'package:flutterapp/12-task/data/model/color_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part '../colors_list.freezed.dart';
part '../colors_list.g.dart';
@freezed
class ColorsList  with _$ColorsList {
  factory ColorsList({
    required List<ColorData> colors,

  }) = _ColorsList;


  factory ColorsList.fromJson(Map<String, Object?> json)=> _$ColorsListFromJson(json);


}
