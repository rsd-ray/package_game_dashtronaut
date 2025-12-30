import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/puzzle_provider.dart';
import '../../styles/app_text_styles.dart';

class MovesCount extends StatelessWidget {
  const MovesCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<PuzzleProvider, int>(
      selector: (c, puzzleProvider) => puzzleProvider.movesCount,
      builder: (c, int movesCount, _) => RichText(
        text: TextSpan(
          text: 'Moves: ',
          style: AppTextStyles.body.copyWith(color: Colors.white),
          children: <TextSpan>[
            TextSpan(
              text: '$movesCount',
              style: AppTextStyles.bodyBold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
