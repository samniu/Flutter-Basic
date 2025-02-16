import 'package:flutter/material.dart';
import 'storage_service.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final TextEditingController _controller = TextEditingController();
  String _savedData = "No Data";

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    String? data = await StorageService.loadData('key');
    setState(() {
      _savedData = data ?? "No Data";
    });
  }

  void _saveData() async {
    await StorageService.saveData('key', _controller.text);
    _loadData();
  }

  void _removeData() async {
    await StorageService.removeData('key');
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Storage Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter Data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveData, child: Text("Save Data")),
            ElevatedButton(onPressed: _removeData, child: Text("Remove Data")),
            SizedBox(height: 20),
            Text("Stored Data: $_savedData"),
          ],
        ),
      ),
    );
  }
}