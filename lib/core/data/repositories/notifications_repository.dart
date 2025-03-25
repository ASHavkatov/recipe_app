import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/data/models/notifications/notifications_model.dart';

class NotificationsRepository {
  final ApiClient client;
  List<NotificationsModel> model = [];

  NotificationsRepository({
    required this.client,
  });

  Future<List<NotificationsModel>> fetchNotifications()async{
    var rawNotifications = await client.genericGetRequest<List<dynamic>>('/notifications/list');
    model = rawNotifications.map((element) => NotificationsModel.fromJson(element)).toList();
    return model;
  }
}
