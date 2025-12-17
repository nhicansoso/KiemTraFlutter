import 'package:dio/dio.dart';
import 'package:kiemtragiuaky/model/user.dart';

class APIUser {
  final Dio _dio = Dio();
  Future<String?> login(String username, String password) async {
    try {
      var response = await _dio.post(
        "https://dummyjson.com/auth/login",
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        // Lấy về accessToken
        String token = response.data["accessToken"];
        return token;
      }
    } catch (e) {
      print("Login error: $e");
    }

    return null;
  }

  //Lấy thông tin người dùng
  Future<MyUser?> getUserInfo(String token) async {
    try {
      var response = await _dio.get(
        "https://dummyjson.com/auth/me",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        return MyUser.fromJson(response.data);
      }
    } catch (e) {
      print("Lỗi người dùng: $e");
    }

    return null;
  }
}

var apiUser = APIUser();
