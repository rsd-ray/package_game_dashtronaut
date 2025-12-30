import 'package:flutter/cupertino.dart';

import 'screen_type_helper.dart';

abstract class LayoutDelegate {
  final BuildContext context;

  const LayoutDelegate(this.context);

  ScreenTypeHelper get screenTypeHelper;
}
