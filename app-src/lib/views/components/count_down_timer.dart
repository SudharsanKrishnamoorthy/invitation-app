import 'package:flutter/material.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/styles/text_styles.dart';
import 'package:invitation/utils/time_calc.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key key,
    int secondsRemaining,
    this.countDownTimerStyle,
    this.whenTimeExpires,
    this.countDownFormatter,
  })  : secondsRemaining = secondsRemaining,
        super(key: key);

  final int secondsRemaining;
  final Function whenTimeExpires;
  final Function countDownFormatter;
  final TextStyle countDownTimerStyle;

  State createState() => new _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Duration duration;

  String get timerDisplayString {
    Duration duration = _controller.duration * _controller.value;
    return widget.countDownFormatter != null
        ? widget.countDownFormatter(duration.inSeconds)
        : formatHHMMSS(duration.inSeconds);
    // In case user doesn't provide formatter use the default one
    // for that create a method which will be called formatHHMMSS or whatever you like
  }

  String get days {
    Duration duration = _controller.duration * _controller.value;
    return getDays(duration.inSeconds);
  }

  String get hours {
    Duration duration = _controller.duration * _controller.value;
    return getHours(duration.inSeconds);
  }

  String get minutes {
    Duration duration = _controller.duration * _controller.value;
    return getMinutes(duration.inSeconds);
  }

  String get seconds {
    Duration duration = _controller.duration * _controller.value;
    return getSeconds(duration.inSeconds);
  }

  @override
  void initState() {
    super.initState();
    duration = new Duration(seconds: widget.secondsRemaining);
    _controller = new AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller.reverse(from: widget.secondsRemaining.toDouble());
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        widget.whenTimeExpires();
      }
    });
  }

  @override
  void didUpdateWidget(CountDownTimer oldWidget) {
    if (widget.secondsRemaining != oldWidget.secondsRemaining) {
      setState(() {
        duration = new Duration(seconds: widget.secondsRemaining);
        _controller.dispose();
        _controller = new AnimationController(
          vsync: this,
          duration: duration,
        );
        _controller.reverse(from: widget.secondsRemaining.toDouble());
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            widget.whenTimeExpires();
          } else if (status == AnimationStatus.dismissed) {
            print("Animation Complete");
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, Widget child) {
          return getTimeDateUI();
        },
      ),
    );
  }

  Widget _buildTile(String value, String title) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '$value',
                style: timeStyle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '$title',
                style: timeTitleStyle,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.only(right: 0),
      child: Container(
        width: 1,
        height: 42,
        color: Colors.grey.withOpacity(0.8),
      ),
    );
  }

  Widget getTimeDateUI() {
    return Container(
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.nearlyWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: <Widget>[
            _buildTile('$days', 'Days'),
            _buildDivider(),
            _buildTile('$hours', 'Hours'),
            _buildDivider(),
            _buildTile('$minutes', 'Minutes'),
            _buildDivider(),
            _buildTile('$seconds', 'Seconds'),
          ],
        ),
      ),
    );
  }
}
