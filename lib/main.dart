import 'package:flutter/material.dart';
import '../screens/screens.dart';
import 'package:provider/provider.dart';
import './providers/providers.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<bool>('local');
  await Hive.openBox<String>('auth');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Boxes.getAuthBox();
    String? token = box.get('token');
    bool isToken;
    if(token != 'error' && token!='' && token!=null) {
      isToken = true;
    } else {
      isToken = false;
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        showSemanticsDebugger: false,
        builder: EasyLoading.init(),
        title: 'School Management System Dashboard',
        theme: ThemeData(
            //primarySwatch: Colors.blue,
            ),
        initialRoute: !isToken?'/login':'/main',
        routes: {
          '/main': (context) => const MainScreen(),
          '/login':(context) => const LoginScreen(),
        },
      ),
    );
  }
}
