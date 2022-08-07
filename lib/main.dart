import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmp_online/classes/backend/favitem/bloc/fav_bloc.dart';
import 'package:tmp_online/components/constants.dart';
import 'package:tmp_online/screens/admin_panel.dart/admin_page.dart';
import 'package:tmp_online/screens/home_screen_menu.dart';
import 'package:tmp_online/screens/login_screen.dart';
import 'package:tmp_online/screens/register_screen.dart';
import 'package:tmp_online/simple_bloc_obser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FavBloc()..add(StarItem()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: purpleColor,
          scaffoldBackgroundColor: blackColor,
          textTheme: TextTheme(
            headline1: GoogleFonts.poppins(
                fontSize: 30.0, fontWeight: FontWeight.bold, color: whiteColor),
            headline6: TextStyle(fontSize: 30.0, color: blackColor),
            bodyText2: GoogleFonts.poppins(fontSize: 20.0, color: blackColor),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const RegisterScreen(),
          '/loginscreen': (context) => const LoginScreen(),
          '/homescreen': (context) => const HomeScreenWithMenu(),
          '/adminpanel': (context) => const AdminPanel(),
        },
      ),
    );
  }
}
