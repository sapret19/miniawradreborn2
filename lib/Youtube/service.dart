import 'dart:io';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:miniawradreborn2/Youtube/channel-info.dart';
import 'package:miniawradreborn2/Youtube/constants.dart';
import 'package:http/http.dart'as http;
import 'package:miniawradreborn2/Youtube/video-list.dart';

class Services {
  static const Channel_id = 'UCkPXqn6_7f-boUMk0pBTSbg';
  static const _baseURL = 'www.googleapis.com';

  static Future<ChannelInfo?> getChannelInfo ()async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics', 
      'id' : Channel_id,
      'key' : Contstants.Key
    };
    Map<String, String> Headers = {
      HttpHeaders.contentTypeHeader: 'application/json'


    };
    Uri uri = Uri.https(_baseURL, '/youtube/v3/channels', parameters);
    http.Response response = await http.get(uri, headers: Headers);
    print(response.body);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo; 
  }
  static Future<VideoList?> getVideolist({required String playListId, required String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playListId' : playListId,
      'maxResults' : '8',
      'pageToken' : pageToken,
      'key' : Contstants.Key
    };
    Map<String, String> Headers = {
      HttpHeaders.contentTypeHeader: 'application/json'


    };
    Uri uri = Uri.https(_baseURL, '/youtube/v3/playlistItems', parameters);
    http.Response response = await http.get(uri, headers: Headers);
    print(response.body);
    VideoList videoList = videoListFromJson(response.body);
    return videoList;

    // return channelInfo; 
  }
}