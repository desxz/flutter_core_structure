import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'core/managers/theme/manager/theme_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SplashView());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: context.theme,
      home: const HomeView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager.instance),
      ],
      child: MyApp(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    context.read<ThemeManager>().addListener(() {
      if (ThemeManager.instance.currentThemeEnum == ThemeEnum.LIGHT) {
        _controller.animateTo(0, duration: const Duration(milliseconds: 1000));
      } else {
        _controller.animateTo(0.5,
            duration: const Duration(milliseconds: 1000));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () async => await Future.delayed(
                const Duration(milliseconds: 200),
                () => ThemeManager.instance.changeTheme(
                    ThemeManager.instance.currentThemeEnum == ThemeEnum.LIGHT
                        ? ThemeEnum.DARK
                        : ThemeEnum.LIGHT),
              ),
              child: Lottie.asset(
                'assets/lottie/47047-dark-mode-button.json',
                width: 60,
                controller: _controller,
              ),
            ),
          ),
        ],
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
