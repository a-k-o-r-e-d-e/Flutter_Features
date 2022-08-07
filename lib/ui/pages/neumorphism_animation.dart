import 'package:flutter/material.dart';

class AnimatedNeumorphism extends StatefulWidget {
  const AnimatedNeumorphism({Key? key}) : super(key: key);

  @override
  State<AnimatedNeumorphism> createState() => _AnimatedNeumorphismState();
}

class _AnimatedNeumorphismState extends State<AnimatedNeumorphism>
    with TickerProviderStateMixin {
  final _customBlackColor = Color.fromARGB(255, 53, 53, 53);
  final customWhiteColor = Color.fromARGB(255, 237, 237, 237);

  double turns = 0;
  bool isClicked = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: customWhiteColor,
        appBar: AppBar(
          title: Text("Neumorphism Animation"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: _customBlackColor,
        ),
        body: Center(
          child: AnimatedRotation(
            curve: Curves.easeOutExpo,
            turns: turns,
            duration: const Duration(seconds: 1),
            child: GestureDetector(
              onTap: () {
                if (isClicked) {
                  setState(() => turns -= 1 / 4);
                  _controller.reverse();
                } else {
                  setState(() => turns += 1 / 4);
                  _controller.forward();
                }
                isClicked = !isClicked;
              },
              child: AnimatedContainer(
                curve: Curves.easeOutExpo,
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: customWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30,
                        offset: isClicked
                            ? const Offset(20, -20)
                            : const Offset(20, 20),
                        color: Colors.grey,
                      ),
                      BoxShadow(
                        blurRadius: 30,
                        offset: isClicked
                            ? const Offset(-20, 20)
                            : const Offset(-20, -20),
                        color: Colors.white,
                      )
                    ]),
                child: SizedBox.square(
                  dimension: 150,
                  child: Center(
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _controller,
                      size: 100,
                      color: _customBlackColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
