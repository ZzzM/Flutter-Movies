
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/refresh_view.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebpageView extends StatefulWidget {

  final String url;
  final String title;

  static open(BuildContext context,  String url, {String title}) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, __) {
            return FadeTransition(
                opacity: animation,
              child: WebpageView(url, title: title),
            );
          }
        )
    );
  }

  WebpageView(this.url, {this.title});

  @override
  _WebpageViewState createState() => _WebpageViewState();
}

class _WebpageViewState extends State<WebpageView> {


  bool _isFinish = false;
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title:  Text(widget.title),
          leading:BackButton(
              onPressed: () {
                _controller
                    .canGoBack()
                    .then((value) {
                  if (value) {
                    _controller.goBack();
                  } else {
                    RouterManager.pop(context);
                  }

                });
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: (){
                Share.share('${widget.title}\n${widget.url}');
              },
            )
          ],
      ),
      body: Stack(
        children: [
          WebView(
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            initialUrl: Uri.encodeFull(widget.url),
            onPageStarted: (_) {
              setState(() {
                _isFinish = false;
              });
            },
            onPageFinished: (_) {
              setState(() {
                _isFinish = true;
              });
            },
          ),
          _isFinish ? Stack() : RefreshCircularIndicator()
        ],
      )

    );
  }

}


