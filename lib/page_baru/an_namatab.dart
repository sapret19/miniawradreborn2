import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class nama_tab extends StatelessWidget {
  final String namatab;
  const nama_tab({
    super.key, required this.namatab,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        '${namatab}',
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}