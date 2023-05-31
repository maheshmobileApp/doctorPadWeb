import 'package:flutter/material.dart';

class SpecialityListTile extends StatelessWidget {
  const SpecialityListTile({super.key, required this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(name ?? ""),
      ),
    );
  }
}
