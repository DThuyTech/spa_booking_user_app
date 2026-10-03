import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/datasources/remote/store/store_remote_data_source.dart';
import 'package:spa_booking/src/data/model/store/store_full_detail_model.dart';
import 'package:spa_booking/src/data/model/store/store_schedule_grid_model.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late MockNetworkClient mockClient;
  late StoreRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    mockClient = MockNetworkClient();
    remoteDataSource = StoreRemoteDataSourceImpl(mockClient);
  });

  group('Module 1: Store Full Detail API', () {
    const fullDetailJson = {
      "store": {
        "id": "6701c234567890abcdef0003",
        "name": "An Miên Spa & Trị Liệu Cổ Vai Gáy",
        "slug": "an-mien-spa-tri-lieu-co-vai-gay",
        "address": "123 Nguyễn Thị Minh Khai, Q.3, TP.HCM",
        "phoneNumber": "02838999888",
        "description": "Không gian thư giãn đẳng cấp...",
        "logoUrl": "https://cdn.example.com/spas/anmien-logo.jpg",
        "coverImageUrl": "https://cdn.example.com/spas/anmien-cover.jpg",
        "city": "Hồ Chí Minh",
        "district": "Quận 3",
        "latitude": 10.7769,
        "longitude": 106.7009
      },
      "businessHours": [
        {
          "dayOfWeek": 1,
          "isOpen": true,
          "openTime": "09:00",
          "closeTime": "21:00"
        }
      ],
      "bookingSettings": {
        "minBookingNoticeMinutes": 60,
        "maxBookingAdvanceDays": 30,
        "minCancellationNoticeMinutes": 120,
        "minRescheduleNoticeMinutes": 120,
        "autoConfirm": true
      },
      "categories": [
        {"id": "cat_01", "name": "Gội đầu dưỡng sinh", "displayOrder": 1}
      ],
      "services": [
        {
          "id": "srv_01",
          "name": "Gội đầu dưỡng sinh Trung Hoa thảo dược",
          "description": "Massage ấn huyệt cổ vai gáy",
          "basePrice": 350000,
          "effectivePrice": 280000,
          "hasDiscount": true,
          "discountPercent": 20,
          "durationMinutes": 60,
          "imageUrl": "https://cdn.example.com/services/goidau.jpg",
          "categoryId": "cat_01",
          "appliedPricingRule": {
            "id": "rule_01",
            "name": "Happy Hour Giờ Vàng Thứ 2-Thứ 5",
            "discountPercentage": 20
          }
        }
      ],
      "staff": [
        {
          "id": "staff_01",
          "fullName": "Lê Thị Lan",
          "title": "Senior Therapist",
          "avatarUrl": "https://cdn.example.com/staff/lan.jpg"
        }
      ],
      "reviews": {
        "averageRating": 4.9,
        "totalReviews": 128,
        "ratingDistribution": {"1": 1, "2": 2, "3": 5, "4": 20, "5": 100}
      },
      "isFavorite": true
    };

    test('StoreFullDetailModel.fromJson parses complete aggregated payload', () {
      final model = StoreFullDetailModel.fromJson(fullDetailJson);

      expect(model.store.id, equals('6701c234567890abcdef0003'));
      expect(model.store.name, equals('An Miên Spa & Trị Liệu Cổ Vai Gáy'));
      expect(model.store.logoUrl, equals('https://cdn.example.com/spas/anmien-logo.jpg'));
      expect(model.businessHours.length, equals(1));
      expect(model.businessHours.first.openTime, equals('09:00'));
      expect(model.bookingSettings?.minBookingNoticeMinutes, equals(60));
      expect(model.categories.length, equals(1));
      expect(model.services.length, equals(1));
      expect(model.services.first.price, equals(280000));
      expect(model.services.first.originalPrice, equals(350000));
      expect(model.staff.length, equals(1));
      expect(model.staff.first.staffProfileId, equals('staff_01'));
      expect(model.staff.first.role, equals('Senior Therapist'));
      expect(model.reviews?.averageRating, equals(4.9));
      expect(model.reviews?.ratingDistribution['5'], equals(100));
      expect(model.isFavorite, isTrue);
    });

    test('getStoreFullDetail calls /public/stores/:id/full-detail', () async {
      when(() => mockClient.get<Map<String, dynamic>>(
            '/public/stores/store_123/full-detail',
          )).thenAnswer((_) async => Response(
            data: {'data': fullDetailJson},
            statusCode: 200,
            requestOptions: RequestOptions(path: '/public/stores/store_123/full-detail'),
          ));

      final result = await remoteDataSource.getStoreFullDetail('store_123');

      expect(result.store.id, equals('6701c234567890abcdef0003'));
      expect(result.isFavorite, isTrue);
    });
  });

  group('Module 2: Store Discovery & Nearby', () {
    test('getStores forwards rich query filters', () async {
      when(() => mockClient.get<Map<String, dynamic>>(
            '/public/stores',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((invocation) async {
        final qp = invocation.namedArguments[const Symbol('queryParameters')]
            as Map<String, dynamic>;
        expect(qp['search'], equals('Spa'));
        expect(qp['serviceName'], equals('Gội đầu'));
        expect(qp['lat'], equals(10.7769));
        expect(qp['lng'], equals(106.7009));
        expect(qp['distanceKm'], equals(5.0));
        expect(qp['city'], equals('Hồ Chí Minh'));
        expect(qp['minPrice'], equals(100000));
        expect(qp['minRating'], equals(4.5));
        expect(qp['sortBy'], equals('distance_asc'));

        return Response(
          data: {
            'items': [
              {
                'id': 'st_01',
                'name': 'Test Store',
                'slug': 'test-store',
                'address': 'District 1',
                'phoneNumber': '0123456789',
                'minPrice': 150000,
                'averageRating': 4.8,
                'reviewCount': 50,
              }
            ],
            'total': 1,
            'page': 1,
            'limit': 10,
            'totalPages': 1,
          },
          statusCode: 200,
          requestOptions: RequestOptions(path: '/public/stores'),
        );
      });

      final result = await remoteDataSource.getStores(
        search: 'Spa',
        serviceName: 'Gội đầu',
        lat: 10.7769,
        lng: 106.7009,
        distanceKm: 5.0,
        city: 'Hồ Chí Minh',
        minPrice: 100000,
        minRating: 4.5,
        sortBy: 'distance_asc',
      );

      expect(result.items.length, equals(1));
      expect(result.items.first.rating, equals(4.8));
      expect(result.items.first.priceRange, equals('Từ 150000 đ'));
      expect(result.pagination?.total, equals(1));
    });

    test('getNearbyStores calls /public/stores/nearby with coordinates', () async {
      when(() => mockClient.get<Map<String, dynamic>>(
            '/public/stores/nearby',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((invocation) async {
        final qp = invocation.namedArguments[const Symbol('queryParameters')]
            as Map<String, dynamic>;
        expect(qp['lat'], equals(10.7769));
        expect(qp['lng'], equals(106.7009));
        expect(qp['distanceKm'], equals(3.0));
        expect(qp['limit'], equals(5));

        return Response(
          data: {
            'items': [],
            'total': 0,
            'page': 1,
            'limit': 5,
            'totalPages': 0,
          },
          statusCode: 200,
          requestOptions: RequestOptions(path: '/public/stores/nearby'),
        );
      });

      final result = await remoteDataSource.getNearbyStores(
        lat: 10.7769,
        lng: 106.7009,
        distanceKm: 3.0,
        limit: 5,
      );

      expect(result.items, isEmpty);
      expect(result.pagination?.limit, equals(5));
    });
  });

  group('Module 3: Anonymized Schedule Grid (Excel View)', () {
    const gridJson = {
      "storeId": "6701c234567890abcdef0003",
      "date": "2026-10-15",
      "operatingHours": {
        "isOpen": true,
        "openTime": "09:00",
        "closeTime": "21:00"
      },
      "staffShifts": [
        {
          "staffProfileId": "staff_01",
          "staffName": "Lê Thị Lan",
          "shiftStart": "09:00",
          "shiftEnd": "18:00"
        }
      ],
      "bookedIntervals": [
        {
          "startAt": "2026-10-15T09:30:00.000Z",
          "endAt": "2026-10-15T11:00:00.000Z",
          "staffProfileId": "staff_01"
        }
      ],
      "slots": [
        {
          "time": "09:00",
          "isAvailable": true,
          "availableStaffCount": 3,
          "maxCapacity": 4
        },
        {
          "time": "09:30",
          "isAvailable": false,
          "availableStaffCount": 0,
          "maxCapacity": 4
        }
      ]
    };

    test('StoreScheduleGridModel.fromJson parses grid and slot availability', () {
      final grid = StoreScheduleGridModel.fromJson(gridJson);

      expect(grid.storeId, equals('6701c234567890abcdef0003'));
      expect(grid.date, equals('2026-10-15'));
      expect(grid.operatingHours?.isOpen, isTrue);
      expect(grid.operatingHours?.openTime, equals('09:00'));
      expect(grid.operatingHours?.closeTime, equals('21:00'));
      expect(grid.staffShifts.length, equals(1));
      expect(grid.staffShifts.first.staffName, equals('Lê Thị Lan'));
      expect(grid.bookedIntervals.length, equals(1));
      expect(grid.slots.length, equals(2));
      expect(grid.slots[0].time, equals('09:00'));
      expect(grid.slots[0].isAvailable, isTrue);
      expect(grid.slots[0].availableStaffCount, equals(3));
      expect(grid.slots[1].time, equals('09:30'));
      expect(grid.slots[1].isAvailable, isFalse);
    });

    test('getStoreScheduleGrid calls /public/stores/:id/schedule-grid', () async {
      when(() => mockClient.get<Map<String, dynamic>>(
            '/public/stores/store_123/schedule-grid',
            queryParameters: {'date': '2026-10-15', 'staffProfileId': 'staff_01'},
          )).thenAnswer((_) async => Response(
            data: {'data': gridJson},
            statusCode: 200,
            requestOptions: RequestOptions(path: '/public/stores/store_123/schedule-grid'),
          ));

      final result = await remoteDataSource.getStoreScheduleGrid(
        storeId: 'store_123',
        date: '2026-10-15',
        staffProfileId: 'staff_01',
      );

      expect(result.storeId, equals('6701c234567890abcdef0003'));
      expect(result.slots.first.availableStaffCount, equals(3));
    });
  });
}
