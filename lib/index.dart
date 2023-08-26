import 'package:flutter/material.dart';

class IndexFile extends StatefulWidget {
  const IndexFile({super.key});

  @override
  State<IndexFile> createState() => _IndexFileState();
}

class _IndexFileState extends State<IndexFile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.red),
    );
  }
}
