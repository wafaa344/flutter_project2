class CompanyResponse {
  final List<Company> data;
  final bool success;
  final String message;

  CompanyResponse({required this.data, required this.success, required this.message});

  factory CompanyResponse.fromJson(Map<String, dynamic> json) {
    return CompanyResponse(
      data: (json['data'] as List).map((e) => Company.fromJson(e)).toList(),
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data.map((e) => e.toJson()).toList(),
    'success': success,
    'message': message,
  };
}

class Company {
  final int id;
  final int userId;
  final String name;
  final String? email;
  final String slug;
  final String location;
  final String phone;
  final String about;
  final String logo;
  final String createdAt;
  final String updatedAt;
  final List<Service> services;

  Company({
    required this.id,
    required this.userId,
    required this.name,
    this.email,
    required this.slug,
    required this.location,
    required this.phone,
    required this.about,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
    required this.services,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      slug: json['slug'],
      location: json['location'],
      phone: json['phone'],
      about: json['about'],
      logo: json['logo'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      services: (json['services'] as List).map((e) => Service.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'name': name,
    'email': email,
    'slug': slug,
    'location': location,
    'phone': phone,
    'about': about,
    'logo': logo,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'services': services.map((e) => e.toJson()).toList(),
  };
}

class Service {
  final int id;
  final int companyId;
  final String name;
  final String description;
  final String image;
  final String createdAt;
  final String updatedAt;

  Service({
    required this.id,
    required this.companyId,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      companyId: json['company_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'company_id': companyId,
    'name': name,
    'description': description,
    'image': image,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
