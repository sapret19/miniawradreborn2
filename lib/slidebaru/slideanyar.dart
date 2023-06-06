import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/slider/api_service_slider.dart';
import 'package:miniawradreborn2/slider/slider_model.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';


Widget Slide22() {
  return FutureBuilder<List<SliderModel>?>(
    future: APIService.getSliderData(),
    builder:
        (BuildContext context, AsyncSnapshot<List<SliderModel>?> sliderModel) {
      if (sliderModel.hasData && sliderModel.data != null) {
        return Container(
            width: MediaQuery.of(context).size.width,
            child: Caraousel(sliderModel.data!));
      }

      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

Widget Caraousel(List<SliderModel> sliderList) {
  return CarouselSlider(
    items: sliderList.map((model) {
      return CachedNetworkImage(
        imageUrl: model.url,
        fit: BoxFit.cover,
        width: 100.w,
        alignment: Alignment.bottomCenter,
        placeholder: (context, url) => Placeholder(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        cacheManager: DefaultCacheManager(),
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
