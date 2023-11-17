import 'package:dio/dio.dart';
import 'package:flutterapp/15-task/data/result_model.dart';

class BallRepository {
  final Dio dio;
  final String baseUrl;

  BallRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<ResultModel> getResultBall() async {
    final response = await dio.get(baseUrl);
    return ResultModel.fromJson(
      response.data,
    );
  }
}
