import 'dart:io';

import '../../../../core/client.dart';
class ComplateProfileRepository {
  ComplateProfileRepository({required this.client});
  final ApiClient client;

  Future<bool> uploadProfilePhoto(File file, int userId) async {
    print("📤 Rasm yuklanmoqda... User ID: $userId");
    final result = await client.uploadProfilePhoto(file);
    print(result ? "✅ Yuklandi!" : "❌ Yuklanmadi!");
    return result;
  }
}
