import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qkit/qkit.dart';

class QImage {
  Widget asset(
    String url, {
    double width = 48,
    double height = 48,
    EdgeInsetsGeometry? margin,
    BorderRadius? radius,
  }) {
    return Container(
      height: height.h,
      width: width.w,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: radius ?? const BorderRadius.all(Radius.circular(6)),
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget memory(
      Uint8List bytes, {
        double scale = 1.0,
        double width = 48,
        double height = 48,
        EdgeInsetsGeometry? margin,
        BorderRadius? radius,
      }) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: radius ?? const BorderRadius.all(Radius.circular(6)),
        image: DecorationImage(
          image: MemoryImage(bytes, scale: scale),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget netCached(
    String url, {
    double width = 48,
    double height = 48,
    EdgeInsetsGeometry? margin,
    BorderRadius? radius,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: height.h,
        width: width.w,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: radius ?? const BorderRadius.all(Radius.circular(6)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) {
        return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
