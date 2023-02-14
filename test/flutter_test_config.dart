import 'dart:async';

import 'package:alchemist/alchemist.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  const isRunningOnCi = String.fromEnvironment('CI') == 'true';

  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      ciGoldensConfig: CiGoldensConfig(enabled: isRunningOnCi),
      platformGoldensConfig: PlatformGoldensConfig(enabled: !isRunningOnCi),
    ),
    run: testMain,
  );
}
