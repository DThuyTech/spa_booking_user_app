import 'package:equatable/equatable.dart';

class MostVisitedStoreModel extends Equatable {
  final String storeId;
  final String storeName;
  final int visitCount;
  final int totalSpent;

  const MostVisitedStoreModel({
    required this.storeId,
    required this.storeName,
    this.visitCount = 0,
    this.totalSpent = 0,
  });

  factory MostVisitedStoreModel.fromJson(Map<String, dynamic> json) {
    return MostVisitedStoreModel(
      storeId: (json['storeId'] ?? json['id'] ?? '') as String,
      storeName: (json['storeName'] ?? json['name'] ?? '') as String,
      visitCount: (json['visitCount'] as num?)?.toInt() ?? 0,
      totalSpent: (json['totalSpent'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [storeId, storeName, visitCount, totalSpent];
}

class LastVisitModel extends Equatable {
  final String bookingId;
  final String storeName;
  final String date;
  final int totalAmount;

  const LastVisitModel({
    required this.bookingId,
    required this.storeName,
    required this.date,
    this.totalAmount = 0,
  });

  factory LastVisitModel.fromJson(Map<String, dynamic> json) {
    return LastVisitModel(
      bookingId: (json['bookingId'] ?? json['id'] ?? '') as String,
      storeName: (json['storeName'] ?? json['name'] ?? '') as String,
      date: json['date'] as String? ?? '',
      totalAmount: (json['totalAmount'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [bookingId, storeName, date, totalAmount];
}

class SpendingSummaryModel extends Equatable {
  final int totalSpent;
  final int totalVisits;
  final int cancelledVisits;
  final int averageSpendPerVisit;
  final String? favoriteSalonName;
  final String? visitCadence;
  final MostVisitedStoreModel? mostVisitedStore;
  final LastVisitModel? lastVisit;

  const SpendingSummaryModel({
    this.totalSpent = 0,
    this.totalVisits = 0,
    this.cancelledVisits = 0,
    this.averageSpendPerVisit = 0,
    this.favoriteSalonName,
    this.visitCadence,
    this.mostVisitedStore,
    this.lastVisit,
  });

  factory SpendingSummaryModel.fromJson(Map<String, dynamic> json) {
    final rawMost = json['mostVisitedStore'];
    MostVisitedStoreModel? most;
    if (rawMost is Map<String, dynamic>) {
      most = MostVisitedStoreModel.fromJson(rawMost);
    }

    final rawLast = json['lastVisit'];
    LastVisitModel? last;
    if (rawLast is Map<String, dynamic>) {
      last = LastVisitModel.fromJson(rawLast);
    }

    final favName = json['favoriteSalonName'] as String? ?? most?.storeName;
    final cadence = json['visitCadence'] as String?;

    return SpendingSummaryModel(
      totalSpent: (json['totalSpent'] as num?)?.toInt() ?? 0,
      totalVisits: (json['totalVisits'] as num?)?.toInt() ?? 0,
      cancelledVisits: (json['cancelledVisits'] as num?)?.toInt() ?? 0,
      averageSpendPerVisit:
          (json['averageSpendPerVisit'] as num?)?.toInt() ?? 0,
      favoriteSalonName: favName,
      visitCadence: cadence,
      mostVisitedStore: most,
      lastVisit: last,
    );
  }

  @override
  List<Object?> get props => [
        totalSpent,
        totalVisits,
        cancelledVisits,
        averageSpendPerVisit,
        favoriteSalonName,
        visitCadence,
        mostVisitedStore,
        lastVisit,
      ];
}

class SpendingTimelinePointModel extends Equatable {
  final String date;
  final int spent;
  final int visits;

  const SpendingTimelinePointModel({
    required this.date,
    this.spent = 0,
    this.visits = 0,
  });

  factory SpendingTimelinePointModel.fromJson(Map<String, dynamic> json) {
    return SpendingTimelinePointModel(
      date: json['date'] as String? ?? '',
      spent: (json['spent'] as num?)?.toInt() ?? 0,
      visits: (json['visits'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [date, spent, visits];
}

class SpendingStoreBreakdownModel extends Equatable {
  final String storeId;
  final String storeName;
  final int totalSpent;
  final int visitCount;

  const SpendingStoreBreakdownModel({
    required this.storeId,
    required this.storeName,
    this.totalSpent = 0,
    this.visitCount = 0,
  });

  factory SpendingStoreBreakdownModel.fromJson(Map<String, dynamic> json) {
    return SpendingStoreBreakdownModel(
      storeId: (json['storeId'] ?? json['id'] ?? '') as String,
      storeName: (json['storeName'] ?? json['name'] ?? '') as String,
      totalSpent: (json['totalSpent'] as num?)?.toInt() ?? 0,
      visitCount: (json['visitCount'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [storeId, storeName, totalSpent, visitCount];
}

class SpendingServiceBreakdownModel extends Equatable {
  final String serviceId;
  final String serviceName;
  final int totalSpent;
  final int bookingCount;

  const SpendingServiceBreakdownModel({
    required this.serviceId,
    required this.serviceName,
    this.totalSpent = 0,
    this.bookingCount = 0,
  });

  factory SpendingServiceBreakdownModel.fromJson(Map<String, dynamic> json) {
    return SpendingServiceBreakdownModel(
      serviceId: (json['serviceId'] ?? json['id'] ?? '') as String,
      serviceName: (json['serviceName'] ?? json['name'] ?? '') as String,
      totalSpent: (json['totalSpent'] as num?)?.toInt() ?? 0,
      bookingCount: (json['bookingCount'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [serviceId, serviceName, totalSpent, bookingCount];
}

class CustomerSpendingAnalyticsModel extends Equatable {
  final SpendingSummaryModel summary;
  final List<SpendingTimelinePointModel> timeline;
  final List<SpendingStoreBreakdownModel> storesBreakdown;
  final List<SpendingServiceBreakdownModel> servicesBreakdown;

  const CustomerSpendingAnalyticsModel({
    this.summary = const SpendingSummaryModel(),
    this.timeline = const [],
    this.storesBreakdown = const [],
    this.servicesBreakdown = const [],
  });

  factory CustomerSpendingAnalyticsModel.fromJson(Map<String, dynamic> json) {
    final rawSummary = json['summary'];
    SpendingSummaryModel summary = const SpendingSummaryModel();
    if (rawSummary is Map<String, dynamic>) {
      summary = SpendingSummaryModel.fromJson(rawSummary);
    }

    final rawTimeline = json['timeline'];
    List<SpendingTimelinePointModel> timeline = [];
    if (rawTimeline is List) {
      timeline = rawTimeline
          .whereType<Map<String, dynamic>>()
          .map(SpendingTimelinePointModel.fromJson)
          .toList();
    }

    final rawStores = json['storesBreakdown'];
    List<SpendingStoreBreakdownModel> storesBreakdown = [];
    if (rawStores is List) {
      storesBreakdown = rawStores
          .whereType<Map<String, dynamic>>()
          .map(SpendingStoreBreakdownModel.fromJson)
          .toList();
    }

    final rawServices = json['servicesBreakdown'];
    List<SpendingServiceBreakdownModel> servicesBreakdown = [];
    if (rawServices is List) {
      servicesBreakdown = rawServices
          .whereType<Map<String, dynamic>>()
          .map(SpendingServiceBreakdownModel.fromJson)
          .toList();
    }

    return CustomerSpendingAnalyticsModel(
      summary: summary,
      timeline: timeline,
      storesBreakdown: storesBreakdown,
      servicesBreakdown: servicesBreakdown,
    );
  }

  @override
  List<Object?> get props => [
        summary,
        timeline,
        storesBreakdown,
        servicesBreakdown,
      ];
}
