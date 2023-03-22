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
            width: 73,
            height: 73,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: Color.fromARGB(255, 84, 181, 246),
                      blurRadius: 5,
                      spreadRadius: 1)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 84, 181, 246),
                      Color.fromARGB(255, 39, 110, 176),
                    ]),
                shape: BoxShape.circle),
            child: Image.asset(
              'assets/images/${widget.icon}',
              scale: 12,
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
