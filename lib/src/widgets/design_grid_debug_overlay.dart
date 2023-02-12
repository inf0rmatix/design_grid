import 'package:flutter/material.dart';

abstract class DesignGridDebugOverlay extends StatefulWidget {
  final Color color;

  final Widget child;

  final bool isVisible;

  final bool enableControls;

  final bool isInBackground;

  const DesignGridDebugOverlay({
    super.key,
    this.color = const Color(0xFFFF00FF),
    this.isVisible = true,
    this.enableControls = true,
    this.isInBackground = false,
    required this.child,
  });

  @override
  State<DesignGridDebugOverlay> createState() => _DesignGridDebugOverlayState();

  Widget overlayBuilder(BuildContext context, Size size);
}

class _DesignGridDebugOverlayState extends State<DesignGridDebugOverlay> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    _isVisible = widget.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!widget.isInBackground) widget.child,
        if (_isVisible)
          Positioned.fill(
            child: IgnorePointer(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return widget.overlayBuilder(context, constraints.biggest);
                },
              ),
            ),
          ),
        if (widget.isInBackground) widget.child,
        if (widget.enableControls)
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              child: Icon(_isVisible ? Icons.view_column_outlined : Icons.view_column),
              onPressed: () => setState(() => _isVisible = !_isVisible),
            ),
          ),
      ],
    );
  }
}
