import '../models/models.dart';

abstract class IBaseUserProfileService {
  Stream<BaseAppUser> get user$;
  BaseAppUser get user;
}
