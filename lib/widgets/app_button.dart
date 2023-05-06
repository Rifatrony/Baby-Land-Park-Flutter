import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final bool loading;
  const AppButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: Get.width,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: Colors.deepOrangeAccent.shade400),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Center(
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
