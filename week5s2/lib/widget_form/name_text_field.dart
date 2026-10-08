import 'package:flutter/material.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); //TODO jelaskan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLength: 20, // Batas maksimal karakter input
          decoration: const InputDecoration(
            labelText: 'Name',
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey, // Warna underline blueGrey
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey, //TODO jelaskan
              ),
            ),
          ),
          onChanged: (text) {
            debugPrint('Text changed: $text'); //TODO jelaskan
          },
        ),
      ),
    );
  }
}