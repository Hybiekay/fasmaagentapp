import 'package:awesome_notifications/awesome_notifications.dart';

class Notify {
  static int _createUniqueId() {
    return DateTime.now().microsecondsSinceEpoch.remainder(100000);
  }

  static Future<void> sendNotice(
      {required String title, required String body}) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

    if (isAllowed) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: _createUniqueId(),
          channelKey: "fasta_key",
          title: title,
          body: body,
        ),
      );
    } else {
      // Handle the case where notification permission is not granted
      print('Notification permission is not granted');
      // You can show a message to the user or request permission explicitly.
    }
  }
}
