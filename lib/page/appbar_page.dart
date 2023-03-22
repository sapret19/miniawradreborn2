import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBar_normalpage extends StatelessWidget {
  final String judul;
  const AppBar_normalpage({
    super.key,
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 39, 110, 176),
              spreadRadius: 1,
              offset: Offset(0, 0),
              blurRadius: 10)
        ],
        image: DecorationImage(
            image: ExactAssetImage('assets/images/gerbangdrone.jpg'),
            fit: BoxFit.fitWidth,
            opacity: 230),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 84, 181, 246),
              Color.fromARGB(255, 39, 110, 176),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Back Button
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(17, 35, 0, 17),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 39, 110, 176),
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                      blurRadius: 6)
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/images/back.png')),
              ),
            ),
          ),
          //Judul
          Container(
            margin: EdgeInsets.only(left: 17),
            child: Text(
              '${judul}',
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
