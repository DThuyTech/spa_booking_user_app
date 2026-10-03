import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/datasources/remote/booking/booking_remote_data_source.dart';
import 'package:spa_booking/src/data/model/analytics/customer_spending_analytics_model.dart';
import 'package:spa_booking/src/data/model/auth/user_model.dart';
import 'package:spa_booking/src/data/model/booking/booking_model.dart';
import 'package:spa_booking/src/data/model/review/review_model.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late MockNetworkClient mockClient;
  late BookingRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    mockClient = MockNetworkClient();
    remoteDataSource = BookingRemoteDataSourceImpl(mockClient);
  });

  group('Module 4: Customer Profile & Cached Booking Stats', () {
    const profileJson = {
      "id": "6701b234567890abcdef0002",
      "userId": "6701a234567890abcdef0001",
      "name": "Nguyễn Thùy Linh",
      "phoneNumber": "0912345678",
      "email": "customer@example.com",
      "avatarUrl": "https://cdn.example.com/avatars/linh.jpg",
      "dateOfBirth": "1998-05-20",
      "bookingStats": {
        "totalBookings": 12,
        "upcomingBookings": 2,
        "completedBookings": 9,
        "cancelledBookings": 1,
        "totalSpent": 4850000,
        "lastBookingDate": "2026-10-15T09:00:00.000Z",
        "lastBookingStoreName": "An Miên Spa & Trị Liệu Cổ Vai Gáy",
        "updatedAt": "2026-10-02T08:05:00.000Z"
      },
      "createdAt": "2026-10-02T08:05:00.000Z",
      "updatedAt": "2026-10-02T08:05:00.000Z"
    };

    test('UserModel.fromJson parses cached bookingStats and converts to Entity', () {
      final userModel = UserModel.fromJson(profileJson);

      expect(userModel.id, equals('6701b234567890abcdef0002'));
      expect(userModel.fullName, equals('Nguyễn Thùy Linh'));
      expect(userModel.email, equals('customer@example.com'));
      expect(userModel.phone, equals('0912345678'));
      expect(userModel.bookingStats, isNotNull);
      expect(userModel.bookingStats?.totalBookings, equals(12));
      expect(userModel.bookingStats?.upcomingBookings, equals(2));
      expect(userModel.bookingStats?.completedBookings, equals(9));
      expect(userModel.bookingStats?.cancelledBookings, equals(1));
      expect(userModel.bookingStats?.totalSpent, equals(4850000));
      expect(userModel.bookingStats?.lastBookingStoreName,
          equals('An Miên Spa & Trị Liệu Cổ Vai Gáy'));

      final entity = userModel.toEntity();
      expect(entity.bookingStats?.totalBookings, equals(12));
      expect(entity.bookingStats?.upcomingBookings, equals(2));
      expect(entity.bookingStats?.completedBookings, equals(9));
      expect(entity.bookingStats?.totalSpent, equals(4850000));
    });
  });

  group('Module 5: Customer Booking Dashboard & Actions', () {
    const bookingJson = {
      "id": "6702d234567890abcdef0004",
      "bookingCode": "BK-100234",
      "status": "CONFIRMED",
      "paymentStatus": "UNPAID",
      "startAt": "2026-10-15T09:00:00.000Z",
      "endAt": "2026-10-15T10:30:00.000Z",
      "totalAmount": 550000,
      "totalDuration": 90,
      "services": [
        {
          "serviceId": "srv_01",
          "name": "Gội đầu dưỡng sinh thảo dược",
          "price": 350000,
          "duration": 60
        }
      ],
      "store": {
        "id": "6701c234567890abcdef0003",
        "name": "An Miên Spa & Trị Liệu Cổ Vai Gáy",
        "slug": "an-mien-spa-tri-lieu-co-vai-gay",
        "logoUrl": "https://cdn.example.com/spas/anmien-logo.jpg",
        "address": "123 Nguyễn Thị Minh Khai, Phường 6, Quận 3, TP.HCM",
        "city": "Hồ Chí Minh",
        "district": "Quận 3",
        "phoneNumber": "02838999888"
      },
      "staff": {
        "id": "staff_01",
        "name": "Lê Thị Lan",
        "avatarUrl": "https://cdn.example.com/staff/lan.jpg",
        "title": "Senior Specialist"
      },
      "review": {
        "isReviewed": false,
        "rating": null,
        "comment": null
      },
      "actions": {
        "canCancel": true,
        "canReschedule": true,
        "canBookAgain": false,
        "canReview": true
      }
    };

    test('BookingModel.fromJson maps nested staff and canReview action flag', () {
      final model = BookingModel.fromJson(bookingJson);

      expect(model.id, equals('6702d234567890abcdef0004'));
      expect(model.bookingCode, equals('BK-100234'));
      expect(model.staffSnapshot?.staffId, equals('staff_01'));
      expect(model.staffSnapshot?.name, equals('Lê Thị Lan'));
      expect(model.store?.name, equals('An Miên Spa & Trị Liệu Cổ Vai Gáy'));
      expect(model.actions?.canCancel, isTrue);
      expect(model.actions?.canReschedule, isTrue);
      expect(model.actions?.canBookAgain, isFalse);
      expect(model.actions?.canReview, isTrue);

      final entity = model.toEntity();
      expect(entity.actions?.canReview, isTrue);
      expect(entity.staffSnapshot?.name, equals('Lê Thị Lan'));
    });

    test('getCustomerBookings passes multi-dimensional query filters', () async {
      when(() => mockClient.get<Map<String, dynamic>>(
            '/customer/bookings',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((invocation) async {
        final qp = invocation.namedArguments[const Symbol('queryParameters')]
            as Map<String, dynamic>;
        expect(qp['tab'], equals('UPCOMING'));
        expect(qp['search'], equals('BK-100'));
        expect(qp['serviceName'], equals('Gội đầu'));
        expect(qp['storeName'], equals('An Miên'));
        expect(qp['date'], equals('2026-10-15'));
        expect(qp['status'], equals('CONFIRMED'));

        return Response(
          data: {
            'summary': {'total': 1, 'upcoming': 1, 'past': 0, 'cancelled': 0},
            'items': [bookingJson],
            'total': 1,
            'page': 1,
            'limit': 20,
            'totalPages': 1,
          },
          statusCode: 200,
          requestOptions: RequestOptions(path: '/customer/bookings'),
        );
      });

      final result = await remoteDataSource.getCustomerBookings(
        tab: 'UPCOMING',
        search: 'BK-100',
        serviceName: 'Gội đầu',
        storeName: 'An Miên',
        date: '2026-10-15',
        status: 'CONFIRMED',
      );

      expect(result.items.length, equals(1));
      expect(result.summary?.upcoming, equals(1));
      expect(result.items.first.actions?.canReview, isTrue);
    });
  });

  group('Module 6: Customer Spending Analytics', () {
    const spendingJson = {
      "summary": {
        "totalSpent": 3850000,
        "totalVisits": 7,
        "cancelledVisits": 1,
        "averageSpendPerVisit": 550000,
        "favoriteSalonName": "An Miên Spa & Trị Liệu Cổ Vai Gáy",
        "visitCadence": "Every 2.4 weeks",
        "mostVisitedStore": {
          "storeId": "6701c234567890abcdef0003",
          "storeName": "An Miên Spa & Trị Liệu Cổ Vai Gáy",
          "visitCount": 5,
          "totalSpent": 2750000
        },
        "lastVisit": {
          "bookingId": "6702d234567890abcdef0004",
          "storeName": "An Miên Spa & Trị Liệu Cổ Vai Gáy",
          "date": "2026-10-01T09:00:00.000Z",
          "totalAmount": 550000
        }
      },
      "timeline": [
        {"date": "2026-08", "spent": 1100000, "visits": 2},
        {"date": "2026-09", "spent": 2200000, "visits": 4},
        {"date": "2026-10", "spent": 550000, "visits": 1}
      ],
      "storesBreakdown": [
        {
          "storeId": "6701c234567890abcdef0003",
          "storeName": "An Miên Spa & Trị Liệu Cổ Vai Gáy",
          "totalSpent": 2750000,
          "visitCount": 5
        }
      ],
      "servicesBreakdown": [
        {
          "serviceId": "srv_01",
          "serviceName": "Gội đầu dưỡng sinh thảo dược",
          "totalSpent": 1750000,
          "bookingCount": 5
        }
      ]
    };

    test('CustomerSpendingAnalyticsModel.fromJson parses complete analytics data', () {
      final model = CustomerSpendingAnalyticsModel.fromJson(spendingJson);

      expect(model.summary.totalSpent, equals(3850000));
      expect(model.summary.totalVisits, equals(7));
      expect(model.summary.cancelledVisits, equals(1));
      expect(model.summary.averageSpendPerVisit, equals(550000));
      expect(model.summary.favoriteSalonName,
          equals('An Miên Spa & Trị Liệu Cổ Vai Gáy'));
      expect(model.summary.visitCadence, equals('Every 2.4 weeks'));
      expect(model.summary.mostVisitedStore?.storeName,
          equals('An Miên Spa & Trị Liệu Cổ Vai Gáy'));
      expect(model.summary.mostVisitedStore?.visitCount, equals(5));
      expect(model.summary.lastVisit?.totalAmount, equals(550000));

      expect(model.timeline.length, equals(3));
      expect(model.timeline[0].date, equals('2026-08'));
      expect(model.timeline[0].spent, equals(1100000));

      expect(model.storesBreakdown.length, equals(1));
      expect(model.storesBreakdown.first.totalSpent, equals(2750000));

      expect(model.servicesBreakdown.length, equals(1));
      expect(model.servicesBreakdown.first.serviceName,
          equals('Gội đầu dưỡng sinh thảo dược'));
    });

    test('getSpendingAnalytics calls /customer/analytics/spending', () async {
      when(() => mockClient.get<Map<String, dynamic>>(
            '/customer/analytics/spending',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((invocation) async {
        final qp = invocation.namedArguments[const Symbol('queryParameters')]
            as Map<String, dynamic>;
        expect(qp['period'], equals('MONTH'));
        expect(qp['from'], equals('2026-01-01'));
        expect(qp['to'], equals('2026-12-31'));

        return Response(
          data: {'data': spendingJson},
          statusCode: 200,
          requestOptions: RequestOptions(path: '/customer/analytics/spending'),
        );
      });

      final result = await remoteDataSource.getSpendingAnalytics(
        from: '2026-01-01',
        to: '2026-12-31',
        period: 'MONTH',
      );

      expect(result.summary.totalSpent, equals(3850000));
      expect(result.timeline.length, equals(3));
    });
  });

  group('Module 7: Store Reviews & Ratings', () {
    const reviewsJson = {
      "storeId": "6701c234567890abcdef0003",
      "averageRating": 4.9,
      "totalReviews": 128,
      "ratingDistribution": {
        "5": 110,
        "4": 14,
        "3": 3,
        "2": 1,
        "1": 0
      },
      "items": [
        {
          "id": "rev_001",
          "customerName": "Nguyễn Thùy Linh",
          "avatarUrl": "https://cdn.example.com/avatars/linh.jpg",
          "rating": 5,
          "comment": "Dịch vụ rất tốt, nhân viên tay nghề cao!",
          "images": ["https://cdn.example.com/reviews/pic1.jpg"],
          "serviceNames": ["Gội đầu dưỡng sinh thảo dược"],
          "staffName": "Lê Thị Lan",
          "createdAt": "2026-10-02T11:00:00.000Z"
        }
      ],
      "pagination": {
        "total": 128,
        "page": 1,
        "limit": 10,
        "totalPages": 13
      }
    };

    test('ReviewListResponseModel.fromJson parses star distribution and reviews', () {
      final model = ReviewListResponseModel.fromJson(reviewsJson);

      expect(model.storeId, equals('6701c234567890abcdef0003'));
      expect(model.averageRating, equals(4.9));
      expect(model.totalReviews, equals(128));
      expect(model.items.length, equals(1));
      expect(model.items.first.customerName, equals('Nguyễn Thùy Linh'));
      expect(model.items.first.rating, equals(5));

      final entity = model.toEntity();
      expect(entity.ratingDistribution.star5, equals(110));
      expect(entity.ratingDistribution.star4, equals(14));
      expect(entity.ratingDistribution.star1, equals(0));
      expect(entity.totalPages, equals(13));
    });
  });
}
