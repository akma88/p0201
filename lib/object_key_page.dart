import 'package:flutter/material.dart';

class Subject {
  final String name;
  Subject(this.name);
}

class ObjectKeyPage extends StatefulWidget {
  const ObjectKeyPage({super.key});

  @override
  State<ObjectKeyPage> createState() => _ObjectKeyPageState();
}

class _ObjectKeyPageState extends State<ObjectKeyPage> {
  final subjects = [Subject('Dart'), Subject('Flutter'), Subject('Git')];

  void moveFirstToLast() {
    setState(() => subjects.add(subjects.removeAt(0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ObjectKey')),
      body: ListView(
        children: subjects.map((subject) => ListTile(
          key: ObjectKey(subject),
          title: Text(subject.name),
          leading: const Icon(Icons.book),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: moveFirstToLast,
        child: const Icon(Icons.swap_vert),
      ),
    );
  }
}
