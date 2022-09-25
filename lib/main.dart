import 'package:cashfree_1/bloc/app_bloc.dart';
import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => AppBloc(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if(state is InitialState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Image.asset("assets/logo.jpg"),
                    ),
                    SizedBox(height: 25),
                    Container(
                      alignment: Alignment.centerLeft,
                      child : Text('Start Incorporation', style: TextStyle(fontSize: 24, color: Colors.grey.shade800, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text('To complete the sign up process and register your company, please make the payment', style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w300)),
                    ),
                    SizedBox(height: 30),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('\$499', style: TextStyle(fontSize: 36, color: Colors.grey.shade800, fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(Icons.check_circle),
                                SizedBox(width: 10),
                                Text('Incorporation'),
                                Spacer(),
                                Icon(Icons.check_circle),
                                SizedBox(width: 10),
                                Text('Banking'),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.check_circle),
                                SizedBox(width: 10),
                                Text('Communication'),
                                Spacer(),
                                Icon(Icons.check_circle),
                                SizedBox(width: 10),
                                Text('Offers'),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('KNOW MORE', style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),

                    ElevatedButton(onPressed: () => appBloc.add(DoPaymentEvent()), child: Text('Proceed to payment')),
                  ],
                ),
              );
            } else {
              return Text("");
            }
          },
        )
      )
    );
  }
}




