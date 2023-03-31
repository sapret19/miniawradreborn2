import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/page/grid_page.dart';
import 'package:miniawradreborn2/page/page.dart';

// ignore: camel_case_types
class bunder extends StatefulWidget {
  final String? text;
  final String? icon;
  final String? rute;

  const bunder({
    this.text,
    this.icon,
    this.rute,
    super.key,
  });

  @override
  State<bunder> createState() => _bunderState();
}

class _bunderState extends State<bunder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed("${widget.rute}");
          },
          child: Container(
            width: 60,
            height: 60,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                color: Color.fromARGB(225, 30, 117, 199),
                // boxShadow: const [
                //   BoxShadow(
                //       offset: Offset(0, 0),
                //       color: Color.fromARGB(255, 85, 84, 84),
                //       blurRadius: 5,
                //       spreadRadius: 1)
                // ],
                shape: BoxShape.circle),
            child: Image.asset(
              'assets/images/${widget.icon}',
              scale: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text("${widget.text}",
            style: const TextStyle(
              color: Colors.blue,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ))
      ],
    );
  }
}
