import 'package:camera/camera.dart';
import 'package:carenet/Screens/heart_rate_monitor/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakelock/wakelock.dart';

class HeartRateMon extends StatefulWidget {
  const HeartRateMon({Key? key}) : super(key: key);

  @override
  State<HeartRateMon> createState() => _HeartRateMonState();
}

class _HeartRateMonState extends State<HeartRateMon> {
  bool _toggled = false;
  bool _processing = false;
  List<SensorValue> _data = [];
  CameraController? _controller;
  double _alpha = 0.3;
  int _bpm = 0;

  // Override camera controller dispose method
  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  // Functions to toggle the IconButton
  _toggle() {
    _initController().then((onValue) {
      Wakelock.enable();
      setState(() {
        _toggled = true;
        _processing = false;
      });
      _updateBPM();
    });
  }
  

  _untoggle() {
    _disposeController();
    Wakelock.disable();
    setState(() {
      _toggled = false;
      _processing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // Shift - 1
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Center(
                  child: _controller == null
                      ? Container()
                      : CameraPreview(_controller!),
                ),
              ),
              Expanded(
                    child: Center(
                      child: Text(
                        
                        (_bpm > 30 && _bpm < 150 ? _bpm.round().toString() : "--"),
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
            ],
          )),

          // Icon Toggle Area
          Center(
            child: IconButton(
              icon: Icon(_toggled ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
              iconSize: 20.w,
              onPressed: () {
                if (_toggled) {
                  _untoggle();
                } else {
                  _toggle();
                }
              },
            ),
          ),

          // Shift - 2
          Expanded(
            child: Container(
                child: Chart(_data),
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    color: Colors.black)),
          )
        ],
      )),
    );
  }

  // Activate Camera Flash, capture images to process
  Future<void> _initController() async {
    try {
      List _cameras = await availableCameras();
      _controller = CameraController(_cameras.first, ResolutionPreset.high);
      await _controller!.initialize();
      Future.delayed(Duration(milliseconds: 500)).then((onValue) {
        _controller?.setFlashMode(FlashMode.torch);
      });
      _controller!.startImageStream((CameraImage image) {
        if (!_processing) {
          setState(() {
            _processing = true;
          });
          _scanImage(image);
        }
      });
    } catch (Exception) {
      print(Exception);
    }
  }

// Calculate avg of camera's red channel data and store to display on chart
// We do not process every frame -> Smaple Rate = 30 samples/sec
// _scanImage executed only when _processing = false
  _scanImage(CameraImage image) {
    double _avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (_data.length >= 50) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(DateTime.now(), _avg));
    });
    Future.delayed(Duration(milliseconds: 1000 ~/ 30)).then((onValue) {
      setState(() {
        _processing = false;
      });
    });
  }

  _disposeController() {
    _controller!.dispose();
    _controller = null;
  }

  _updateBPM() async {
    List<SensorValue> _values;
    double _avg;
    int _n;
    double _m;
    double _threshold;
    double _bpm;
    int _counter;
    int _previous;
    while (_toggled) {
      _values = List.from(_data);
      _avg = 0;
      _n = _values.length;
      _m = 0;
      _values.forEach((SensorValue value) {
        _avg += value.value / _n;
        if (value.value > _m) _m = value.value;
      });
      _threshold = (_m + _avg) / 2;
      _bpm = 0;
      _counter = 0;
      _previous = 0;
      for (int i = 1; i < _n; i++) {
        if (_values[i - 1].value < _threshold &&
            _values[i].value > _threshold) {
          if (_previous != 0) {
            _counter++;
            _bpm +=
                60000 / (_values[i].time.millisecondsSinceEpoch - _previous);
          }
          _previous = _values[i].time.millisecondsSinceEpoch;
        }
      }
      if (_counter > 0) {
        _bpm = _bpm / _counter;
        setState(() {
          _bpm = (1 - _alpha) * _bpm + _alpha * _bpm;
        });
      }
      await Future.delayed(Duration(milliseconds: (1000 * 50 / 30).round()));
    }
  }
}
