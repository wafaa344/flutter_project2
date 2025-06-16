import 'dart:ui';
import 'package:flutter/material.dart';

import 'PreviousProjectsPage.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topImageHeight = screenHeight * 0.35;
    final sheetInitialSize = (screenHeight - (topImageHeight - 50 )) / screenHeight;


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: topImageHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("assets/images/engineer.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // زر الرجوع للخلف
            Positioned(
              top: 40,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20,),
                ),
              ),
            ),

            // زر الرجوع للرئيسية
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // هنا تذهب إلى الصفحة الرئيسية، عدّل المسار حسب حاجتك
                  Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.home, color: Colors.white, size: 20),
                ),
              ),
            ),



            // القسم السفلي القابل للسحب
            DraggableScrollableSheet(
              initialChildSize: sheetInitialSize,
              minChildSize: sheetInitialSize,
              maxChildSize: 1.0,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          Text("اسم الشركة", style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 10),

                          Row(
                            children: const [
                              Icon(Icons.location_on_outlined, size: 18, color: Colors.orange),
                              SizedBox(width: 8),
                              Text("المدينة، الدولة", style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Row(
                            children: const [
                              Icon(Icons.phone_android, size: 18, color: Colors.orange),
                              SizedBox(width: 8),
                              Text("1234567890", style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(),

                          Text(
                            "نبذة عن الشركة",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "هذه نبذة قصيرة عن الشركة. تقدم خدمات إنشاء وإعادة تأهيل المنازل بأعلى جودة وأفضل الأسعار.. قم بالإطلاع على أعمالنا السابقة .",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                _showProjectSelectionDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              ),
                              child: const Text(
                                " مشاريع سابقة ",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),

                          const Divider(),


                          const Text(
                            "إذا أردت التواصل معنا، قم بتعبئة الاستبيان لمعرفة كم يكلف إعادة إعمار منزلك وستصلك الكلفة التقريبية مجانًا ومن ثم قدم طلبك:",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 15),

                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              ),
                              child: const Text(
                                "الاستبيان ",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "خدماتنا",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 15),

                          SizedBox(
                            height: 120,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _serviceCard("ترميم", Icons.home_repair_service),
                                _serviceCard("تصميم", Icons.design_services),
                                _serviceCard("بناء", Icons.construction),
                                _serviceCard("استشارة", Icons.support_agent),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceCard(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
        Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 40, color: Colors.orange),
      ),

          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  void _showProjectSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("اختر مشروعًا"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: const Icon(Icons.apartment, color: Colors.orange),
                  title: const Text("مشروع إعادة تأهيل منزل"),
                  onTap: () {
                    Navigator.of(context).pop(); // إغلاق الـ dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PreviousProjectsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.factory, color: Colors.orange),
                  title: const Text("مشروع بناء فيلا"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PreviousProjectsPage(),
                      ),
                    );
                  },
                ),
                // أضف مشاريع إضافية حسب الحاجة
              ],
            ),
          ),
        );
      },
    );
  }

}
