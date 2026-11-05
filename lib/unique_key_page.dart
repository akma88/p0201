import 'dart:math';
import 'package:flutter/material.dart';

class UniqueKeyPage extends StatefulWidget {
  const UniqueKeyPage({super.key});

  @override
  State<UniqueKeyPage> createState() => _UniqueKeyPageState();
}

class _UniqueKeyPageState extends State<UniqueKeyPage> {
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      ColorTile(key: UniqueKey(), text: 'A'),
      ColorTile(key: UniqueKey(), text: 'B'),
    ];
  }

  void swapTiles() {
    setState(() => tiles.insert(1, tiles.removeAt(0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UniqueKey')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

class ColorTile extends StatelessWidget {
  final String text;
  final Color color = Color.fromARGB(
    255,
    Random().nextInt(180),
    Random().nextInt(180),
    Random().nextInt(180),
  );

  ColorTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      alignment: Alignment.center,
      color: color,
      child: Text(text, style: const TextStyle(fontSize: 36, color: Colors.white)),
    );
  }
}
