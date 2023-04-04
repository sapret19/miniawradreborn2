import 'package:flutter/material.dart';
import 'package:miniawradreborn2/home/komponen/bunder.dart';
import 'package:sizer/sizer.dart';

class more extends StatelessWidget {
  const more({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height / 2,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
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
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "tawassul.png",
                              text: "Tawassul",
                              rute: "/tawassul",
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "birrul.png",
                              text: "Birrul Walidayn",
                              rute: "/birrul",
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "yasin.png",
                              text: "Yasin & Tahlil",
                              rute: "/yasintahlil",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "istighosah.png",
                              text: "Istighosah",
                              rute: "/istighosah",
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "waqiah.png",
                              text: "Al-Waqiah",
                              rute: "/waqiah",
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "burdah.png",
                              text: "Qasidah Burdah",
                              rute: "/burdah",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "diba.png",
                              text: "Maulid Diba",
                              rute: "/diba",
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "sabul.png",
                              text: "Sabul Munjiyat",
                              rute: "/sabul",
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: bunder(
                              icon: "dalail.png",
                              text: "Dalailul Khoirot",
                              rute: "/dalail",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Center(
                        child: bunder(
                          icon: "kitab.png",
                          text: "Kitab Syair",
                          rute: "/kitab",
                        ),
                      ),
                    ],
                  ),
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
                color: Colors.black,
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
