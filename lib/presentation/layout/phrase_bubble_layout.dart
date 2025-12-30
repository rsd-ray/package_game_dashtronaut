import 'package:flutter/cupertino.dart';

import '../../models/position.dart';
import 'dash_layout.dart';
import 'layout_delegate.dart';
import 'screen_type_helper.dart';

enum PhraseState {
  none,
  puzzleStarted,
  puzzleSolved,
  hardPuzzleSelected,
  puzzleTakingTooLong,
  dashTapped,
  doingGreat,
}

class PhraseBubbleLayout implements LayoutDelegate {
  @override
  final BuildContext context;

  PhraseBubbleLayout(this.context);

  @override
  ScreenTypeHelper get screenTypeHelper => ScreenTypeHelper(context);

  DashLayout get _dash => DashLayout(context);

  Position get position {
    switch (screenTypeHelper.type) {
      case ScreenType.xSmall:
      case ScreenType.small:
        return Position(
          right: _dash.size.width + (_dash.position.right ?? 0) - 20,
          bottom: (_dash.size.height * 0.1) + (_dash.position.bottom ?? 0),
        );
      case ScreenType.medium:
        return Position(
          right: _dash.size.width + (_dash.position.right ?? 0) - 40,
          bottom: _dash.position.bottom,
        );
      case ScreenType.large:
        return Position(
          right: _dash.size.width + (_dash.position.right ?? 0) - 70,
          bottom: (_dash.size.height * 0.1) + (_dash.position.bottom ?? 0),
        );
    }
  }
}
