import 'package:flutter/material.dart';

class ValueKeyPage extends StatefulWidget {
  const ValueKeyPage({super.key});

  @override
  State<ValueKeyPage> createState() => _ValueKeyPageState();
}

class _ValueKeyPageState extends State<ValueKeyPage> {
  final tasks = ['Математика', 'Английский', 'Flutter'];

  void removeTask(String task) {
    setState(() => tasks.remove(task));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ValueKey')),
      body: ListView(
        children: tasks.map((task) => ListTile(
          key: ValueKey(task),
          title: Text(task),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => removeTask(task),
          ),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => tasks.add('Задание ${tasks.length + 1}')),
        child: const Icon(Icons.add),
      ),
    );
  }
}
