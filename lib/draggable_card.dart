import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_flutter_ui/provider.dart';

class DraggableCard extends HookConsumerWidget {
  const DraggableCard({Key? key, required this.child}) : super(key: key);
  final Widget child;

  void _runAnimation(Offset pixelsPerSecond, Size size, AnimationController controller) {
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    controller.animateWith(simulation);
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alignment = ref.watch(alignmentProvider);
    final size = MediaQuery.of(context).size;
    final controller = useAnimationController(duration: const Duration(seconds: 1));
    final animation = AlignmentTween(begin: alignment, end: Alignment.center).animate(controller);
    controller.addListener(() {
      ref.read(alignmentProvider.notifier).update((state) => animation.value);
    });

    return GestureDetector(
      onPanDown: (details) => controller.stop(),
      onPanEnd: (details) {
        // controller.reset();
        // controller.forward();
        _runAnimation(details.velocity.pixelsPerSecond, size, controller);
      },
      onPanUpdate: (details) {
        final dx = details.delta.dx / (size.width / 2);
        final dy = details.delta.dy / (size.height / 2);
        ref
            .read(alignmentProvider.notifier)
            .update((state) => state + Alignment(dx, dy));
      },
      child: Align(
        alignment: alignment,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
