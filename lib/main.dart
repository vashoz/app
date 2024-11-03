import 'package:vashoz/features/cart/presentation/bloc/cart_bloc.dart';

import 'core/config/config.dart';
import 'core/shared/shared.dart';
import 'features/favorite/presentation/bloc/favorite_bloc.dart';

//streak update 2
void main() async {
  await AppConfig.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeBloc>()),
        BlocProvider(create: (_) => sl<CartBloc>()),
        BlocProvider(create: (_) => sl<FavoriteBloc>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => child!,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, state) {
          return MaterialApp.router(
            themeMode: state.mode,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: AppConfig.themeData(context: context, mode: ThemeMode.light),
            darkTheme:
                AppConfig.themeData(context: context, mode: ThemeMode.dark),
          );
        },
      ),
    );
  }
}
