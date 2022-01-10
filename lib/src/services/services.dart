export './app_logger.dart';

import 'package:get/get.dart';
import 'package:speed_up_kit/src/services/app_logger.dart';

Future initSpeedUpKit({
  IDeveloperLogger? developerLogger,
}) async {
  Get.put<IDeveloperLogger>(developerLogger ?? DeveloperLogger());
}
