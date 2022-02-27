import 'package:flutter/material.dart';
import 'package:ura/ui/shared/utils/uisizing.dart';

class DraggableSheet extends StatefulWidget {
  final double? minheight;
  final double? maxheight;
  const DraggableSheet({Key? key, this.minheight = 300, this.maxheight = 500})
      : super(key: key);

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet>
    with SingleTickerProviderStateMixin {
  late double newHeight;
  late double oldHeight;
  late double currentHeight;

  late AnimationController animationController;
  late Animation<double> heightview;
  @override
  void initState() {
    super.initState();
    oldHeight = widget.minheight!;
    currentHeight = widget.minheight!;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    heightview = Tween(begin: currentHeight, end: widget.maxheight)
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, widget) {
          return widget!;
        },
        child: Container(
          color: Colors.blue,
          height: heightview.value,
          width: UiSizing.wScreen(context),
          child: GestureDetector(
            onVerticalDragUpdate: ((details) {
              newHeight = currentHeight - details.delta.dy;
              if (newHeight > widget.minheight! &&
                  newHeight < widget.maxheight!) {
                setState(() => currentHeight = newHeight);
                print(currentHeight);
              } else {}
            }),
            onVerticalDragEnd: ((details) {
              if (currentHeight > oldHeight) {
                animationController.forward();
              } else if (currentHeight <= oldHeight) {
                animationController.reverse();
              }
              oldHeight = currentHeight;
            }),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Stack(
                children: [
                  Container(
                    height: heightview.value,
                    width: UiSizing.wScreen(context),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFEEECF4),
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
