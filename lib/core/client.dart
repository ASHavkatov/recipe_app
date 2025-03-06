import 'dart:io';

import 'package:dio/dio.dart';
import 'package:new_recipe_app/core/exceptions/auth_exception.dart';
import 'package:new_recipe_app/features/singin/data/models/user_model.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.1.77:8888/api/v1", validateStatus: (status) => true));

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(message: "User not found");
    }
  }

  Future<bool> singUp(UserModel model) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(model),
    );
    print(response.statusCode);
    return response.statusCode == 201 ? true :false;
  }

  Future<Map<String, dynamic>> fetchMyProfile() async {
    var response = await dio.get('/auth/details/1');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw Exception("Error 404");
    }
  }
  Future<List<dynamic>>fetchYourRecipes() async{
    var response = await dio.get('/recipes/list?Limit=2');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }  else{
      throw Exception('Your recipes da hatolik bor');
    }
  }
  
  
  Future<List<dynamic>> fetchOnBoarding() async {
    var response = await dio.get('/onboarding/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("xato");
    }
  }

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    var responseRecipe = await dio.get('/recipes/list');
    if (responseRecipe.statusCode == 200) {
      List<Map<String, dynamic>> dataRecipe = List<Map<String, dynamic>>.from(responseRecipe.data);
      return dataRecipe;
    } else {
      throw Exception("error 404");
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    var responseCategories = await dio.get('/categories/list');

    if (responseCategories.statusCode == 200) {
      List<Map<String, dynamic>> dataCategories = List<Map<String, dynamic>>.from(responseCategories.data);
      return dataCategories;
    } else {
      throw Exception("Error");
    }
  }

  Future<dynamic>fetchTrendingRecipe(int categoryId) async{
    var response = await dio.get('/recipes/trending-recipe');
    if(response.statusCode == 200){
      List<dynamic> data = response.data;
      return data;
    }else{
     throw Exception('trending recipesda xato bor');
    }
  }


  Future<dynamic> fetchRecipesById(int recipeId)async{
    var response = await dio.get('/recipes/detail/$recipeId');
    dynamic data =  response.data;
    return data;
  }

  Future uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap(
      {
        "profilePhoto": await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
      },
    );
    var response = await dio.post(
      'auth/upload',
      data: formData,
      options: Options(
        headers: {"Content - Type": "Multipart/form-data"},
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}
