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

class slider_widget extends StatefulWidget {
  const slider_widget({super.key});

  @override
  State<slider_widget> createState() => _slider_widgetState();
}

Future<void> saveSliderData(List<String> sliderUrls) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('sliderUrls', sliderUrls);
}

class _slider_widgetState extends State<slider_widget> {
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
      body: sliderBuilder(),
    );
  }
}

Widget sliderBuilder() {
  return FutureBuilder<List<SliderModel>?>(
    future: APIService.getSliderData(),
    builder: (BuildContext context, AsyncSnapshot<List<SliderModel>?> sliderModel) {
      if (sliderModel.connectionState == ConnectionState.done) {
        if (sliderModel.hasData && sliderModel.data != null) {
          // Simpan data slider secara lokal
          final sliderUrls = sliderModel.data!.map((model) => model.url).toList();
          saveSliderData(sliderUrls);

          return Container(
            width: MediaQuery.of(context).size.width,
            child: imageCarousel(sliderModel.data!),
          );
        } else {
          // Mengambil data slider dari penyimpanan lokal
          return Container(
            width: MediaQuery.of(context).size.width,
            child: offlineImageCarousel(),
          );
        }
      }

      return Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: offlineImageCarousel(),
          )
      );
    },
  );
}



Widget imageCarousel(List<SliderModel> sliderList) {
  return CarouselSlider(
    items: sliderList.map((model) {
      return CachedNetworkImage(
        imageUrl: model.url,
        fit: BoxFit.cover,
        width: 100.w,
        alignment: Alignment.bottomCenter,
        placeholder: (context, url) => Container(color: Colors.black38,),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }).toList(),
    options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 12.5 / 16,
        autoPlayCurve: Curves.decelerate,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1),
  );
}


Widget offlineImageCarousel() {
  return FutureBuilder<List<String>>(
    future: getOfflineSliderData(),
    builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
        final sliderUrls = snapshot.data!;
        if (sliderUrls.isNotEmpty) {
          return imageCarousel(
            sliderUrls.map((url) => SliderModel(url)).toList(),
          );
        } else {
          return Text('Tidak ada data slider yang tersimpan.');
        }
      }

      return Placeholder();
    },
  );
}

Future<List<String>> getOfflineSliderData() async {
  final prefs = await SharedPreferences.getInstance();
  final sliderUrls = prefs.getStringList('sliderUrls');
  return sliderUrls ?? [];
}