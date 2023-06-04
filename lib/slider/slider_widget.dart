import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/slider/api_service_slider.dart';
import 'package:miniawradreborn2/slider/slider_model.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class slider_widget extends StatefulWidget {
  const slider_widget({super.key});

  @override
  State<slider_widget> createState() => _slider_widgetState();
}

class _slider_widgetState extends State<slider_widget> {
  @override
  Widget build(BuildContext context) {
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
    builder:
        (BuildContext context, AsyncSnapshot<List<SliderModel>?> sliderModel) {
      if (sliderModel.hasData && sliderModel.data != null) {
        return Container(
            width: MediaQuery.of(context).size.width, child: Coba());
      }

      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

Widget imageCarousel(List<SliderModel> sliderList) {
  return CarouselSlider(
    items: sliderList.map((model) {
      return CachedNetworkImage(
        imageUrl: model.url,
        // placeholder: (context, url) => CircularProgressIndicator(),
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter)),
          );
        },
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

class Coba extends StatefulWidget {
  const Coba({Key? key});

  @override
  State<Coba> createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  List<SliderModel> responsemodel = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchresponsemodel();
  }

  Future<void> fetchresponsemodel() async {
    try {
      final List<SliderModel>? urls = await APIService.getSliderData();
      setState(() {
        responsemodel = urls!;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CSlider(responsemodel);
  }

  Widget CSlider(List<SliderModel> sliderList) {
    if (sliderList.isEmpty) {
      return CircularProgressIndicator();
    } else {
      return CarouselSlider(
        items: sliderList.map((model) {
          return CachedNetworkImage(
            imageUrl: model.url,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter)),
              );
            },
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
  }
}
