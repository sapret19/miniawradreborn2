import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class head extends StatelessWidget {
  const head({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.h,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 84, 181, 246),
        image: const DecorationImage(
            image: ExactAssetImage(
              'assets/images/gerbangdrone.jpg',
            ),
            alignment: Alignment(0, -1),
            opacity: 220,
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 97,
            width: 282,
            // color:  Color.fromARGB(255, 84, 181, 246),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 84, 181, 246),
                      Color.fromARGB(255, 39, 110, 176),
                    ]),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(33, 0, 0, 0).withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 19,
                      offset: const Offset(0, 2))
                ]),
            child: Row(
              children: [
                Container(
                  height: 62,
                  width: 62,
                  margin: EdgeInsets.only(left: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    image: DecorationImage(
                        image: ExactAssetImage(
                      'assets/images/head.png',
                    )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Pondok Pesantren',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    // SizedBox(height: 13),
                    Text(
                      'Annur II Al-Murtadlo',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Mini Awrad Santri',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
