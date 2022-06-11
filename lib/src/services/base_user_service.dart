import 'package:get/get.dart';
import 'package:speed_up_get/speed_up_get.dart';

import '../models/models.dart';
import 'user_profile_service.dart';

abstract class UserBaseService extends GetxService with GetxSubscribing {
  UserBaseService({
    IBaseUserProfileService? service,
    this.onAuthStateChange,
  }) : _service = service ?? Get.find();

  final IBaseUserProfileService _service;
  final Function(BaseAppUser user)? onAuthStateChange;

  BaseAppUser get user => _service.user;

  @override
  void onInit() {
    super.onInit();
    subscribe(
      _service.user$,
      onAuthStateChange ??
          (BaseAppUser user) async {
            if (user.isAnonym) {
              onLogout();
            } else {
              if (!user.isEmailVerified) {
                return;
              }
              onLogin();
            }
          },
    );
  }

  void onLogout();
  void onLogin();
}
