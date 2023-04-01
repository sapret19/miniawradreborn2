import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:miniawradreborn2/new.dart';

class slide extends StatelessWidget {
  const slide({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: double.infinity,
            width: 400,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Cardhe(),
            ),
          )
        ],
      ),
    );
  }
}
