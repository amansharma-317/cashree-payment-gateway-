part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

@immutable
class DoPaymentEvent implements AppEvent {

  const DoPaymentEvent();
}