class ResultModel {
  final String reading;

  ResultModel({
    required this.reading,
  });

  factory ResultModel.fromJson(Map<String, Object?> json) {
    return ResultModel(
      reading: json['reading'] as String,
    );
  }
}
