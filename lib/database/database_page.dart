import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class DatabasePage extends StatefulWidget {
  @override
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _items = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final data = await _dbHelper.getItems();
    setState(() {
      _items = data;
    });
  }

  void _addItem() async {
    if (_controller.text.isNotEmpty) {
      await _dbHelper.insertItem(_controller.text);
      _controller.clear();
      _loadItems();
    }
  }

  void _updateItem(int id, String name) async {
    await _dbHelper.updateItem(id, name);
    _loadItems();
  }

  void _deleteItem(int id) async {
    await _dbHelper.deleteItem(id);
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite 数据存储')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: '输入名称'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('添加'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return ListTile(
                    title: Text(item['name']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.orange),
                          onPressed: () {
                            _updateItem(item['id'], '更新后的 ${item['name']}');
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteItem(item['id']),
                        ),
                      ],
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