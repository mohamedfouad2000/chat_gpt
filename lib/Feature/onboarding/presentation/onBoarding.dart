// ignore_for_file: unused_element

import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/onboarding/presentation/widgets/onboarding_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) =>
          const Scaffold(resizeToAvoidBottomInset: false, body: BoardingBody()),
      listener: (context, state) => {},
    );
  }
}
