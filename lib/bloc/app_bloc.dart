import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'app_event.dart';
part 'app_state.dart';

var response = "";

Function? buttonTapHandler() {

  Map<String, String> inputParams = {
    "orderId": "1117",
    "orderAmount": "10",
    "appId": "238570c50a442c19411239184a075832",
    "orderCurrency": "INR",
    "customerNmae": "Aman",
    "customerPhone": "7617725789",
    "customerEmail": "brainyboy777@gmail.com",
    "stage": "TEST",
    "tokenData": "jX9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.VgQfiIGNykjY1cTNiNmMzYjI6ICdsF2cfJCLxIDN2YDN2YjNxojIwhXZiwiIwEjI6ICduV3btFkclRmcvJCLiIlTJJiOik3YuVmcyV3QyVGZy9mIsIyNxETMiojIklkclRmcvJye.cr_sm4xEHt9rHJYT-e-3sAcaAUD4OxibPeLdTyHD4pwthp59dU5lI84ZY1UJmrdRxZ",
    "orderNote": "this is an optional field",
    "notifyUrl": ""
  };
  CashfreePGSDK.doPayment(inputParams)
      .then((value) => value?.forEach((key, value) {
    print("$key : $value");
    response += "\"$key\": \"$value\"\n";
  })
  );
}


class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc() : super(const InitialState()) {
  on<DoPaymentEvent> ((event, emit) async {
    buttonTapHandler();
    emit(InitialState());
  });
  }
}

