abstract class DprState {}

class DprInitial extends DprState {}

class DprSubmitting extends DprState {}

class DprSuccess extends DprState {}

class DprFailure extends DprState {
  final String message;

  DprFailure(this.message);
}
