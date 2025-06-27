import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cost/cost_controller.dart';
import 'cost/cost_model.dart';
import 'survey_controller.dart';
import 'survey_model.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurveyController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('الاستبيان'),
        backgroundColor: const Color(0xFFF77520),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.services.length,
          itemBuilder: (context, index) {
            final service = controller.services[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              child: ExpansionTile(
                title: Text(
                  service.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                children: service.questions.map((q) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: _buildQuestion(q),
                  );
                }).toList(),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            final costController = Get.find<CostController>();
            final surveyController = Get.find<SurveyController>();

            final services = surveyController.services.map((service) {
              final answers = service.questions.map((q) {
                final value = surveyController.answers[q.id];
                return AnswerModel(questionId: q.id, answer: value.toString());
              }).toList();

              return ServiceAnswers(serviceId: service.id, answers: answers);
            }).toList();

            final request = CostRequest(services: services);

            costController.calculateCostOnly(request).then((price) {
              Get.toNamed('/cost', arguments: {
                'price': price,
                'onConfirm': () {
                  Get.snackbar("تم", "تم تأكيد الطلب بنجاح");
                },
              });
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF77520),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text(
            'إرسال',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion(QuestionModel question) {
    return GetBuilder<SurveyController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            if (question.hasOptions)
              Column(
                children: question.options.map((option) {
                  final currentAnswer = controller.answers[question.id];
                  final isSelected = currentAnswer == option.id;

                  return GestureDetector(
                    onTap: () {
                      controller.answers[question.id] = option.id;
                      controller.update();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFFEDE3) : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? const Color(0xFFF77520) : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${option.name} - ${option.unit} - ${option.price} د.ع',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? const Color(0xFFF77520) : Colors.black87,
                              ),
                            ),
                          ),
                          if (isSelected)
                            const Icon(Icons.check_circle, color: Color(0xFFF77520)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            else
              TextField(
                onChanged: (value) {
                  controller.answers[question.id] = value;
                },
                decoration: InputDecoration(
                  hintText: 'اكتب إجابتك هنا',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
