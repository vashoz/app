import 'core/config/config.dart';
import 'core/shared/shared.dart';
import 'features/onboard/onboard.dart';
import 'features/cart/cart.dart';
import 'features/favorite/favorite.dart';

void main() async {
  await AppConfig.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeBloc>()),
        BlocProvider(create: (_) => sl<OnboardBloc>()),
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
            darkTheme: AppConfig.themeData(context: context, mode: ThemeMode.dark),
          );
        },
      ),
    );
  }
}
