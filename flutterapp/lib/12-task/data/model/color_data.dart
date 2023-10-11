class ColorData {
  final String name;
  final String? value;

  ColorData({
    required this.name,
    this.value,
  });

  factory ColorData.fromJson(Map<String, Object?> json) {
    return ColorData(
      name: json['name'] as String,
      value: json['value'] as String?,
    );
  }
}
