
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false, home: AnimationDemo());
}

enum AnimationType { fade, slide, scale }

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});
  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController c;
  AnimationType type = AnimationType.fade;

  @override
  void initState() {
    super.initState();
    c = AnimationController(vsync: this,
        duration: const Duration(seconds: 2))..forward();
  }

  @override
  void dispose() { c.dispose(); super.dispose(); }

  void change(AnimationType t) {
    setState(() { type = t; c.reset(); c.forward(); });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(
      'Fade, Slide & Scale Animations'), centerTitle: true),
    body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(child: AnimatedBuilder(
        animation: c,
        builder: (context, child) {
          final v = Curves.easeInOut.transform(c.value);
          return Opacity(
            opacity: type == AnimationType.fade ? v : 1,
            child: Transform.translate(
              offset: type == AnimationType.slide
                  ? Offset(-100 * (1 - v), 0) : Offset.zero,
              child: Transform.scale(
                scale: type == AnimationType.scale
                    ? 0.5 + 0.5 * Curves.elasticOut.transform(c.value) : 1,
                child: child,
              ),
            ),
          );
        },
        child: const FlutterLogo(size: 100))),
      const SizedBox(height: 50),
      Wrap(spacing: 20, children: AnimationType.values.map((t) =>
        ElevatedButton(
          onPressed: () => change(t),
          style: ElevatedButton.styleFrom(
            backgroundColor: type == t ? Colors.teal : null),
          child: Text(t.name[0].toUpperCase() + t.name.substring(1)),
        )).toList()),
    ]),
  );
}
