import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CourseViewPage extends StatefulWidget {
  const CourseViewPage({Key? key}) : super(key: key);

  @override
  State<CourseViewPage> createState() => _CourseViewPageState();
}

class _CourseViewPageState extends State<CourseViewPage> {
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    initializePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  List<String> srcs = [
    "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"
  ];

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
    _videoPlayerController2 =
        VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
    await Future.wait([
      _videoPlayerController1.initialize(),
      _videoPlayerController2.initialize()
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    // final subtitles = [
    //     Subtitle(
    //       index: 0,
    //       start: Duration.zero,
    //       end: const Duration(seconds: 10),
    //       text: 'Hello from subtitles',
    //     ),
    //     Subtitle(
    //       index: 0,
    //       start: const Duration(seconds: 10),
    //       end: const Duration(seconds: 20),
    //       text: 'Whats up? :)',
    //     ),
    //   ];

    final subtitles = [
      Subtitle(
        index: 0,
        start: Duration.zero,
        end: const Duration(seconds: 10),
        text: const TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: 'Hello',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            TextSpan(
              text: ' from ',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            TextSpan(
              text: 'subtitles',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            )
          ],
        ),
      ),
      Subtitle(
        index: 0,
        start: const Duration(seconds: 10),
        end: const Duration(seconds: 20),
        text: 'Whats up? :)',
        // text: const TextSpan(
        //   text: 'Whats up? :)',
        //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
        // ),
      ),
    ];

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      // autoPlay: false,
      // looping: false,
      // hideControlsTimer: const Duration(seconds: 8),
      subtitle: Subtitles(subtitles),
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

      // additionalOptions: (context) {
      //   return <OptionItem>[
      //     OptionItem(
      //       onTap: toggleVideo,
      //       iconData: Icons.live_tv_sharp,
      //       title: 'Toggle Video Src',
      //     ),
      //   ];
      // },
      subtitleBuilder: (context, dynamic subtitle) {
        return IgnorePointer(
          child: subtitle is InlineSpan
              ? RichText(
                  text: subtitle,
                )
              : Text(
                  subtitle.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
        );
      },

      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      placeholder: Container(
        color: Colors.red,
      ),
    );
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex += 1;
    if (currPlayIndex >= srcs.length) {
      currPlayIndex = 0;
    }
    await initializePlayer();
  }

  Widget _subtitleWidget() => Row(
        children: [
          Icon(
            Icons.language_rounded,
            color: Colors.red.shade700,
          ),
          const SizedBox(width: 8.0),
          Text(
            'English subtitle',
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      );

  Widget _shareButton() => MaterialButton(
        onPressed: () {},
        elevation: 0.0,
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Row(
          children: <Widget>[
            Icon(CupertinoIcons.link, size: 16),
            SizedBox(width: 8.0),
            Text(
              'Share',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );

  Widget _ratingWidget(BuildContext context) => Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Theme.of(context).primaryColor,
          ),
          const Text('4.1'),
        ],
      );

  Widget _watchedWidget(BuildContext context) => Row(
        children: <Widget>[
          Icon(
            Icons.people_alt,
            color: Theme.of(context).primaryColor,
          ),
          const Text('2,363'),
        ],
      );

  Widget _infoWidget() => const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            CupertinoIcons.info,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              'This package selected on choice of offer for the course, we strongly advice to go for a better choice.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );

  bool get _canPlayVideo =>
      _chewieController != null &&
      _chewieController!.videoPlayerController.value.isInitialized;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course View'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.lock_outline_rounded,
              color: Colors.blueGrey.shade600,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _canPlayVideo
                  ? Chewie(controller: _chewieController!)
                  : Container(
                      color: Colors.grey.withOpacity(.3),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Basic Accounting Process and Systems',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                _subtitleWidget(),
                const Spacer(),
                _shareButton()
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: <Widget>[
                _ratingWidget(context),
                const SizedBox(width: 8.0),
                _watchedWidget(context),
              ],
            ),
            const SizedBox(height: 10.0),
            _infoWidget(),
            const SizedBox(height: 30.0),
            Text(
              'Course Description',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Kickstart and accelerate your career as an Advanced Audit '
              'and Assurance personnel from this revision course tailored '
              'to bring the best in you. The detailed study notes, standards '
              'questions and answers, past questions trend also serve as '
              'important course material necessary to broaden your '
              'understanding of the course.',
              style: TextStyle(
                color: Colors.grey.shade700,
                wordSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
