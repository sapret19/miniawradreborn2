// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:miniawradreborn2/Youtube/channel-info.dart';
// import 'package:miniawradreborn2/Youtube/keys.dart';

// import 'model/video_model.dart';

// class APIService {
//   APIService._instantiate();

//   static final APIService instance = APIService._instantiate();

//   final String _baseUrl = 'www.googleapis.com';
//   String _nextPageToken = '';

//   Future<Channel> fetchChannel({required String channelId}) async {
//     Map<String, String> parameters = {
//       'part': 'snippet, contentDetails, statistics',
//       'id': channelId,
//       'key': API_KEY,
//     };
//     Uri uri = Uri.https(
//       _baseUrl,
//       '/youtube/v3/channels',
//       parameters,
//     );
//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };

//     // Get Channel
//     var response = await http.get(uri, headers: headers);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = json.decode(response.body)['items'][0];
//       Channel channel = Channel.fromMap(data);

//       // Fetch first batch of videos from uploads playlist
//       channel.videos = await fetchVideosFromPlaylist(
//         playlistId: channel.uploadPlaylistId,
//       );
//       return channel;
//     } else {
//       throw json.decode(response.body)['error']['message'];
//     }
//   }

//   Future<List<Video>> fetchVideosFromPlaylist(
//       {required String playlistId}) async {
//     Map<String, String> parameters = {
//       'part': 'snippet',
//       'playlistId': playlistId,
//       'maxResults': '8',
//       'pageToken': _nextPageToken,
//       'key': API_KEY,
//     };
//     Uri uri = Uri.https(
//       _baseUrl,
//       '/youtube/v3/playlistItems',
//       parameters,
//     );
//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };

//     // Get Playlist Videos
//     var response = await http.get(uri, headers: headers);
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);

//       _nextPageToken = data['nextPageToken'] ?? '';
//       List<dynamic> videosJson = data['items'];

//       // Fetch first eight videos from uploads playlist
//       List<Video> videos = [];
//       videosJson.forEach(
//         (json) => videos.add(
//           Video.fromMap(json['snippet']),
//         ),
//       );
//       return videos;
//     } else {
//       throw json.decode(response.body)['error']['message'];
//     }
//   }
// }
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:miniawradreborn2/Youtube/channel-info.dart';
import 'package:miniawradreborn2/Youtube/video-list.dart';

import 'constants.dart';

class Services {
  //
  static const CHANNEL_ID = 'UCkPXqn6_7f-boUMk0pBTSbg';
  static const _baseUrl = 'www.googleapis.com';

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
      'key': Contstants.Key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // print(response.body);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<VideoList> getVideosList(
      {required String playListId, required String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '8',
      'pageToken': pageToken,
      'key': Contstants.Key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // print(response.body);
    VideoList videosList = videoListFromJson(response.body);
    return videosList;
  }
}
