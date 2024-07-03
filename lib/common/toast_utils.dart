import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastUtils {
  ToastUtils._();

  static void decorationTip(BuildContext? context, {required String tip}) {
    toastification.showCustom(
        context: context,
        autoCloseDuration: const Duration(seconds: 3),
        alignment: Alignment.bottomCenter,
        builder: (ctx, holder) {
          return SizedBox(
            width: tip.length > 10 ? 400 : 200,
            height: 50,
            child: Center(
                child: Text(
              tip,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          );
        });
  }

  static void decorationToast(BuildContext? context, {required String toast}) {
    toastification.showCustom(
        context: context,
        autoCloseDuration: const Duration(seconds: 3),
        alignment: Alignment.topCenter,
        builder: (ctx, holder) {
          return SizedBox(
            width: 300,
            height: 100,
            child: Center(
                child: Text(
              toast,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          );
        });
  }

  static void achievement(BuildContext? context,
      {required String title, String? descryption, VoidCallback? onTap}) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 10),
      title: Text(title),
      // you can also use RichText widget for title and description parameters
      description: descryption != null
          ? RichText(text: TextSpan(text: descryption))
          : null,
      alignment: Alignment.topCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      icon: const Icon(
        Icons.star_border,
        color: Colors.green,
      ),
      primaryColor: Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      // borderRadius: BorderRadius.circular(12),
      // boxShadow: const [
      //   BoxShadow(
      //     color: Color(0x07000000),
      //     blurRadius: 16,
      //     offset: Offset(0, 16),
      //     spreadRadius: 0,
      //   )
      // ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      // applyBlurEffect: true,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => onTap,
        onCloseButtonTap: (toastItem) {
          toastification.dismiss(toastItem);
        },
      ),
    );
  }

  static void mission(BuildContext? context,
      {required String title, String? descryption, VoidCallback? onTap}) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 5),
      title: Text(title),
      // you can also use RichText widget for title and description parameters
      description: descryption != null
          ? RichText(text: TextSpan(text: descryption))
          : null,
      alignment: Alignment.topCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      icon: const Icon(
        Icons.task,
        color: Colors.blue,
      ),
      primaryColor: Colors.blue,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      // borderRadius: BorderRadius.circular(12),
      // boxShadow: const [
      //   BoxShadow(
      //     color: Color(0x07000000),
      //     blurRadius: 16,
      //     offset: Offset(0, 16),
      //     spreadRadius: 0,
      //   )
      // ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      // applyBlurEffect: true,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => onTap,
        onCloseButtonTap: (toastItem) {
          toastification.dismiss(toastItem);
        },
      ),
    );
  }
}
