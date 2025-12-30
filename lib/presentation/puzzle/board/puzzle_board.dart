import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../models/tile.dart';
import '../../../providers/puzzle_provider.dart';
import '../../../providers/stop_watch_provider.dart';
import '../../common/animations/utils/animations_manager.dart';
import '../../common/animations/widgets/pulse_transition.dart';
import '../../common/animations/widgets/scale_up_transition.dart';
import '../../layout/puzzle_layout.dart';
import '../../tile/tile_animated_positioned.dart';
import '../../tile/tile_content.dart';
import '../../tile/tile_gesture_detector.dart';

class PuzzleBoard extends StatelessWidget {
  PuzzleBoard({super.key});

  final FocusNode keyboardListenerFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    StopWatchProvider stopWatchProvider =
        Provider.of<StopWatchProvider>(context, listen: false);
    return ScaleUpTransition(
      delay: AnimationsManager.bgLayerAnimationDuration,
      child: Consumer<PuzzleProvider>(
        builder: (c, PuzzleProvider puzzleProvider, _) => RawKeyboardListener(
          onKey: (event) {
            puzzleProvider.handleKeyboardEvent(event);
            if (event is RawKeyDownEvent &&
                puzzleProvider.movesCount == 1 &&
                keyboardListenerFocusNode.hasFocus) {
              stopWatchProvider.start();
            }
          },
          focusNode: keyboardListenerFocusNode,
          child: Builder(
            builder: (context) {
              if (!keyboardListenerFocusNode.hasFocus) {
                FocusScope.of(context).requestFocus(keyboardListenerFocusNode);
              }
              return Center(
                child: SizedBox(
                  width: PuzzleLayout(context).containerWidth,
                  height: PuzzleLayout(context).containerWidth,
                  child: Stack(
                    children: List.generate(
                      puzzleProvider.tilesWithoutWhitespace.length,
                      (index) {
                        Tile tile =
                            puzzleProvider.tilesWithoutWhitespace[index];
                        return TileAnimatedPositioned(
                          tile: tile,
                          isPuzzleSolved: puzzleProvider.puzzle.isSolved,
                          puzzleSize: puzzleProvider.n,
                          tileGestureDetector: TileGestureDetector(
                            tile: puzzleProvider.tilesWithoutWhitespace[index],
                            tileContent: PulseTransition(
                              isActive:
                                  puzzleProvider.puzzle.tileIsMovable(tile) &&
                                      !puzzleProvider.puzzle.isSolved,
                              child: TileContent(
                                tile: tile,
                                isPuzzleSolved: puzzleProvider.puzzle.isSolved,
                                puzzleSize: puzzleProvider.n,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
