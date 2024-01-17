import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppErrorWidget extends StatelessWidget {
  final String? title, subtitle, buttonText, assetPath;
  final VoidCallback? onRetry;
  final Color? textColor;

  const AppErrorWidget(
      {this.title,
      this.subtitle,
      this.buttonText,
      this.assetPath,
      this.onRetry,
      this.textColor,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // SvgPicture.asset(assetPath ?? 'assets/icons/error.svg'),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(title ?? 'Error',
                style: TextStyle(color: textColor, fontSize: 16)),
          ),
        ),
        if (onRetry != null)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Get.theme.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onRetry,
            child: Text(buttonText ?? 'Retry'),
          )
      ],
    );
  }
}

class AppEmptyWidget extends StatelessWidget {
  final String? title, subtitle, buttonText, assetPath;
  final VoidCallback? onReload;
  final Color? textColor;
  final TextStyle? titleStyle;
  final MainAxisAlignment? mainAxisAlignment;
  const AppEmptyWidget(
      {this.title,
      this.subtitle,
      this.buttonText,
      this.assetPath,
      this.onReload,
      this.textColor,
      this.titleStyle,
      this.mainAxisAlignment,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: <Widget>[
        if (assetPath != null) ...[
          SvgPicture.asset(assetPath!, width: 160),
          const SizedBox(height: 22),
        ],
        if (title != null && title!.isNotEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(title ?? 'Empty',
                  textAlign: TextAlign.center,
                  style:
                      titleStyle ?? TextStyle(color: textColor, fontSize: 16)),
            ),
          ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            child: Text(subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 16)),
          ),
        if (onReload != null)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Get.theme.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onReload,
            child: Text(buttonText ?? 'Reload'),
          )
      ],
    );
  }
}

class AppNoInternetWidget extends StatelessWidget {
  final String? title, subtitle, buttonText, assetPath;
  final Color? textColor;
  final VoidCallback? onRetry;

  const AppNoInternetWidget(
      {this.title,
      this.subtitle,
      this.textColor,
      this.buttonText,
      this.assetPath,
      this.onRetry,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // SvgPicture.asset(assetPath ?? 'assets/icons/no_network.svg'),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Text(title ?? 'Connection lost',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
          child: Text(subtitle ?? 'No internet connection',
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: 16)),
        ),
        if (onRetry != null)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Get.theme.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onRetry,
            child: Text(buttonText ?? 'Retry'),
          )
      ],
    );
  }
}
