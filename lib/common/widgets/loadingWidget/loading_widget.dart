import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showLoadingDialog({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const DialogLoadingWidget(),
  );
}

class DialogLoadingWidget extends StatelessWidget {
  const DialogLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          // child: Lottie.asset(AssetsConst.lottieLoading),
        ),
      ),
    );
  }
}