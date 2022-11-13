import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//
// Simple Slider
// Choose min, max.
// State changes is inside the onChange method.
// _currentSliderValue is the slider value you will use.
//
class SliderFb1 extends StatefulWidget {
  final String title;
  final String helperText;

  final double min;
  final double max;
  final double initialValue;
  final int divisions;
  final bool showMinMaxText;
  // final Color primaryColor;
  final TextStyle minMaxTextStyle;
  final Function(double) onChange;

  const SliderFb1(
      {required this.min,
      required this.max,
      this.initialValue = 0,
      required this.onChange,
      // this.primaryColor = HexColor.fromHex("#01bf8f"),
      this.showMinMaxText = true,
      this.minMaxTextStyle = const TextStyle(fontSize: 14),
      required this.title,
      Key? key,
      required this.divisions, required this.helperText})
      : super(key: key);

  @override
  _SliderFb1State createState() => _SliderFb1State();
}

class _SliderFb1State extends State<SliderFb1> {
  final primaryColor = const Color(0xff01bf8f);

  late double _currentSliderValue;
  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 4.w,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(.9)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: primaryColor.withAlpha(35),
                  trackShape: const RoundedRectSliderTrackShape(),
                  trackHeight: 4.0,
                  activeTrackColor: primaryColor,
                  thumbShape: CustomSliderThumbCircle(
                    thumbRadius: 20,
                    min: widget.min.toDouble(),
                    max: widget.max.toDouble(),
                  ),
                  thumbColor: primaryColor,
                  overlayColor: primaryColor.withAlpha(35),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: const RoundSliderTickMarkShape(),
                  activeTickMarkColor: primaryColor,
                  inactiveTickMarkColor: primaryColor.withAlpha(35),
                  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: primaryColor.withAlpha(35),
                  valueIndicatorTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  min: widget.min.toDouble(),
                  max: widget.max.toDouble(),
                  divisions: widget.divisions,
                  value: _currentSliderValue,
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                    widget.onChange(value);
                  },
                ),
              ),
            ),
            Text("${_currentSliderValue.toInt()} ${widget.helperText}")
          ],
        ),
      ],
    );
  }
}

// Credits to @Ankit Chowdhury
class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final double min;
  final double max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0.0,
    this.max = 100.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
