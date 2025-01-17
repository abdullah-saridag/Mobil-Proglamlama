import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _city = 'Istanbul'; // Varsayılan şehir
  String _weather = '';
  String _temperature = '';
  bool _isLoading = false; // Veri çekme durumu

  @override
  void initState() {
    super.initState();
    _getWeather(); // Başlangıçta hava durumunu al
  }

  Future<void> _getWeather() async {
    setState(() {
      _isLoading = true; // Veri çekiliyor
    });

    final String apiKey = 'f4adaa1d28d034eea153c6d5a4452e63'; // API anahtarı
    final String url = 'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$_city';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _weather = data['current']['condition']['text'];
          _temperature = data['current']['temp_c'].toString();
        });
      } else {
        setState(() {
          _weather = 'Veri alınamadı';
          _temperature = '--';
        });
      }
    } catch (e) {
      setState(() {
        _weather = 'Hata oluştu: $e';
        _temperature = '--';
      });
    } finally {
      setState(() {
        _isLoading = false; // Veri çekme tamamlandı
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hava Durumu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Şehir: $_city',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            if (_isLoading)
              CircularProgressIndicator() // Veri çekilirken dönen ikon
            else
              Column(
                children: [
                  Text('Hava: $_weather', style: TextStyle(fontSize: 20)),
                  Text('Sıcaklık: $_temperature °C', style: TextStyle(fontSize: 20)),
                ],
              ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  _city = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Şehir adı girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getWeather,
              child: Text('Hava Durumunu Göster'),
            ),
          ],
        ),
      ),
    );
  }
}
