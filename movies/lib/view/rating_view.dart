import 'package:movies/util/localization_manager.dart';
import 'package:flutter/material.dart';


class RatingScoreView extends StatelessWidget {

  final String text, placeholder;

  final double normalSize, noneSize;

  final Color normalColor, noneColor;


  RatingScoreView(this.text,
      {this.normalSize,
      this.noneSize,
      this.normalColor,
      this.noneColor,
      this.placeholder});

  @override
  Widget build(BuildContext context) {

    bool isVaild = text != '0';

    return Text(
      isVaild
          ? text
          : placeholder ??
              LocalizationManger.i18n(context, 'movie.none_rating'),
      style: TextStyle(
          fontSize: isVaild ? normalSize : noneSize,
          fontWeight: FontWeight.bold,
          color: isVaild ? normalColor : noneColor ?? normalColor),
    );
  }
}

class RatingStarView extends StatelessWidget {
  final num fullCount, emptyCount, halfCount;

  final Icon fullIcon, emptyIcon, halfIcon;

  RatingStarView(this.fullCount, this.fullIcon, this.emptyCount, this.emptyIcon,
      {this.halfCount, this.halfIcon});

  @override
  Widget build(BuildContext context) {
    final stars = List<Widget>();

    stars.addAll(List<Widget>.filled(fullCount, fullIcon));

    if (halfIcon != null) {
      stars.addAll(List<Widget>.filled(halfCount, halfIcon));
    }

    stars.addAll(List<Widget>.filled(emptyCount, emptyIcon));

    return Row(
      children: stars,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
