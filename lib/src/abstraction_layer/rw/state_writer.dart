import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:flutter/material.dart';

class CanvasStateWriter {
  final CanvasState _canvasState;

  /// Allows you to change the state of the canvas.
  CanvasStateWriter(this._canvasState);

  /// 캔버스의 모든 것을 업데이트합니다.
  ///
  /// 가능한 한 적게 사용해야 하며 많은 성능이 필요합니다.
  /// 캔버스의 무언가가 업데이트되지 않은 경우에만 사용하십시오.
  /// [ChangeNotifier]의 [notifyListeners] 함수를 호출합니다.
  updateCanvas() {
    _canvasState.updateCanvas();
  }

  /// Sets the position of the canvas to [position] value.
  setPosition(Offset position) {
    _canvasState.setPosition(position);
  }

  /// Sets the scale of the canvas to [scale] value.
  ///
  /// Scale value should be positive.
  setScale(double scale) {
    assert(scale > 0);
    _canvasState.setScale(scale);
  }

  /// Translates the canvas by [offset].
  updatePosition(Offset offset) {
    _canvasState.updatePosition(offset);
  }

  /// Multiplies the scale of the canvas by [scale].
  updateScale(double scale) {
    _canvasState.updateScale(scale);
  }

  /// Sets the position of the canvas to (0, 0) and scale to 1.
  resetCanvasView() {
    _canvasState.resetCanvasView();
  }

  /// Sets the base color of the canvas.
  setCanvasColor(Color color) {
    _canvasState.color = color;
  }

  /// Sets the maximal possible scale of the canvas.
  setMaxScale(double scale) {
    _canvasState.maxScale = scale;
  }

  /// Sets the minimal possible scale of the canvas.
  setMinScale(double scale) {
    _canvasState.minScale = scale;
  }
}
