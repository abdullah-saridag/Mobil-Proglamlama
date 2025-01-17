import 'package:flutter/material.dart';
import 'screen/task_screen.dart'; // Görevler sayfası
import 'screen/notes_screen.dart'; // Notlar sayfası
import 'screen/reminder_screen.dart'; // Hatırlatıcılar sayfası
import 'screen/weather_screen.dart'; // Hava Durumu sayfası

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // AppBar rengi
        title: Text(
          'Kişisel Asistan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 4, // AppBar'a gölge efekti ekledik
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Başlık
            Text(
              'Kategoriler',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),

            // ListTile'lar
            _buildListTile(context, 'Görevler', Icons.check_circle, TaskScreen()),
            _buildListTile(context, 'Notlar', Icons.note, NotesScreen()),
            _buildListTile(context, 'Hatırlatıcılar', Icons.alarm, ReminderScreen()),
            _buildListTile(context, 'Hava Durumu', Icons.cloud, WeatherScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon, Widget destination) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      shadowColor: Colors.teal.withOpacity(0.2),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
