import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todaily/core/common/pages/launch/launch_page.dart';
import 'package:todaily/core/common/providers/profile_provider.dart';
import 'package:todaily/core/config/env.dart';
import 'package:todaily/core/services/dependency_injection.dart';
import 'package:todaily/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:todaily/features/on_boarding/presentation/blocs/on_boarding/on_boarding_bloc.dart';
import 'package:todaily/features/profile/presentation/blocs/profile/profile_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnBoardingBloc>(
          create: (_) => sl<OnBoardingBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (_) => sl<ProfileBloc>(),
        ),
      ],
      child: ChangeNotifierProvider<ProfileProvider>(
        create: (_) => ProfileProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kAppName,
          home: LaunchPage(),
        ),
      ),
    );
  }
}
