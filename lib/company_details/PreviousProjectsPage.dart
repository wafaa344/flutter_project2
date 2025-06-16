import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PreviousProjectsPage extends StatelessWidget {
  const PreviousProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('المشاريع السابقة'),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildProjectCard(
              context,
              title: 'مشروع إعادة تأهيل منزل',
              startDate: 'يناير 2024',
              endDate: 'مارس 2024',
              description:
              'تمت إعادة تأهيل المنزل بالكامل مع إضافة تصميم داخلي حديث وحديقة خلفية.',
              cost: '150,000 ر.س',
              beforeImages: [
                'assets/images/Dec3.jpg',
                'assets/images/Dec3.jpg',
              ],
              afterImages: [
                'assets/images/Dec1.jpg',
                'assets/images/Dec2.jpg',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
      BuildContext context, {
        required String title,
        required String startDate,
        required String endDate,
        required String description,
        required String cost,
        required List<String> beforeImages,
        required List<String> afterImages,
      }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                )),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.date_range, size: 18, color: Colors.orange),
                const SizedBox(width: 5),
                Text('من $startDate إلى $endDate'),
              ],
            ),
            const SizedBox(height: 10),
            Text('التكلفة النهائية: $cost',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 20),

            _buildImageSlider('قبل الإعمار', beforeImages),
            const SizedBox(height: 20),
            _buildImageSlider('بعد الإعمار', afterImages),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider(String title, List<String> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: false, // <== هذا هو المفتاح
            viewportFraction: 0.8,
          ),
          items: images.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
