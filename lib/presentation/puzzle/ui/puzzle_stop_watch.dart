import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/duration_helper.dart';
import '../../../providers/stop_watch_provider.dart';
import '../../styles/app_text_styles.dart';

class PuzzleStopWatch extends StatelessWidget {
  const PuzzleStopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StopWatchProvider>(
      builder: (c, stopWatchProvider, _) {
        Duration duration = Duration(seconds: stopWatchProvider.secondsElapsed);

        return Text(
          DurationHelper.toFormattedTime(duration),
          style: AppTextStyles.bodyBold,
        );
      },
    );
  }
}
