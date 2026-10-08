import '../../../domain/entities/review/user_review_entity.dart';

class UserReviewStoreModel {
  final String id;
  final String name;
  final String? address;
  final String? logoUrl;
  final String? coverImageUrl;

  const UserReviewStoreModel({
    required this.id,
    required this.name,
    this.address,
    this.logoUrl,
    this.coverImageUrl,
  });

  factory UserReviewStoreModel.fromJson(Map<String, dynamic> json) {
    return UserReviewStoreModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      name: (json['name'] ?? 'Spa & Salon').toString(),
      address: json['address']?.toString(),
      logoUrl: json['logoUrl']?.toString(),
      coverImageUrl: json['coverImageUrl']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    if (address != null) 'address': address,
    if (logoUrl != null) 'logoUrl': logoUrl,
    if (coverImageUrl != null) 'coverImageUrl': coverImageUrl,
  };

  UserReviewStoreEntity toEntity() => UserReviewStoreEntity(
    id: id,
    name: name,
    address: address,
    logoUrl: logoUrl,
    coverImageUrl: coverImageUrl,
  );
}

class UserReviewModel {
  final String id;
  final String storeId;
  final UserReviewStoreModel? store;
  final String? bookingId;
  final int rating;
  final String comment;
  final List<String> images;
  final List<String> serviceNames;
  final String? staffName;
  final String? merchantReply;
  final String? merchantRepliedAt;
  final String? createdAt;
  final String? updatedAt;

  const UserReviewModel({
    required this.id,
    required this.storeId,
    this.store,
    this.bookingId,
    required this.rating,
    required this.comment,
    this.images = const [],
    this.serviceNames = const [],
    this.staffName,
    this.merchantReply,
    this.merchantRepliedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserReviewModel.fromJson(Map<String, dynamic> json) {
    final storeMap = json['store'] is Map<String, dynamic>
        ? json['store'] as Map<String, dynamic>
        : null;

    final parsedImages = <String>[];
    if (json['images'] is List) {
      for (final img in json['images'] as List) {
        if (img != null) parsedImages.add(img.toString());
      }
    }

    final parsedServiceNames = <String>[];
    if (json['serviceNames'] is List) {
      for (final s in json['serviceNames'] as List) {
        if (s != null) parsedServiceNames.add(s.toString());
      }
    }

    final rawRating = json['rating'];
    final rating = rawRating is num ? rawRating.round() : 5;

    return UserReviewModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      storeId: (json['storeId'] ?? storeMap?['id'] ?? '').toString(),
      store: storeMap != null ? UserReviewStoreModel.fromJson(storeMap) : null,
      bookingId: json['bookingId']?.toString(),
      rating: rating,
      comment: (json['comment'] ?? '').toString(),
      images: parsedImages,
      serviceNames: parsedServiceNames,
      staffName: json['staffName']?.toString(),
      merchantReply: json['merchantReply']?.toString(),
      merchantRepliedAt: json['merchantRepliedAt']?.toString(),
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'storeId': storeId,
    if (store != null) 'store': store!.toJson(),
    if (bookingId != null) 'bookingId': bookingId,
    'rating': rating,
    'comment': comment,
    'images': images,
    'serviceNames': serviceNames,
    if (staffName != null) 'staffName': staffName,
    if (merchantReply != null) 'merchantReply': merchantReply,
    if (merchantRepliedAt != null) 'merchantRepliedAt': merchantRepliedAt,
    if (createdAt != null) 'createdAt': createdAt,
    if (updatedAt != null) 'updatedAt': updatedAt,
  };

  UserReviewEntity toEntity() => UserReviewEntity(
    id: id,
    storeId: storeId,
    store: store?.toEntity(),
    bookingId: bookingId,
    rating: rating,
    comment: comment,
    images: images,
    serviceNames: serviceNames,
    staffName: staffName,
    merchantReply: merchantReply,
    merchantRepliedAt: merchantRepliedAt != null
        ? DateTime.tryParse(merchantRepliedAt!)
        : null,
    createdAt: createdAt != null
        ? DateTime.tryParse(createdAt!) ?? DateTime.now()
        : DateTime.now(),
    updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
  );
}

class UserReviewListResponseModel {
  final List<UserReviewModel> items;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  const UserReviewListResponseModel({
    this.items = const [],
    this.total = 0,
    this.page = 1,
    this.limit = 10,
    this.totalPages = 1,
  });

  factory UserReviewListResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'] ?? json;
    final dataMap = rawData is Map<String, dynamic> ? rawData : json;

    final rawItems = dataMap['items'] ?? dataMap['reviews'] ?? [];
    final items = <UserReviewModel>[];
    if (rawItems is List) {
      for (final item in rawItems) {
        if (item is Map<String, dynamic>) {
          items.add(UserReviewModel.fromJson(item));
        }
      }
    }

    final pagination = dataMap['pagination'] is Map<String, dynamic>
        ? dataMap['pagination'] as Map<String, dynamic>
        : dataMap;

    return UserReviewListResponseModel(
      items: items,
      total: (pagination['total'] is num)
          ? (pagination['total'] as num).toInt()
          : items.length,
      page: (pagination['page'] is num)
          ? (pagination['page'] as num).toInt()
          : 1,
      limit: (pagination['limit'] is num)
          ? (pagination['limit'] as num).toInt()
          : 10,
      totalPages: (pagination['totalPages'] is num)
          ? (pagination['totalPages'] as num).toInt()
          : 1,
    );
  }

  UserReviewListEntity toEntity() => UserReviewListEntity(
    items: items.map((e) => e.toEntity()).toList(),
    total: total,
    page: page,
    limit: limit,
    totalPages: totalPages,
  );
}
