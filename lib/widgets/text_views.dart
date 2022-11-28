
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/assets.dart';
import '../res/res.dart';

class TextView {

  static Text size24Text(
      final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start, final fontWeight,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.fontSize24,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text size16Text(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start, final fontWeight,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.fontSize16,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text size10Text(
  final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize10,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWaySemiBold,
        color: color,
      ),
    );
  }


  static Text size12Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize12,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size14Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize14,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        // height: 1.2,
        color: color,
      ),
    );
  }

  static Text size15Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize15,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size18Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize18,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }


  static Text size20Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize20,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size30Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize30,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size26Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize26,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size28Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize28,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

  static Text size32Text(
      final text,
      {@required final color,
        final TextAlign textAlign = TextAlign.start,
        final fontFamily, final fontWeight,
        final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.fontSize32,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: fontFamily?? Assets.raleWayBold,
        color: color,
      ),
    );
  }

}
