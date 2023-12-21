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
    id: 'vid3',
    url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
];
