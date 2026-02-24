import 'package:cbc/config/abc_config/balance_eye_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class ScanAn2Widget extends StatefulWidget {
  const ScanAn2Widget({super.key});

  @override
  State<ScanAn2Widget> createState() => _ScanAn2WidgetState();
}

class _ScanAn2WidgetState extends State<ScanAn2Widget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();

    // 创建动画控制器
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    // 创建扫描线动画
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          top: _animation.value * (1.sw * 0.8 ), // 调整位置计算以考虑新的高度
          child: Opacity(
            opacity: 1 - (_animation.value - 0.5).abs() * 2,
            child: Container(
              height: 60,
              width: 1.sw * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: 'sys_dht'.png3x,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
