import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_event.dart';
import 'package:flutter_app/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'viewmodels/login_viewmodel.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';

void main() {
  runApp( const MyApp());
  
}

class MyApp extends StatelessWidget {
  LoginViewModel get loginViewModel => LoginViewModel();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(loginViewModel)..add(AppStarted()),
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 22, 23, 43),
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.grey,
            displayColor: Colors.grey,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF16172B),
            titleTextStyle: TextStyle(color: Colors.grey, fontSize: 20),
            iconTheme: IconThemeData(color: Colors.grey),
          ),
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              return const HomePage();
            } else if (state is AuthUnauthenticated) {
              return LoginPage();
            }
            return LoginPage();
          },
        ),
      ),
    );
  }
}
