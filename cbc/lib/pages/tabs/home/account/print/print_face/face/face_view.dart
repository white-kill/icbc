import 'dart:async';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'face_logic.dart';
import 'face_state.dart';

class FacePage extends BaseStateless {
  FacePage({Key? key}) : super(key: key, title: '身份认证');

  final FaceLogic logic = Get.put(FaceLogic());
  final FaceState state = Get.find<FaceLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    // 进入页面时直接打开相机
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openCamera();
    });
    
    return Center(
      child: Image.asset(
        'assets/images/face_1.png',
        fit: BoxFit.contain,
        width: 1.sw,
        height: 1.sh,
      ),
    );
  }

  void _openCamera() async {
    // 直接打开相机预览页面（权限已在应用启动时申请）
    Get.to(() => CameraPreviewPage());
  }
}

class CameraPreviewPage extends StatefulWidget {
  const CameraPreviewPage({Key? key}) : super(key: key);

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Timer? _timer;
  Timer? _audioTimer;
  Timer? _colorTimer;
  int _countdown = 30; // 倒计时30秒
  String _statusText = ''; // 状态文本
  int _currentVoiceIndex = 0; // 当前选中的音频索引
  AudioPlayer? _audioPlayer; // 延迟初始化
  int _currentColorIndex = 0; // 当前颜色索引
  bool _isColorChanging = false; // 是否正在颜色变化
  
  // 音频文件映射
  final Map<int, String> _voiceMap = {
    1: '请点点头',
    2: '请摇摇头',
    3: '请眨眨眼',
  };
  
  // 颜色列表（按顺序）
  final List<Color> _colorList = [
    Color(0xFFB4B4B4),
    Color(0xFFB26D8B),
    Color(0xFFFC258E),
    Color(0xFF00C63B),
    Color(0xFF4628D4),
    Color(0xFF746AA1),
    Color(0xFFB4B4B4), // 最后回到第一个颜色
  ];

  @override
  void initState() {
    super.initState();
    _selectRandomVoice(); // 立即选择随机文本
    _startCountdown();
    _initAudioPlayer();
    _scheduleAudioPlay();
  }

  // 初始化音频播放器
  Future<void> _initAudioPlayer() async {
    try {
      _audioPlayer = AudioPlayer();
    } catch (e) {
      print('初始化音频播放器失败: $e');
    }
  }

  // 立即选择随机文本
  void _selectRandomVoice() {
    final random = math.Random();
    _currentVoiceIndex = random.nextInt(3) + 1; // 1, 2, 或 3
    _statusText = _voiceMap[_currentVoiceIndex] ?? '';
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_countdown > 0) {
            _countdown--;
            // 倒计时到27秒时开始颜色变化
            if (_countdown == 27 && !_isColorChanging) {
              _startColorChange();
            }
          } else {
            _timer?.cancel();
          }
        });
      }
    });
  }

  // 开始颜色变化
  void _startColorChange() {
    _isColorChanging = true;
    _currentColorIndex = 0;
    _colorTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          _currentColorIndex++;
          // 如果超过最后一个颜色索引，关闭页面
          // _colorList.length = 7，索引0-6，当_currentColorIndex = 7时关闭
          if (_currentColorIndex >= _colorList.length) {
            _colorTimer?.cancel();
            // 先取消定时器，避免在关闭页面时再次触发 setState
            timer.cancel();
            // 延迟关闭页面，确保当前状态更新完成
            Future.microtask(() {
              if (mounted) {
                Get.back(); // 关闭当前页面
                Get.back(); // 关闭上级页面
              }
            });
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  // 2秒后随机播放音频
  void _scheduleAudioPlay() {
    _audioTimer = Timer(Duration(seconds: 2), () {
      _playRandomVoice();
    });
  }

  // 播放已选中的音频
  Future<void> _playRandomVoice() async {
    if (mounted && _audioPlayer != null) {
      try {
        await _audioPlayer!.play(AssetSource('images/voice_$_currentVoiceIndex.mp3'));
      } catch (e) {
        print('播放音频失败: $e');
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioTimer?.cancel();
    _colorTimer?.cancel();
    _audioPlayer?.dispose();
    // QRViewController 会自动释放，不需要手动 dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 计算圆形遮罩的半径（屏幕宽度的35%）
    final double circleRadius = 1.sw * 0.35;
    // 控制圆形距离顶部的距离
    final double topOffset = 200.w; // 可以根据需要调整这个值

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 相机预览 - 全屏显示
          QRView(
            key: qrKey,
            cameraFacing: CameraFacing.front, // 使用前置摄像头
            onQRViewCreated: (QRViewController controller) {
              this.controller = controller;
              // 不处理扫描结果，只用于预览
            },
            overlay: QrScannerOverlayShape(
              borderColor: Colors.transparent,
              borderRadius: 0,
              borderLength: 0,
              borderWidth: 0,
              cutOutSize: 0,
            ),
          ),
          Positioned(
            top: topOffset,
            child: Container(
              width: 1.sw,
              height: circleRadius * 0.6,
              color: Colors.black.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 倒计时30秒
                  BaseText(
                    text: '${_countdown}秒',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 10.w),
                  // 状态文本（白色）
                  BaseText(
                    text: _statusText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 镂空圆形遮罩层（包含上半部分蒙层）
          CustomPaint(
            size: Size.infinite,
            painter: CircleMaskPainter(
              circleRadius: circleRadius,
              borderWidth: 3.w,
              borderColor: Color(0xFF00CF7E),
              maskColor: _isColorChanging && _currentColorIndex < _colorList.length 
                  ? _colorList[_currentColorIndex] 
                  : Colors.white,
              topOffset: topOffset,
            ),
          ),

          // 左上角返回按钮
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.all(16.w),
                child: Image(
                  image: 'x'.png,
                  width: 24.w,
                  height: 24.w,
                ),
              ).withOnTap(onTap: () => Get.back()),
            ),
          ),
          // 右上角语音按钮
          Positioned(
            top: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.all(16.w),
                child: Image(
                  image: 'face_voice'.png,
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ),
          ),
          // 底部图片（开始变色时隐藏）
          if (!_isColorChanging)
            Positioned(
              bottom: 20.w,
              left: 0,
              right: 0,
              child: Center(
                child: Image(
                  width: 100.w,
                  image: 'face_bottom'.png,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
        ],
      ),
    );
  }

}

// 自定义绘制器：创建中间镂空的圆形遮罩
class CircleMaskPainter extends CustomPainter {
  final double circleRadius;
  final double borderWidth;
  final Color borderColor;
  final Color maskColor;
  final double topOffset;

  CircleMaskPainter({
    required this.circleRadius,
    required this.borderWidth,
    required this.borderColor,
    required this.maskColor,
    required this.topOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 计算圆心位置：水平居中，垂直方向根据 topOffset 控制距离顶部的距离
    final center = Offset(size.width / 2, topOffset + circleRadius);

    // 使用 saveLayer 隔离绘制，让镂空只影响遮罩层本身
    canvas.saveLayer(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );

    // 先绘制全覆盖的遮罩
    final maskPaint = Paint()
      ..color = maskColor
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      maskPaint,
    );

    // 使用 BlendMode.dstOut 来创建真正的镂空效果
    // 这只会在当前 layer 中"挖出"圆形区域，不影响其他层
    final holePaint = Paint()
      ..color = Colors.white
      ..blendMode = BlendMode.dstOut
      ..style = PaintingStyle.fill;

    // 绘制圆形，使用 dstOut 模式来创建镂空
    canvas.drawCircle(center, circleRadius, holePaint);
    
    // 恢复 canvas，将 layer 合成到主 canvas
    canvas.restore();

    // 绘制圆环边框（在镂空之后绘制，确保边框可见）
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawCircle(center, circleRadius, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is CircleMaskPainter) {
      return oldDelegate.circleRadius != circleRadius ||
          oldDelegate.borderWidth != borderWidth ||
          oldDelegate.borderColor != borderColor ||
          oldDelegate.maskColor != maskColor ||
          oldDelegate.topOffset != topOffset;
    }
    return true;
  }
}

