import 'package:flutter/material.dart';
import 'unique_key_page.dart';
import 'value_key_page.dart';
import 'object_key_page.dart';
import 'global_key_page.dart';
import 'page_storage_key_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'p0201',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const UniqueKeyPage(),
      const ValueKeyPage(),
      const ObjectKeyPage(),
      const GlobalKeyPage(),
      const PageStorageKeyPage(),
    ];
    final names = ['UniqueKey', 'ValueKey', 'ObjectKey', 'GlobalKey', 'PageStorageKey'];

    return Scaffold(
      appBar: AppBar(title: const Text('Примеры ключей')),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(names[index]),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => pages[index]),
          ),
        ),
      ),
    );
  }
}
