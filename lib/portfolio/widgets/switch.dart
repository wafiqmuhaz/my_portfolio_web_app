// ignore_for_file: library_private_types_in_public_api, always_use_package_imports, use_super_parameters, sort_constructors_first, lines_longer_than_80_chars, always_put_required_named_parameters_first, strict_raw_type

import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 60,
      ),
    );

    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            debugPrint(
              '_animationController: ${_animationController.isCompleted}',
            );
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 50,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: _circleAnimation.value == Alignment.centerRight
                  ? Colors.grey[100]
                  : Colors.black,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 2),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: Icon(
                    widget.value
                        ? Icons.dark_mode_rounded
                        : Icons.light_mode_rounded,
                    size: 14,
                    color: widget.value ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
