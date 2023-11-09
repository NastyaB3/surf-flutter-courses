import 'package:dio/dio.dart';
import 'package:flutterapp/15-task/data/result_model.dart';

final dio = Dio();
const baseUrl = 'https://eightballapi.com/api';

class BallRepository {
  Future<ResultModel> getResultBall() async {
    final response = await dio.get(baseUrl);
    return ResultModel.fromJson(
      response.data,
    );
  }
}
