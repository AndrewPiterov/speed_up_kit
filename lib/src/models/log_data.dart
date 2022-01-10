import 'package:equatable/equatable.dart';

enum Loglevel {
  info,
  warning,
  error,
}

class AppLogData extends Equatable {
  const AppLogData(this.dt, this.level, this.message);

  final DateTime dt;
  final Loglevel level;
  final String message;

  @override
  List<Object?> get props => [
        dt,
        level,
        message,
      ];
}
