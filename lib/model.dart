import 'dart:io';

class VideoModel {
  VideoModel({
    required this.id,
    required this.url,
  });
  final String id;
  final String url;
}

final List<VideoModel> videos = [
  VideoModel(
    id: 'vid1',
    url:
        'https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4',
  ),
  VideoModel(
    id: 'vid2',
    url:
        'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4',
  ),
  VideoModel(
    id: 'vid3',
    url:
        'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
  ),
  VideoModel(
    id: 'vid4',
    url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
];

class Course {
  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.videos,
    required this.creationTime,
  });
  final String id;
  final String title;
  final String description;
  final File thumbnail;
  final List<Video> videos;
  final DateTime creationTime;
}

class Video {
  Video({
    required this.id,
    required this.url,
    required this.duration,
    required this.isUnlocked,
  });
  final String id;
  final String url;
  final Duration duration;
  final bool isUnlocked;
}
