import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostDialog extends StatelessWidget {
  const CostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final double price = Get.arguments['price'];
    final VoidCallback? onConfirm = Get.arguments['onConfirm'];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFF3E0), Color(0xFFFFFFFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Center(
            child: Container(
              width: width * 0.9,
              padding: EdgeInsets.all(width * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home_work_rounded, size: width * 0.18, color: const Color(0xFFF77520)),
                    const SizedBox(height: 16),
                    Text(
                      "تكلفة مشروعك التقديرية",
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${price.toStringAsFixed(0)} ل.س",
                      style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF77520),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "إذا كنت ترغب بالبدء في إعادة مشروع شقتك، اضغط على تأكيد الطلب الآن وسيتم تعيين مشرف خاص لمشروعك ليطلعك على كل المراحل بالتفصيل.",
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.back(),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFFF77520)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: height * 0.015),
                              child: Text(
                                "إلغاء",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: const Color(0xFFF77520),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                              onConfirm?.call();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF77520),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: height * 0.015),
                              child: Text(
                                "تأكيد الطلب",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
