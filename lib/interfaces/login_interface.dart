import '../models/user_model.dart';
import 'package:dio/dio.dart';

abstract class ILogin {
  Future<UserModel> login(String email, String password) async {
    final api = 'https://fakestoreapi.com/auth/login';
    final data = {"username": email, "password": password};

    final dio = Dio();
    Response response;

    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(email: email, token: body['token']);
    } else {
      return null;
    }
  }
}
