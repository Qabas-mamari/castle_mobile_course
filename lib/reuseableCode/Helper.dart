import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Helper{

  static Future<void> showNotification({
    required FlutterLocalNotificationsPlugin localNotificationPlugin,
    required String title,
    required String body,
    required int id,
}) async{
    const AndroidNotificationDetails androidNotificationDetails= AndroidNotificationDetails(
      'your_channel_id', 'your_channel_name',
      importance:Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidNotificationDetails);
    await localNotificationPlugin.show(id, title, body, platformChannelSpecifics);
  }
}