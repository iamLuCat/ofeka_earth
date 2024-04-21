import 'package:angola_sustentavel/game_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:angola_sustentavel/Utils/diagonal_path_clipper.dart';

class SplashScreenGame extends StatefulWidget {
  const SplashScreenGame({Key? key}) : super(key: key);

  @override
  _SplashScreenGameState createState() => _SplashScreenGameState();
}

class _SplashScreenGameState extends State<SplashScreenGame>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MenuGame()),
      );
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.redColor,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Stack(
            children: [
              Opacity(
                opacity: _animation.value,
                child: ClipPath(
                  clipper: DiagonalPathClipper(),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, 200 * (1 - _animation.value)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: (orientation == Orientation.portrait ? height * 0.2 : height * 0.02) * _animation.value),
                    Opacity(
                      opacity: _animation.value,
                      child: Text(
                        'Ofeka Earth',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Opacity(
                      opacity: _animation.value,
                      child: SizedBox(
                        width: (orientation == Orientation.portrait) ? 150 : 100,
                        height: (orientation == Orientation.portrait) ? 150 : 100,
                        child: Image.asset(
                          'assets/icones/logo_game.png',
                        ),
                      ),
                    ),
                    SizedBox(height: (orientation == Orientation.portrait ? height / 3.5 : height / 10) * _animation.value),
                    Center(
                      child: Opacity(
                        opacity: _animation.value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'PROTECT THE EARTH\nAGAINST CLIMATE CHANGES',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50 * _animation.value),
                    Opacity(
                      opacity: _animation.value,
                      child: Text(
                        '#OFEKAEARTH',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
