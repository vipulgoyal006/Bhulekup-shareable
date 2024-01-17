import 'dart:developer';
import 'package:bhulekh_uk/app_configs/app_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBackButton extends StatelessWidget {
  final Color? color;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;

  const AppBackButton({this.color, this.padding, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      type: MaterialType.circle,
      child: InkWell(
        onTap: onPressed ??
            () {
              FocusScope.of(context).unfocus();
              Navigator.maybePop(context);
            },
        child: Center(
          child: Padding(
            padding: padding ?? const EdgeInsets.only(right: 0, left: 16),
            child: SvgPicture.asset(AppAssets.backArrow,
                height: 16,
                width: 16,
                color: color ?? Theme.of(context).iconTheme.color),
          ),
        ),
      ),
    );
  }
}
