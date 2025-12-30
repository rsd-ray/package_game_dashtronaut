import 'package:flutter/material.dart';

import '../../common/animations/utils/animations_manager.dart';
import '../../common/animations/widgets/fade_in_transition.dart';
import '../../layout/puzzle_layout.dart';
import '../../layout/spacing.dart';
import '../../styles/app_text_styles.dart';
import 'correct_tiles_count.dart';
import 'moves_count.dart';
import 'puzzle_stop_watch.dart';

class PuzzleHeader extends StatelessWidget {
  const PuzzleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    PuzzleLayout puzzleLayout = PuzzleLayout(context);

    return FadeInTransition(
      delay: AnimationsManager.bgLayerAnimationDuration,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('Dashtronaut', style: AppTextStyles.title),
            const SizedBox(height: 5),
            const Text(
              'Solve This Slide Puzzle..',
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 8),
            Wrap(
              runSpacing: 5,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: (puzzleLayout.containerWidth / 3) - Spacing.md),
                  child: const PuzzleStopWatch(),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: (puzzleLayout.containerWidth / 3) - Spacing.md),
                  child: const MovesCount(),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: (puzzleLayout.containerWidth / 3) - Spacing.md),
                  child: const CorrectTilesCount(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
