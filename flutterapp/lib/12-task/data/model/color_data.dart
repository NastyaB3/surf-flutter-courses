import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../color_data.freezed.dart';
part '../color_data.g.dart';

@freezed
class ColorData with _$ColorData {
   factory ColorData({
    required String name,
    String? value,
  }) = _ColorData;


   factory ColorData.fromJson(Map<String, Object?> json)=> _$ColorDataFromJson(json);
}
