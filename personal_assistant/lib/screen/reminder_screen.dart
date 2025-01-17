import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  TextEditingController _reminderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showNotification(String message) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'reminder_channel_id',
      'Hatırlatıcılar',
      'Önemli hatırlatıcılar için bildirimler',
      importance: Importance.max,
      priority: Priority.high,
      color: Colors.blueAccent, // Notification color
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Yeni Hatırlatıcı!',
      message,
      notificationDetails,
    );
  }

  void _addReminder() {
    if (_reminderController.text.isNotEmpty) {
      _showNotification(_reminderController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hatırlatıcı başarıyla eklendi!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen hatırlatıcı mesajı girin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hatırlatıcı Oluştur'),
        backgroundColor: Colors.blueAccent, // AppBar color
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hatırlatıcı Mesajınızı Girin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _reminderController,
              decoration: InputDecoration(
                labelText: 'Mesaj',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addReminder,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Buton rengini buradan ayarlıyoruz
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
            child: Text(
              'Hatırlatıcıyı Ekle',
              style: TextStyle(fontSize: 16),
            ),


            ),
          ],
        ),
      ),
    );
  }
}
