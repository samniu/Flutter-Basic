import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // 创建一个 GlobalKey 来存储 FormState
  final _formKey = GlobalKey<FormState>();

  // 创建一个 TextEditingController 来获取输入的文本
  final TextEditingController _controller = TextEditingController();

  // 提交表单时验证输入
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('表单已提交')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // 关联到 FormState
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _controller, // 控制器获取输入的文本
            decoration: InputDecoration(labelText: '请输入内容'),
            // 验证输入内容
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请输入一些内容';
              }
              return null; // 表示验证通过
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _submitForm, // 提交表单
              child: Text('提交'),
            ),
          ),
        ],
      ),
    );
  }
}