import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class chatadmin extends StatelessWidget {
  const chatadmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Hubungi Admin\nPondok Pesantren Wisata\nAn-Nur II Al-Murtadlo\nMelalui Nomor WhatssApp berikut",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 17,
              ),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Chat'))
        ],
      ),
    );
  }
}
