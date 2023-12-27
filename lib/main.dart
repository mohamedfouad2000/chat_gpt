import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/splash/presentation/splash.dart';
import 'package:chat_gpt/core/blocobserve.dart';
import 'package:chat_gpt/core/remote/dio_helper.dart';
import 'package:chat_gpt/core/utils/size_config.dart';
import 'package:chat_gpt/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) {
        return HomeCubit();
      },
      child: BlocConsumer<HomeCubit, HomeStates>(
        builder: (context, state) => MaterialApp(
          title: 'ChatGpt',
          debugShowCheckedModeBanner: false,
          theme: HomeCubit.get(context).islight ? lightTheme : darkTheme,
          home: const splashView(),
        ),
        listener: (context, state) => {},
      ),
    );
  }
}
