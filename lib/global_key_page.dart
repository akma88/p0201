import 'package:flutter/material.dart';

class GlobalKeyPage extends StatefulWidget {
  const GlobalKeyPage({super.key});

  @override
  State<GlobalKeyPage> createState() => _GlobalKeyPageState();
}

class _GlobalKeyPageState extends State<GlobalKeyPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  String message = '';

  void submit() {
    if (formKey.currentState!.validate()) {
      setState(() => message = 'Привет, ${nameController.text}!');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GlobalKey')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Имя'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Введите имя'
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: submit, child: const Text('Готово')),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
