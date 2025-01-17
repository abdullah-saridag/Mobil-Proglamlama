import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  List<String> _tasks = [];  // Görevler listesini tutacağız

  // Görev ekleme fonksiyonu
  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
  }

  // Görev silme fonksiyonu
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görevler', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Görev eklemek için TextField
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Görev adı',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.task, color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: 20),
            // Görev ekleme butonu
            ElevatedButton(
              onPressed: () {
                final String task = _taskController.text;
                if (task.isNotEmpty) {
                  _addTask(task);
                  _taskController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Görev Eklendi: $task'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: Text('Görev Ekle'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,  // Butonun arka plan rengi
                foregroundColor: Colors.white,  // Metin rengi
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Görevlerin listelendiği alan
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        _tasks[index],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteTask(index);  // Görev silme işlemi
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
