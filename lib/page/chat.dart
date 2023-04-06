import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class chatadmin extends StatelessWidget {
  chatadmin({super.key});
  final Uri _url = Uri.parse(
      'https://api.whatsapp.com/send/?phone=6285822221979&text&type=phone_number&app_absent=0');
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
              "Hubungi Admin Induk\nPP. An-Nur II 'Al-Murtadlo'\nuntuk kritik, saran, dan informasi\nseputar podok pesantren.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: (RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    // side: BorderSide(color: Colors.red),
                  ))),
              onPressed: () {
                launchUrl(_url, mode: LaunchMode.externalApplication);
              },
              child: Container(
                height: 5.h,
                width: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.whatsapp),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
