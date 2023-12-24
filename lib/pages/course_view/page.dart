import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:course_view/utils/download.dart';
import 'package:course_view/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../model.dart';
import '../../widgets/dialog.dart';
import '../../widgets/list_tile.dart';
import '../../widgets/snack_bar.dart';

class CourseViewPage extends StatefulWidget {
  const CourseViewPage({
    Key? key,
    required this.videoModel,
  }) : super(key: key);
  final VideoModel videoModel;

  @override
  State<CourseViewPage> createState() => _CourseViewPageState();
}

class _CourseViewPageState extends State<CourseViewPage> {
  late VideoPlayerController _videoController1;
  late VideoPlayerController _videoController2;
  ChewieController? _chewieController;
  int? bufferDelay;
  bool completed = false;
  bool isDownloaded = false;
  bool dialogIsOpened = false;

  @override
  void initState() {
    initializePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _videoController1.dispose();
    _videoController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    final offlineFile = await getOfflineVideoFile;

    if (offlineFile != null) {
      setState(() => isDownloaded = true);
      _videoController1 = VideoPlayerController.file(offlineFile);
      _videoController2 = VideoPlayerController.file(offlineFile);
    } else {
      final url = Uri.parse(widget.videoModel.url);
      _videoController1 = VideoPlayerController.networkUrl(url);
      _videoController2 = VideoPlayerController.networkUrl(url);
    }

    await Future.wait([
      _videoController1.initialize(),
      _videoController2.initialize(),
    ]);

    _createChewieController();
    completed = true;
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
    );
  }

  Future<File?> get getOfflineVideoFile async {
    final Directory dir = await Download.downloadDirectory;
    final videoPath = '${dir.path}/${widget.videoModel.id}.mp4';
    final file = File(videoPath);
    return await file.exists() ? file : null;
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

  bool get _canPlayVideo {
    return completed &&
        _chewieController != null &&
        _chewieController!.videoPlayerController.value.isInitialized;
  }

  Future<void> downloadVideo() async {
    final url = widget.videoModel.url;
    final id = widget.videoModel.id;

    _showLoadingSpinner();

    final result = await Download.downloadForOffline(url, id);

    if (result) {
      _showSuccessSnackbar();
      setState(() => isDownloaded = true);
    } else {
      _showErrorSnackbar();
    }
    _dismissLoadingSpinner();
  }

  void _showLoadingSpinner() {
    dialogIsOpened = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LoadingSpinnerDialog();
      },
    ).then((value) => dialogIsOpened = false);
  }

  void _dismissLoadingSpinner() {
    if (dialogIsOpened) {
      Navigator.of(context).pop();
    }
  }

  void _showSuccessSnackbar() {
    showSuccessSnackbar(context, 'Video now available for offline view.');
  }

  void _showErrorSnackbar() {
    showErrorSnackbar(context, 'Download failed due to network error!');
  }

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
        padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 25.0),
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
                ActionButton(
                  onPressed: () {},
                  iconData: CupertinoIcons.link,
                  text: 'Share',
                )
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: <Widget>[
                _ratingWidget(context),
                const SizedBox(width: 8.0),
                _watchedWidget(context),
                const Spacer(),
                if (isDownloaded)
                  ActionButton(
                    onPressed: () {},
                    iconData: Icons.download_done_rounded,
                    color: Colors.green,
                    text: 'Offline',
                  )
                else
                  ActionButton(
                    onPressed: downloadVideo,
                    iconData: Icons.download_for_offline,
                    text: 'Download',
                  ),
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
            const SizedBox(height: 30.0),
            Text(
              'Curriculum',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              'Learn-by doing with our Exclusion Videos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Our Course is setup to make you learn Advanced Audit and '
              'Assurance(Revision) by step with a practical detailed note/'
              'video that focuses 100% on learn-by-doing',
              style: TextStyle(
                color: Colors.grey.shade700,
                wordSpacing: 1,
              ),
            ),
            const SizedBox(height: 8.0),
            CourseListTile(
              onPressed: () {},
              code: 'C1',
              title: 'Conceptual and regulatory framework',
              isUnlocked: true,
            ),
            CourseListTile(
              onPressed: () {},
              code: 'C2',
              title: 'Conceptual and regulatory framework',
              isUnlocked: true,
            ),
            CourseListTile(
              onPressed: () {},
              code: 'C3',
              title: 'Conceptual and regulatory framework',
              subtitle: 'Video - 02:56 mins',
              isUnlocked: false,
            ),
            CourseListTile(
              onPressed: () {},
              code: 'C4',
              title: 'Conceptual and regulatory framework',
              subtitle: 'Video - 02:56 mins',
              isUnlocked: false,
            ),
            CourseListTile(
              onPressed: () {},
              code: 'C5',
              title: 'Conceptual and regulatory framework',
              subtitle: 'Video - 02:56 mins',
              isUnlocked: false,
            ),
            CourseListTile(
              onPressed: () {},
              code: 'C6',
              title: 'Conceptual and regulatory framework',
              subtitle: 'Video - 02:56 mins',
              isUnlocked: false,
            ),
          ],
        ),
      ),
    );
  }
}
