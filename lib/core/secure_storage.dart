import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  static final _storage = FlutterSecureStorage();
  static final String _loginKey = 'login', _passwordKey= 'password', _tokenKey = 'token';
  static Future<void> saveCredentails({required String login, required String password}) async{
    await _storage.write(key: _loginKey, value: login);
    await _storage.write(key: _passwordKey, value: password);
  }

  static Future<Map<String, String>?>getCredetails() async{
    final String? login = await _storage.read(key: _loginKey);
    final String? password = await _storage.read(key: _passwordKey);

    if(login == null || password == null){
      return null;
    }
    return{"login": login, "password": password};
  }

  static Future<void>deleteCredetails() async{
    await _storage.delete(key: _loginKey);
    await _storage.delete(key: _passwordKey);
  }

  static Future<void>saveToken(String token) async{
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken()async{
    final String? token = await _storage.read(key: _tokenKey);
    return token;
  }

  static Future<void>deleteToken() async{
    await _storage.delete(key: _tokenKey);
  }
}