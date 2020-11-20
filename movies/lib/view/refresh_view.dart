import 'package:flutter/material.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/localization_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicHeader(
        failedIcon: RefreshCenterIcon(Icon(Icons.error, color: ConsColor.theme)),
        completeIcon: RefreshCenterIcon(Icon(Icons.done, color: ConsColor.theme)),
        idleIcon: RefreshCenterIcon(Icon(Icons.arrow_downward, color: ConsColor.theme)) ,
        releaseIcon: RefreshCenterIcon(Icon(Icons.refresh, color: ConsColor.theme)),
        refreshingIcon: RefreshCenterIcon(
            SizedBox(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ConsColor.theme),
              strokeWidth: 3),
          height: 15.0,
          width: 15.0,
        )),
        idleText: '',
        refreshingText: '',
        releaseText: '',
        completeText: '',
        failedText: LocalizationManger.i18n(context, 'refresh.refreshFailed'));
  }
}

class RefreshFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      loadingIcon: RefreshCenterIcon(
          SizedBox(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ConsColor.theme),
            strokeWidth: 3),
        height: 15.0,
        width: 15.0,
      )),
      canLoadingIcon: RefreshCenterIcon(Icon(Icons.autorenew, color: ConsColor.theme)),
      failedIcon: RefreshCenterIcon(Icon(Icons.error, color: ConsColor.theme)),
      idleIcon: RefreshCenterIcon(Icon(Icons.arrow_upward, color: ConsColor.theme)),
      idleText: '',
      loadingText: '',
      canLoadingText: '',
      noDataText: LocalizationManger.i18n(context, 'refresh.noMore'),
      failedText: LocalizationManger.i18n(context, 'refresh.loadFailed'),
    );
  }
}

class RefreshCircularIndicator extends StatelessWidget {

  final double value;
  final Color backgroundColor;

  RefreshCircularIndicator({this.value, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Center(
          child: CircularProgressIndicator(
              backgroundColor: backgroundColor,
              value: value,
              valueColor: AlwaysStoppedAnimation<Color>(ConsColor.theme)),
        ));
  }
}

class RefreshCenterIcon extends StatelessWidget {

  final Widget child;

  RefreshCenterIcon(this.child);

  @override
  Widget build(BuildContext context) {
    return Center(child: child);
  }
}