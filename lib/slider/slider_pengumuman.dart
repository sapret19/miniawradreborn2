import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/slider/api_service_slider.dart';
import 'package:miniawradreborn2/slider/slider_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ban_pengumuman extends StatefulWidget {
  ban_pengumuman({super.key});
  

  @override
  State<ban_pengumuman> createState() => _ban_pengumumanState();
}

Future<void> simpanSlide(List<String> slidelinks) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('slidelinks', slidelinks);
}

class _ban_pengumumanState extends State<ban_pengumuman> {
  @override
  Widget build(BuildContext context) {
    double aspectratio;

    if (context.isTablet) {
      aspectratio = 16 / 9;
    } else if (context.isLargeTablet) {
      aspectratio = 32 / 9;
    } else {
      aspectratio = 9 / 16;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: bannerpeng(),
    );
  }
}

Widget bannerpeng() {
  return FutureBuilder<List<SliderModel>?>(
    future: APIService(idslider: "18633").getSliderData(),
    builder: (BuildContext context, AsyncSnapshot<List<SliderModel>?> sliderModel) {
      if (sliderModel.connectionState == ConnectionState.done) {
        if (sliderModel.hasData && sliderModel.data != null) {
          // Simpan data slider secara lokal
          final slidelinks = sliderModel.data!.map((model) => model.url).toList();
          simpanSlide(slidelinks);

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50)
            ),
            width: MediaQuery.of(context).size.width,
            child: gambarbanner(sliderModel.data!),
          );
        } 
      }

      return Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: BannerOffline(),
          )
      );
    },
  );
}



Widget gambarbanner(List<SliderModel> sliderList) {
  final Uri _link = Uri.parse('https://annur2.net/psb/');
  return CarouselSlider(
    items: sliderList.map((model) {
      return GestureDetector(
        onTap: () {
          launchUrl(_link, mode: LaunchMode.externalApplication);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl: model.url,
            fit: BoxFit.cover,
            width: 80.w,
            
            alignment: Alignment.bottomCenter,
            placeholder: (context, url) => Container(color: Colors.black38,),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      );
    }).toList(),
    options: CarouselOptions(

      enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 6 / 1,
        autoPlayCurve: Curves.decelerate,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: .8),
  );
}


Widget BannerOffline() {
  return FutureBuilder<List<String>>(
    future: ambilOffline(),
    builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
        final slidelinks = snapshot.data!;
        if (slidelinks.isNotEmpty) {
          return gambarbanner(
            slidelinks.map((url) => SliderModel(url)).toList(),
          );
        } else {
          return Text('Tidak ada data slider yang tersimpan.');
        }
      }

      return Placeholder();
    },
  );
}

Future<List<String>> ambilOffline() async {
  final prefs = await SharedPreferences.getInstance();
  final slidelinks = prefs.getStringList('slidelinks');
  return slidelinks ?? [];
}