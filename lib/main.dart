import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_theme/share_preference_controller.dart';
import 'package:switch_theme/theme/bloc/theme_bloc.dart';
import 'package:switch_theme/theme/bloc/theme_event.dart';

import 'theme/app_theme.dart';
import 'theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceController.init();

  runApp(BlocProvider(
    create: (context) => ThemeBloc()..add(SetInitialTheme()),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state
              ? AppTheme(AppColors.darkColors).getTheme()
              : AppTheme(AppColors.mainColors).getTheme(),
          home: Scaffold(
            appBar: AppBar(
              actions: [
                Switch(
                    value: state,
                    onChanged: (_) =>
                        context.read<ThemeBloc>().add(ChangeTheme()))
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Headline Text',
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.headlineLarge!.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'This is an example of a paragraph text.',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Navigate to Second Page'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
