import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:movies/util/router_manager.dart';
import 'package:flutter/material.dart';
import 'package:movies/view/refresh_view.dart';
import 'package:movies/view/save_view.dart';

import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PlayerView extends StatefulWidget {
  static open(BuildContext context, String url, {String title}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: PlayerView(url, title: title),
              );
            }
        )
    );
  }

  final String url;
  final String title;

  PlayerView(this.url, {this.title});

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String _path;

  @override
  void initState() {
    getTemporaryDirectory().then((value) async {
      _path = '${value.path}/${DefaultCacheManager.key}/${widget.title}.mp4';

      if (await _isExist) {
        _videoPlayerController = VideoPlayerController.file(_file);
      } else {
        _videoPlayerController = VideoPlayerController.network(widget.url);
      }

      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: 16 / 9,
          autoPlay: false,
          looping: true,
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.portraitUp
          ],
          deviceOrientationsOnEnterFullScreen: [
            DeviceOrientation.landscapeRight,
           // DeviceOrientation.landscapeLeft,
          ]);

      setState(() {});
    });

    super.initState();
  }

  File get _file => File(_path);

  Future<bool> get _isExist async {
    return await _file.exists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => RouterManager.pop(context)),
          actions: [_chewieController != null ? _saveWidget : SizedBox()],
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: _chewieController != null &&
                _chewieController.videoPlayerController.value.initialized
                ? Chewie(controller: _chewieController)
                : RefreshCircularIndicator()
        )
    );
  }

  Widget get _saveWidget {
    return IconButton(
        icon: Icon(Icons.save),
        onPressed: () async {
          final _url = await _isExist ? null : widget.url;
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return SaveView(_path, url: _url);
              });
        });
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    _chewieController.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }
}
