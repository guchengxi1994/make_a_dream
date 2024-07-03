import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key, required this.child});
  final Widget child;

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isLoading = true;

  static const bgs = [
    "assets/splash/1.jpeg",
    "assets/splash/2.jpeg",
    "assets/splash/3.jpeg",
    "assets/splash/4.jpeg"
  ];

  late String img;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    img = bgs[Random().nextInt(4)];
    // 初始化控制器，持续时间2秒
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // 创建一个从0到1的动画
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        if (_animation.value >= 1.0) {
          isLoading = false;
        }
        setState(() {}); // 动画更新时通知界面重绘
      });

    // 开始动画
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant SplashWrapper oldWidget) {
    _controller.reset();
    isLoading = true;
    img = bgs[Random().nextInt(4)];
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose(); // 清理控制器资源
    super.dispose();
  }

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle =
      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? widget.child
          : Stack(
              children: [
                SizedBox.expand(child: Image.asset(img, fit: BoxFit.cover)),
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: SizedBox(
                      width: 500,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 30,
                            child: LinearProgressIndicator(
                              value: _animation.value,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            width: 170,
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  'Loading ...',
                                  textStyle: colorizeTextStyle,
                                  colors: colorizeColors,
                                ),
                              ],
                              isRepeatingAnimation: true,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
    );
  }
}
