import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _noteController = TextEditingController();
  List<String> _notes = [];  // Notları tutacak liste

  // Yeni not ekleme fonksiyonu
  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        _notes.add(_noteController.text);  // Yeni notu listeye ekle
        _noteController.clear();  // TextField'ı temizle
      });
    }
  }

  // Not silme fonksiyonu
  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);  // İlgili indeksteki notu sil
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notlar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Not eklemek için TextField
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Yeni Not',
                labelStyle: TextStyle(color: Colors.blueAccent, fontSize: 18),
                hintText: 'Notunuzu buraya yazın...',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add, color: Colors.blueAccent),
                  onPressed: _addNote,  // Not ekleme işlemi
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Notları listele
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        _notes[index],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteNote(index),  // Notu sil
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
