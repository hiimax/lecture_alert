import 'package:flutter/material.dart';

class ForwardAnimation extends StatefulWidget {
  final Widget? child;

  const ForwardAnimation({super.key, this.child, int? milliseconds});

  @override
  State<ForwardAnimation> createState() => _ForwardAnimationState();
}

class _ForwardAnimationState extends State<ForwardAnimation>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;

  start() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeIn));

    animationController!.forward();
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return Material(
            color: Theme.of(context).colorScheme.background,
            child: Transform(
                transform:
                    Matrix4.translationValues(animation!.value * width, 0, 0),
                child: widget.child),
          );
        });
  }
}

class ImageAnimation extends StatefulWidget {
  final Widget? child;

  const ImageAnimation({super.key, this.child});

  @override
  State<ImageAnimation> createState() => _ImageAnimationState();
}

class _ImageAnimationState extends State<ImageAnimation>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;

  start() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeIn));

    animationController!.forward();
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return Material(
            //  color: appThemeLight.primaryColor,
            child: Transform(
                transform:
                    Matrix4.translationValues(0, animation!.value * width, 0),
                child: widget.child),
          );
        });
  }
}

class BackwardAnimation extends StatefulWidget {
  final Widget? child;

  const BackwardAnimation({super.key, this.child});
  @override
  State<BackwardAnimation> createState() => _BackwardAnimationState();
}

class _BackwardAnimationState extends State<BackwardAnimation>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;

  start() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeIn));

    animationController!.forward();
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) {
        return Material(
          //  color: appThemeLight.primaryColorLight,
          child: Transform(
              transform:
                  Matrix4.translationValues(animation!.value * width, 0, 0),
              child: widget.child),
        );
      },
    );
  }
}

class CustomSlideTransition extends PageRouteBuilder {
  final Widget? child;
  CustomSlideTransition({this.child})
      : super(
          transitionDuration: const Duration(seconds: 2000),
          pageBuilder: (context, animation, secondaryAnimation) => child!,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            var curve = Curves.bounceIn;

            var tween = Tween(begin: Offset.zero, end: const Offset(0.0, 1.0))
                .chain(CurveTween(curve: curve));
            return Material(
              color: Theme.of(context).primaryColorLight,
              child: SlideTransition(
                position: animation.drive(tween),
                child: child,
              ),
            );
          },
        );
}
