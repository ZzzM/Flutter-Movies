import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/util/constant.dart';

import 'package:movies/util/network_manager.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/refresh_view.dart';
import 'package:permission_handler/permission_handler.dart';


class SaveView extends StatefulWidget {

  final String path, url;

  const SaveView(this.path, {this.url});

  @override
  _SaveViewState createState() => _SaveViewState();
}

class _SaveViewState extends State<SaveView> {

  bool _isGranted, _isSaved;

  final _cancelToken = NetworkManager.cancelToken;

  String _totalSize, _completedSize;

  @override
  void initState() {

    _isSaved = widget.url == null;

    Permission.photos.request().then((value) {
      setState(() {
        _isGranted = value.isGranted;
      });
    });


    if (!_isSaved) {
      NetworkManager.contentLength(widget.url, cancelToken: _cancelToken).then((value) {
        setState(() {
          _totalSize = value.mb;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(child:
      Container(
        height: 150,
        child: _isGranted != null ? _bodyView: RefreshCircularIndicator()
      )
    );
  }


  Widget get _titleView {

    if (_isGranted) {
      return SizedBox();
    }

    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Center(
        child: Text(S.of(context).file_permission, style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget get _bodyView {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _titleView,
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: _downloadView
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: FlatButton(
                onPressed: () {
                  RouterManager.pop(context);
                },
                textColor: ConsColor.theme,
                child: Text(S.of(context).file_cancel),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ConsColor.theme)
                )
            )
        )
      ],
    );
  }

  Widget get _downloadView {

    if (_completedSize != null) {
      return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Center(
            child: Text('${S.of(context).file_total} $_totalSize M, ${S.of(context).file_completed} $_completedSize M',
                style: TextStyle(color: ConsColor.theme, fontSize: 18)),
          )
          //child: RefreshCircularIndicator(value: _indicatorValue, backgroundColor: Colors.black12)
      );
    }

    return FlatButton(onPressed: () async {

      if (_isGranted) {
        _save();
      } else {
        await openAppSettings();
        RouterManager.pop(context);
      }


    },
        child: Text(_isGranted ? _isSaved ?  S.of(context).file_save : '${S.of(context).file_download} (${_totalSize ?? 0} M)'
            : S.of(context).file_settings),
        textColor: Colors.white,
        color: ConsColor.theme);
  }

  _save() async {

    if (_isSaved) {
      await ImageGallerySaver.saveFile(widget.path);
      RouterManager.pop(context);
    } else {

      try {
        await NetworkManager
            .download(widget.url, widget.path,
            cancelToken: _cancelToken,
            onReceiveProgress: (count, total) {
              setState(() {
                _completedSize = count.mb;
              });
            });
        await ImageGallerySaver.saveFile(widget.path);
        RouterManager.pop(context);
      }
      catch (error) {
        print(error.toString());
      }


    }

  }


  @override
  void dispose() {
    NetworkManager.cancel(_cancelToken);
    super.dispose();
  }
}

