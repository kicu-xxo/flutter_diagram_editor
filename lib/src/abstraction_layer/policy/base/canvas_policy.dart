import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:diagram_editor/src/getX/link_align_controller.dart';
import 'package:diagram_editor/src/getX/link_curved_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Allows you to define the canvas behaviour on any gesture registered by the [Canvas].
mixin CanvasPolicy on BasePolicySet {
  onCanvasTap() {}

  onCanvasTapDown(TapDownDetails details) {}

  onCanvasTapUp(TapUpDetails details) {}

  onCanvasTapCancel() {}

  onCanvasLongPress() {}

  onCanvasScaleStart(ScaleStartDetails details) {}

  onCanvasScaleUpdate(ScaleUpdateDetails details) {}

  onCanvasScaleEnd(ScaleEndDetails details) {}

  onCanvasLongPressStart(LongPressStartDetails details) {}

  onCanvasLongPressMoveUpdate(LongPressMoveUpdateDetails details) {}

  onCanvasLongPressEnd(LongPressEndDetails details) {}

  onCanvasLongPressUp() {}

  onCanvasPointerSignal(PointerSignalEvent event) {}

  getPutLinkAlignController() {
    Get.put(LinkAlignController());
  }

  changeIsAlignVertically(newIsAlignVertically) {
    Get.find<LinkAlignController>().isAlignVertically = newIsAlignVertically;
  }

  getIsAlignVertically() {
    return Get.find<LinkAlignController>().isAlignVertically;
  }

  getPutLinkCurvedController() {
    Get.put(LinkCurvedController());
  }

  changeIsCurved(bool newIsCurved) {
    Get.find<LinkCurvedController>().changeIsCurved(newIsCurved);
  }

  getIsCurved() {
    return Get.find<LinkCurvedController>().isCurved;
  }
}
