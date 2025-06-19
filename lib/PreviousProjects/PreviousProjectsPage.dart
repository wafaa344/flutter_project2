import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../PreviousProjects/PreviousProjectsModel.dart';

class PreviousProjectsPage extends StatelessWidget {
  final PreviousProjectsModel project;

  const PreviousProjectsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل المشروع'),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildProjectCard(
              context,
              title: project.projectName,
              startDate: project.startDate,
              endDate: project.endDate,
              description: project.description,
              cost: "${project.finalCost} ر.س",
              beforeImages: project.projectImages.map((img) => img.beforeImage).toList(),
              afterImages: project.projectImages.map((img) => img.afterImage).toList(),
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
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: false,
            viewportFraction: 0.8,
          ),
          items: images.map((imageUrl) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/Dec1.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

}
