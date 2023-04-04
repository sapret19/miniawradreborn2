import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 12,
            )),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
