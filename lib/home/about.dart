import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MINI AWRAD SANTRI",
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/head.png")),
            ),
            Container(
              child: Align(alignment: Alignment.center, child: Text("Info")),
            )
          ],
        ),
      ),
    );
  }
}
