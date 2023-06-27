import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miniawradreborn2/Youtube/channel-info.dart';
import 'package:miniawradreborn2/Youtube/service.dart';
import 'package:miniawradreborn2/Youtube/video-list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class Data_yt extends StatefulWidget {
//   const Data_yt({super.key});

//   @override
//   State<Data_yt> createState() => _Data_ytState();
// }

// class _Data_ytState extends State<Data_yt> {
//   late ChannelInfo _channelInfo;
//   late VideoList _videoList;
//   late Item _item;
//   late bool loading;
//   late String _playllistid;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loading = true;
//     // _videoList = VideoList();
//     // _videoList.items = List();
//     _getChannelInfo();
//   }

//   _getChannelInfo ()async {
//     _channelInfo = (await Services.getChannelInfo())!;
//     _item = _channelInfo.items[0];
//     _playllistid = _item.contentDetails.relatedPlaylists.uploads;
//     print('_playlistid $_playllistid');
//     setState(() {
//       loading = false;
//     });
//   }
  
//   _loadVideo() async {
//     VideoList? tempVideoList = await Services.getVideolist();
//   }
  
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Vidio Youtube'),),
//       body: Container(
//         child: Column(
//           children: [
//             _buildInfoView()
//           ],
//         ),
//       ),
//     );
//   }
//   _buildInfoView(){
//     return loading ? CircularProgressIndicator() : 
//     Container(
//       child: Card(
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: CachedNetworkImageProvider(_item.snippet.thumbnails.medium.url),
//             ),
//             SizedBox(width: 20,),
//             Text(_item.snippet.title),
//             // Text(_item.statistics.videoCount)
//           ],
//         ),
//       ),
//     );
//   }
// }

class DynamicYouTubeVideoPage extends StatefulWidget {
  @override
  _DynamicYouTubeVideoPageState createState() => _DynamicYouTubeVideoPageState();
}

class _DynamicYouTubeVideoPageState extends State<DynamicYouTubeVideoPage> {
  String apiKey = 'AIzaSyDalpOpjp01EGOcWVLWEEAyiJuBhWW_pIU';
  String channelId = 'UCkPXqn6_7f-boUMk0pBTSbg';
  String maxResults = '10'; // Jumlah video yang ingin ditampilkan

   List<dynamic> videos = [];

  @override
  void initState() {
    super.initState();
    getYouTubeVideos();
  }

  Future<void> getYouTubeVideos() async {
    String apiUrl =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$channelId&maxResults=$maxResults&key=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        var decodedResponse = json.decode(response.body);
        videos = decodedResponse['items'];
      });
    } else {
      print('Failed to load videos');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic YouTube Video'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) {
          var videoId = videos[index]['id']['videoId'];
          String videoTitle = videos[index]['snippet']['title'];
          String thumbnailUrl = getThumbnailUrl(videos[index]['snippet']['thumbnails']);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoDetailPage(
                    videoId: videoId,
                    videoTitle: videoTitle,
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    child: Image.network(
                      thumbnailUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      videoTitle,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String getThumbnailUrl(Map<String, dynamic> thumbnails) {
  if (thumbnails.containsKey('medium')) {
    return thumbnails['medium']['url'];
  } else if (thumbnails.containsKey('default')) {
    return thumbnails['default']['url'];
  } else if (thumbnails.containsKey('high')) {
    return thumbnails['high']['url'];
  }

  return '';
}
}



   

class VideoDetailPage extends StatelessWidget {
  final String videoId;
  final String videoTitle;

  VideoDetailPage({required this.videoId, required this.videoTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(videoTitle),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: videoId,
            flags: YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
      ),
    );
  }
}