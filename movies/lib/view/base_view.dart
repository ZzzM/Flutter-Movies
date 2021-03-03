import 'package:movies/generated/l10n.dart';
import 'package:movies/util/util.dart';
import 'package:movies/view/provider_view.dart';

import 'package:movies/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:movies/view_model/locale_view_model.dart';
import 'package:provider/provider.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:movies/view/refresh_view.dart';

import 'error_view.dart';


class BaseTitleView extends StatelessWidget {

  final String text;

  BaseTitleView(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}

class BaseRefreshView<T extends BaseViewModel> extends StatelessWidget {

  final _refreshController = RefreshController();

  final T viewModel;
  final bool enablePullUp, enablePullDown, enableAppBar, transparent;
  final String title;

  BaseRefreshView({
    this.viewModel,
    this.title,
    this.enablePullDown = true,
    this.enablePullUp = false,
    this.enableAppBar = true,
    this.transparent = false,
  });


  @override
  Widget build(BuildContext context) {

    return ProviderView<T>(
        viewModel: viewModel,
        builder: (context, model, _) {
          return Scaffold(
            appBar: enableAppBar ? AppBar(
              centerTitle: true,
                backgroundColor: transparent ? Colors.transparent: null,
                title: Consumer<LocaleViewModel>(
                  builder: (context, _, __) {
                    return _appBarView(context);
                  }
                )
            ) : null,
            body: SmartRefresher(
              controller: _refreshController,
              header: RefreshHeader(),
              footer: enablePullUp ? RefreshFooter():null,
              enablePullDown: enablePullDown ? !model.refreshNoData: false,
              enablePullUp: enablePullUp ? !model.refreshNoData : false,
              onRefresh: model.onRefresh,
              onLoading: enablePullUp ? model.onLoading : null,
              child: _refreshChild(context, viewModel),
            ),
          );
        }
    );
  }


  Widget _refreshChild(BuildContext context, T viewModel) {

    final state = viewModel.viewState;

    if (state == ViewState.onRefresh && viewModel.refreshNoData) {
      return RefreshCircularIndicator();
    }

    if (state == ViewState.refreshCompleted) {
      _refreshController.resetNoData();
      _refreshController.refreshCompleted();
    }

    if (state == ViewState.refreshError) {
      _refreshController.refreshFailed();
    }

    if (state == ViewState.onLoading) {
      _refreshController.refreshToIdle();
    }

    if (state == ViewState.loadNoData) {
      _refreshController.loadNoData();
    }

    if (state == ViewState.loadComplete) {
      _refreshController.loadComplete();
    }

    if (state == ViewState.loadError) {
      _refreshController.loadFailed();
    }


    switch (state) {
      case ViewState.loadError:
      case ViewState.refreshError:
      case ViewState.empty:
        if (viewModel.refreshNoData) {
          return ErrorView(S.of(context).refresh_empty, onRefresh: viewModel.onRefresh);
        } else {
          showSnackBar(context, S.of(context).refresh_empty);
          break;
        }
    }

    return bodyView(context);

  }

  Widget _appBarView(BuildContext context) {

    List<Widget> leftItem = [], rightItem = [];

    if (leftView(context) != null) {
      leftItem = [leftView(context)];
    }

    if (rightView(context) != null) {
      rightItem = [rightView(context)];
    }

    if (leftItem.isNotEmpty || rightItem.isNotEmpty) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: leftItem,
          ),
          titleView(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: rightItem,
          ),
        ],
      );
    }

    return titleView(context);

  }

  Widget titleView(BuildContext context) {
    return Text(title);
  }

  Widget leftView(BuildContext context) {
    return null;
  }

  Widget rightView(BuildContext context) {
    return null;
  }



  Widget  bodyView(BuildContext context) {
    return RefreshCircularIndicator();
  }





}

