import 'package:flutter/material.dart';
import 'package:miniawradreborn2/home/komponen/bunder.dart';

class more extends StatelessWidget {
  const more({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: 100,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(70))),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            const bunder(
                              icon: "tawassul.png",
                              text: "Tawassul",
                              rute: "/tawassul",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const bunder(
                              icon: "birrul.png",
                              text: "Birrul Walidayn",
                              rute: "/birrul",
                            ),
                            // more()
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Column(
                          children: [
                            const bunder(
                              icon: "yasin.png",
                              text: "Yasin & Tahlil",
                              rute: "/yasintahlil",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const bunder(
                              icon: "istighosah.png",
                              text: "Istighosah",
                              rute: "/istighosah",
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const bunder(
                              icon: "waqiah.png",
                              text: "   Al-Waqi`ah",
                              rute: "/waqiah",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const more()
                          ],
                        ),
                        // SizedBox(
                        //   width: 35,
                        // ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     const bunder(
                        //       icon: "diba.png",
                        //       text: "Maulid Diba`",
                        //       rute: "/diba",
                        //     ),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     const bunder(
                        //       icon: "sabul.png",
                        //       text: "Sab`ul Munjiyat",
                        //       rute: "/sabul",
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   width: 35,
                        // ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     const bunder(
                        //       icon: "dalail.png",
                        //       text: "Dalailul Khairat",
                        //       rute: "/dalail",
                        //     ),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     const bunder(
                        //       icon: "kitab.png",
                        //       text: "Kitab Syi`ir",
                        //       rute: "/kitab",
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            const bunder(
                              icon: "diba.png",
                              text: "Maulid Diba`",
                              rute: "/diba",
                            ),
                            SizedBox(
                              height: 97,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            const bunder(
                              icon: "dalail.png",
                              text: "Dalailul Khairat",
                              rute: "/dalail",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const bunder(
                              icon: "kitab.png",
                              text: "Kitab Syi`ir",
                              rute: "/kitab",
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const bunder(
                              icon: "sabul.png",
                              text: "Sab`ul Munjiyat",
                              rute: "/sabul",
                            ),
                            SizedBox(
                              height: 90,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            });
      },
      child: Column(
        children: [
          Container(
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
              'assets/images/tawassul.png',
              scale: 14,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Menu Lengkap",
              style: const TextStyle(
                color: Colors.blue,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ))
        ],
      ),
    );
    // ElevatedButton(
    //     onPressed: () {
    //       showModalBottomSheet(
    //           context: context,
    //           builder: (BuildContext context) {
    //             return Column(
    //               children: [
    //                 bunder(
    //                   icon: "tawassul.png",
    //                   text: "Tawassul",
    //                   rute: "/tawassul",
    //                 ),
    //                 Center(
    //                   child: ElevatedButton(
    //                       onPressed: () {},
    //                       child: Text("close")),
    //                 ),
    //               ],
    //             );
    //           });
    //     },
    //     child: Text('end'));
  }
}
