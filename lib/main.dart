import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmp_online/classes/auth/auth_repository.dart';
import 'package:tmp_online/classes/backend/auth_bloc/auth_bloc.dart';
import 'package:tmp_online/classes/backend/favitem/bloc/fav_bloc.dart';
import 'package:tmp_online/classes/backend/product_bloc/bloc/prodcut_bloc.dart';
import 'package:tmp_online/classes/menu_items/repository/product_repo.dart';
import 'package:tmp_online/classes/usermodal/user_repo.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepo(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepo(),
        ),
        RepositoryProvider(
          create: (context) => userRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ProdcutBloc(
              productRepo: ProductRepo(),
            )..add(LoadProducts()),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepo>(),
              userRepository: context.read<userRepo>(),
            ),
          ),
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
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: whiteColor),
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
      ),
    );
  }
}
