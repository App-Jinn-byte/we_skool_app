
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/assets.dart';
import '../res/res.dart';

class TextView {

  static Text size24Text700(
      final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.fontSize24,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text size16Text(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.fontSize16,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text size10Text(
  final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize10,
        fontFamily: fontFamily?? Assets.raleWaySemiBold,
        color: color,
      ),
    );
  }


  static Text size12Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize12,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size14Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize14,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size15Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize15,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size18Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize18,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }


  static Text size20Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize20,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size24Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize24,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size30Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize30,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size28Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize28,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

}
