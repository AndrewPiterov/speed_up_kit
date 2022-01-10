import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:speed_up/speed_up.dart';
import 'package:speed_up_kit/src/models/models.dart';
import 'package:speed_up_kit/src/services/services.dart';
import 'package:speed_up_get/speed_up_get.dart';

class DeveloperLogsScreenController extends GetxController {
  DeveloperLogsScreenController({
    IDeveloperLogger? logger,
  }) : _logger = logger ?? Get.find();
  final IDeveloperLogger _logger;

  List<AppLogData> get logs => _logger.logs.toList();
}

class DeveloperLogsScreen extends GetView<DeveloperLogsScreenController> {
  const DeveloperLogsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeveloperLogsScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logs'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            itemBuilder: (_, i) => _logItem(c.logs.elementAt(i)),
            separatorBuilder: (_, __) => 10.h,
            itemCount: c.logs.length,
          ),
        ),
      ),
    );
  }

  Widget _logItem(AppLogData log) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '[${log.level.title.toLowerCase()}]',
          style: TextStyle(
            color: log.level == Loglevel.error
                ? Colors.red
                : log.level == Loglevel.error
                    ? Colors.amber
                    : Colors.blue,
          ),
        ),
        10.w,
        Expanded(child: Text(log.message)),
      ],
    );
  }
}
