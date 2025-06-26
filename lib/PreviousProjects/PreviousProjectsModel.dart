class PreviousProjectsModel {
  final int id;
  final int companyId;
  final int customerId;
  final int orderId;
  final int employeeId;
  final String projectName;
  final String startDate;
  final String endDate;
  final String status;
  final String description;
  final int finalCost;
  final bool isPublish;
  final int durationInDays;
  final String createdAt;
  final String updatedAt;
  final List<ProjectImage> projectImages;

  // الحقول التي غير موجودة في JSON جعلناها اختيارية
  final int? rate;
  final String? comment;

  PreviousProjectsModel({
    required this.id,
    required this.companyId,
    required this.customerId,
    required this.orderId,
    required this.employeeId,
    required this.projectName,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.description,
    required this.finalCost,
    required this.isPublish,
    required this.durationInDays,
    required this.createdAt,
    required this.updatedAt,
    required this.projectImages,
    this.rate,
    this.comment,
  });

  factory PreviousProjectsModel.fromJson(Map<String, dynamic> json) {
    return PreviousProjectsModel(
      id: json['id'],
      companyId: json['company_id'],
      customerId: json['customer_id'],
      orderId: json['order_id'],
      employeeId: json['employee_id'],
      projectName: json['project_name'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      status: json['status'],
      description: json['description'],
      finalCost: json['final_cost'],
      isPublish: json['is_publish'] == 1,
      durationInDays: json['duration_in_days'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      rate: json['rate'], // ممكن تكون null
      comment: json['comment'], // ممكن تكون null
      projectImages: (json['project_images'] as List)
          .map((img) => ProjectImage.fromJson(img))
          .toList(),
    );
  }
}

class ProjectImage {
  final int id;
  final int projectId;
  final String beforeImage;
  final String afterImage;
  final String caption;
  final String createdAt;
  final String updatedAt;

  ProjectImage({
    required this.id,
    required this.projectId,
    required this.beforeImage,
    required this.afterImage,
    required this.caption,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProjectImage.fromJson(Map<String, dynamic> json) {
    return ProjectImage(
      id: json['id'],
      projectId: json['project_id'],
      beforeImage: json['before_image'],
      afterImage: json['after_image'],
      caption: json['caption'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
