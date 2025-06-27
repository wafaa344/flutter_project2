import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostDialog extends StatelessWidget {
  const CostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء البيانات المرسلة عبر Get.arguments
    final double price = Get.arguments['price'];
    final VoidCallback? onConfirm = Get.arguments['onConfirm'];

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3), // خلفية نصف شفافة
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.attach_money, size: 48, color: Color(0xFFF77520)),
                const SizedBox(height: 10),
                const Text(
                  "التكلفة النهائية",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Text(
                  "التكلفة التقريبية: ${price.toStringAsFixed(0)} د.ع",
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text("إلغاء"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();        // إغلاق الـ Dialog
                        onConfirm?.call(); // تنفيذ وظيفة التأكيد (من SurveyPage)
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF77520),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("تأكيد", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
