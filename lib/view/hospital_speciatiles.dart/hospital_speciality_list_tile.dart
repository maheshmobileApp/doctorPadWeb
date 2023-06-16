import 'package:flutter/material.dart';

class SpecialityListTile extends StatelessWidget {
  const SpecialityListTile({super.key, required this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        alignment: Alignment.center,
        child: Text(name ?? "",style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 18,

                fontWeight: FontWeight.bold),)),
    );
  }
}
