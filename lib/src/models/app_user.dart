abstract class BaseAppUser<T> {
  T get uid;
  String? get name;
  String? get email;
  bool get isAnonym;
  bool get isEmailVerified;
}
