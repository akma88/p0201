import 'package:flutter/material.dart';

class PageStorageKeyPage extends StatefulWidget {
  const PageStorageKeyPage({super.key});

  @override
  State<PageStorageKeyPage> createState() => _PageStorageKeyPageState();
}

class _PageStorageKeyPageState extends State<PageStorageKeyPage> {
  int tab = 0;
  final bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageStorageKey')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () => setState(() => tab = 0), child: const Text('Уроки')),
              TextButton(onPressed: () => setState(() => tab = 1), child: const Text('Задания')),
            ],
          ),
          Expanded(
            child: PageStorage(
              bucket: bucket,
              child: tab == 0
                  ? ListView.builder(
                      key: const PageStorageKey('lessons'),
                      itemCount: 50,
                      itemBuilder: (_, i) => ListTile(title: Text('Урок ${i + 1}')),
                    )
                  : ListView.builder(
                      key: const PageStorageKey('tasks'),
                      itemCount: 50,
                      itemBuilder: (_, i) => ListTile(title: Text('Задание ${i + 1}')),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
