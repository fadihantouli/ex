import 'package:xvisa/controller/main_cubit/cubit.dart';
import 'package:xvisa/controller/main_cubit/states.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/local/cach_helper.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String token=CacheHelper.getString("token");

    if(    token.isNotEmpty)
    return

      BlocProvider(create: (context) => MainCubit(),
    child: BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: MainCubit.get(context).screens[MainCubit.get(context).currentTab],
          bottomNavigationBar: CustomBottomNavigationBar(),
        );
      },
    ),
    );
    else
      return
        BlocProvider(create: (context) => MainCubit(),
          child: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                body: HomeScreen(),
               );
            },
          ),
        );
  }
}
