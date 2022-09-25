part of 'app_bloc.dart';



@immutable
abstract class AppState {
  const AppState();
}

@immutable
class InitialState extends AppState{
  const InitialState();
}
@immutable
class PaymentState extends AppState{
  const PaymentState();
}