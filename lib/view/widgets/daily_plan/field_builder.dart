import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weekly_plan/view_model/daily_model/field.dart';

import 'clipper_components.dart';

Widget createClipPath(
    CustomClipper<Path> clipperPath, Field? item, double opacity) {
  return ClipPath(
      clipper: clipperPath,
      child: Container(
        color: item!.color.withOpacity(opacity),
      ));
}

Widget rotateX(Widget widget) {
  return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationX(math.pi),
      child: widget);
}

Widget rotateY(Widget widget) {
  return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(math.pi),
      child: widget);
}

Widget rotateZ(Widget widget) {
  return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(math.pi),
      child: widget);
}

Widget rotateXY(Widget widget) => rotateX(rotateY(widget));

Widget getSingle(Field? item, double opacity) => createClipPath(SingleClipper(), item, opacity);

Widget getRight(Field? item, double opacity) => createClipPath(RightClipper(), item, opacity);
Widget getLeft(Field? item, double opacity) => rotateY(getRight(item, opacity));

Widget getLeftRight(Field? item, double opacity) => createClipPath(HRectClipper(), item, opacity);
Widget getUpDown(Field? item, double opacity) => createClipPath(VRectClipper(), item, opacity);

Widget getDown(Field? item, double opacity) => createClipPath(DownClipper(), item, opacity);
Widget getUp(Field? item, double opacity) => rotateX(getDown(item, opacity));

Widget getRightDown(Field? item, double opacity) => createClipPath(RightDownClipper(), item, opacity);
Widget getLeftDown(Field? item, double opacity) => rotateY(getRightDown(item, opacity));
Widget getRightUp(Field? item, double opacity) => rotateX(getRightDown(item, opacity));
Widget getLeftUp(Field? item, double opacity) => rotateXY(getRightDown(item, opacity));

Widget getTripleDownClipper(Field? item, double opacity) => createClipPath(TripleDownClipper(), item, opacity);
Widget getTripleUpClipper(Field? item, double opacity) => rotateX(getTripleDownClipper(item, opacity));
Widget getTripleRight(Field? item, double opacity) => createClipPath(TripleRightClipper(), item, opacity);
Widget getTripleLeft(Field? item, double opacity) => rotateY(getTripleRight(item, opacity));

Widget getQuad(Field? item, double opacity) => createClipPath(QuadClipper(), item, opacity);

Widget getRightDownDecorator() => Container(
    decoration: BoxDecoration(
      color: Color(0xFFF7F9FB),
      border: Border(
        right: BorderSide(width: 0.5, color: Color(0xFFDCE0F3)),
        bottom: BorderSide(width: 0.5, color: Color(0xFFDCE0F3)),
      ),
    )
);
Widget getLeftDownDecorator() => rotateY(getRightDownDecorator());
Widget getRightUpDecorator() => rotateX(getRightDownDecorator());
Widget getLeftUpDecorator() => rotateY(getRightUpDecorator());

Widget getTripleDownDecorator() => Container(
    decoration: BoxDecoration(
      color: Color(0xFFF7F9FB),
      border: Border(
        right: BorderSide(width: 0.5, color: Color(0xFFDCE0F3)),
        left: BorderSide(width: 0.5, color: Color(0xFFDCE0F3)),
        bottom: BorderSide(width: 0.5, color: Color(0xFFDCE0F3)),
      ),
    )
);
Widget getTripleUpDecorator() => rotateX(getTripleDownDecorator());
Widget getTripleRightDecorator() => Container(
    decoration: BoxDecoration(
      color: Color(0xFFF7F9FB),
      border: Border(
        right: BorderSide(width: 0.5, color: Color(0xFFDCE0F3)),
        top: BorderSide(width: 0.5, color: Color(0xFFDCE0F3)),
        bottom: BorderSide(width: 0.5, color: Color(0xFFDCE0F3)),
      ),
    )
);
Widget getTripleLeftDecorator() => rotateY(getTripleRightDecorator());


Widget getQuadDecorator() => Container(
    decoration: BoxDecoration(
      color: Color(0xFFF7F9FB),
      border: Border.all(color: Color(0xFFDCE0F3)),
    )
);

// TODO: see ConstrainedBox
Widget createTextWidget(
    int index, double width, Field? item, AlignmentGeometry alignment) {
  var textBuilder = item!.textBuilder;
  var text = textBuilder == null ? "" : textBuilder.next(index, 14.0, width);
  return Align(
    alignment: alignment,
    child: Text(text,
        maxLines: 1,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF383874),
        )),
  );
}

Widget getLeftTextWidget(int index, Field? item) => createTextWidget(index, 40.0, item, Alignment.centerLeft);
Widget getRightTextWidget(int index, Field? item) => createTextWidget(index, 40.0, item, Alignment.centerRight);
Widget getCenterTextWidget(int index, Field? item) => createTextWidget(index, 54.6, item, Alignment.centerLeft);
Widget getSingleTextWidget(int index, Field? item) => createTextWidget(index, 40.0, item, Alignment.center);

class FieldBuilder {
  Map<FieldType, Function> _builders = {
    FieldType.Single: getSingle,
    FieldType.Left: getLeft,
    FieldType.Right: getRight,
    FieldType.LeftRight: getLeftRight,
    FieldType.Up: getUp,
    FieldType.LeftUp: getLeftUp,
    FieldType.RightUp: getRightUp,
    FieldType.TripleUp: getTripleUpClipper,
    FieldType.Down: getDown,
    FieldType.LeftDown: getLeftDown,
    FieldType.RightDown: getRightDown,
    FieldType.TripleDown: getTripleDownClipper,
    FieldType.UpDown: getUpDown,
    FieldType.TripleLeft: getTripleLeft,
    FieldType.TripleRight: getTripleRight,
    FieldType.Quad: getQuad,
  };

  Map<FieldType, Function> _decoratorBuilders = {
    FieldType.LeftUp: getLeftUpDecorator,
    FieldType.RightUp: getRightUpDecorator,
    FieldType.TripleUp: getTripleUpDecorator,
    FieldType.LeftDown: getLeftDownDecorator,
    FieldType.RightDown: getRightDownDecorator,
    FieldType.TripleDown: getTripleDownDecorator,
    FieldType.TripleLeft: getTripleLeftDecorator,
    FieldType.TripleRight: getTripleRightDecorator,
    FieldType.Quad: getQuadDecorator,
  };

  Map<FieldType, Function> _textBuilders = {
    FieldType.Single: getSingleTextWidget,
    FieldType.Left: getLeftTextWidget,
    FieldType.Right: getRightTextWidget,
    FieldType.LeftRight: getCenterTextWidget,
  };

  Widget build(int index, Field? item) {
    return Container(
        color: Color(0xFFF7F9FB),
        child: (item == null) || (item.frontLayerType == FieldType.Unknown)
            ? _getDecorator(item)
            : Stack(
                children: [
                  _getDecorator(item),
                  _getBackLayer(item),
                  _getFrontLayer(item),
                  _getTextWidget(index, item),
                ],
              ));
  }

  Widget _getDecorator(Field? item) {
    var decoratorFunc = _decoratorBuilders[item!.decoratorType];
    return decoratorFunc!();
  }

  Widget _getBackLayer(Field? item) {
    var clipperFunc = _builders[item!.backLayerType];
    return clipperFunc!(item, 0.30);
  }

  Widget _getFrontLayer(Field? item) {
    var clipperFunc = _builders[item!.frontLayerType];
    return clipperFunc!(item, 0.46);
  }

  Widget _getTextWidget(int index, Field? item) {
    var textBuilder = _textBuilders[item!.frontLayerType];
    return textBuilder!(index, item);
  }
}
