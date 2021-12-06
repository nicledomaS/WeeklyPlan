import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

final double radius = 19.0;
final leftRightIndent = 5.0;

double calcVMargin(double size) => (size / 2) - radius;

class SingleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topBottomIndent = calcVMargin(size.height);

    Path path = Path()
      ..moveTo(radius + leftRightIndent, topBottomIndent)
      ..lineTo(size.width - radius - leftRightIndent, topBottomIndent)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(
                  size.width - radius - leftRightIndent,
                  radius + topBottomIndent),
              radius: radius),
          1.5 * math.pi,
          math.pi,
          false)
      ..lineTo(radius + leftRightIndent, size.height - topBottomIndent)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(
                  radius + leftRightIndent,
                  radius + topBottomIndent),
              radius: radius),
          0.5 * math.pi,
          1.5 * math.pi,
          false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DownClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topBottomIndent = calcVMargin(size.height);

    Path path = Path()
      ..moveTo(radius + leftRightIndent, topBottomIndent)
      ..lineTo(size.width - radius - leftRightIndent, topBottomIndent)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(
                  size.width - radius - leftRightIndent,
                  radius + topBottomIndent),
              radius: radius),
          math.pi,
          math.pi,
          false)
      ..lineTo(size.width - leftRightIndent, size.height)
      ..lineTo(leftRightIndent, size.height)
      ..lineTo(leftRightIndent, radius + topBottomIndent)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(
                  radius + leftRightIndent,
                  radius + topBottomIndent),
              radius: radius),
          1 * math.pi,
          1.5 * math.pi,
          false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class VRectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(leftRightIndent, 0)
      ..lineTo(size.width - leftRightIndent, 0)
      ..lineTo(size.width - leftRightIndent, size.height)
      ..lineTo(leftRightIndent, size.height)
      ..lineTo(leftRightIndent, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HRectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topBottomIndent = calcVMargin(size.height);

    Path path = Path()
      ..moveTo(0, topBottomIndent)
      ..lineTo(size.width, topBottomIndent)
      ..lineTo(size.width, size.height - topBottomIndent)
      ..lineTo(0, size.height - topBottomIndent)
      ..lineTo(0, topBottomIndent)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topBottomIndent = calcVMargin(size.height);

    Path path = Path()
      ..moveTo(radius + leftRightIndent, topBottomIndent)
      ..lineTo(size.width, topBottomIndent)
      ..lineTo(size.width, size.height - topBottomIndent)
      ..lineTo(radius + leftRightIndent, size.height - topBottomIndent)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(
                  radius + leftRightIndent,
                  radius + topBottomIndent),
              radius: radius),
          0.5 * math.pi,
          1.5 * math.pi,
          false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RightDownClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topBottomIndent = calcVMargin(size.height);

    Path path = Path()
      ..moveTo(radius + leftRightIndent, topBottomIndent)
      ..lineTo(size.width, topBottomIndent)
      ..lineTo(size.width, size.height - topBottomIndent)
      ..arcToPoint(
          Offset(
              size.width - leftRightIndent,
              size.height - topBottomIndent + leftRightIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(size.width - leftRightIndent, size.height)
      ..lineTo(leftRightIndent, size.height)
      ..lineTo(leftRightIndent, radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(
                  radius + leftRightIndent,
                  radius + topBottomIndent),
              radius: radius),
          math.pi,
          1.5 * math.pi,
          false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TripleDownClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topBottomIndent = calcVMargin(size.height);

    Path path = Path()
      ..moveTo(0, topBottomIndent)
      ..lineTo(size.width, topBottomIndent)
      ..lineTo(size.width, size.height - topBottomIndent)
      ..arcToPoint(
          Offset(
              size.width - leftRightIndent,
              size.height - topBottomIndent + leftRightIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(size.width - leftRightIndent, size.height)
      ..lineTo(leftRightIndent, size.height)
      ..lineTo(leftRightIndent, size.height - topBottomIndent + leftRightIndent)
      ..arcToPoint(
          Offset(
              0,
              size.height - topBottomIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(0, topBottomIndent)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TripleRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topBottomIndent = calcVMargin(size.height);

    Path path = Path()
      ..moveTo(leftRightIndent, 0)
      ..lineTo(size.width - leftRightIndent, 0)
      ..lineTo(size.width - leftRightIndent, topBottomIndent - leftRightIndent)
      ..arcToPoint(
          Offset(
              size.width,
              topBottomIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(size.width, size.height - topBottomIndent)
      ..arcToPoint(
          Offset(
              size.width - leftRightIndent,
              size.height - topBottomIndent + leftRightIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(size.width - leftRightIndent, size.height)
      ..lineTo(leftRightIndent, size.height)
      ..lineTo(leftRightIndent, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class QuadClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topBottomIndent = calcVMargin(size.height);

    Path path = Path()
      ..moveTo(leftRightIndent, 0)
      ..lineTo(size.width - leftRightIndent, 0)
      ..lineTo(size.width - leftRightIndent, topBottomIndent - leftRightIndent)
      ..arcToPoint(
          Offset(
              size.width,
              topBottomIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(size.width, size.height - topBottomIndent)
      ..arcToPoint(
          Offset(
              size.width - leftRightIndent,
              size.height - topBottomIndent + leftRightIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(size.width - leftRightIndent, size.height)
      ..lineTo(leftRightIndent, size.height)
      ..lineTo(leftRightIndent, size.height - topBottomIndent + leftRightIndent)
      ..arcToPoint(
          Offset(
              0,
              size.height - topBottomIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(0, topBottomIndent)
      ..arcToPoint(
          Offset(
              leftRightIndent,
              topBottomIndent - leftRightIndent),
          radius: Radius.circular(leftRightIndent),
          clockwise: false)
      ..lineTo(leftRightIndent, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}