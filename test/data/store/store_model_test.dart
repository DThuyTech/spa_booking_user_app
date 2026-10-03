import 'package:flutter_test/flutter_test.dart';
import 'package:spa_booking/src/data/model/store/service_model.dart';
import 'package:spa_booking/src/data/model/store/store_detail_model.dart';

void main() {
  group('Store API Model Parsing Tests', () {
    test(
      'StoreDetailModel parses backend payload with object businessHours successfully',
      () {
        final json = {
          "id": "49f12be1-6632-4132-8de6-7cafd3a38154",
          "name": "Aura Fix 2",
          "slug": "aura-1788871336760",
          "phoneNumber": "+84365182116",
          "email": "dthuytech2@mail.com",
          "address": "1, Quận Bình Thạnh, Thành phố Hồ Chí Minh",
          "description": "spa dbking",
          "logoUrl": null,
          "coverImageUrl": null,
          "createdAt": "2026-09-08T12:42:16.765Z",
          "businessHours": {
            "storeId": "49f12be1-6632-4132-8de6-7cafd3a38154",
            "days": [
              {"dayOfWeek": "MONDAY", "isOpen": false, "timeRanges": []},
              {
                "dayOfWeek": "WEDNESDAY",
                "isOpen": true,
                "timeRanges": [
                  {"startTime": "08:30", "endTime": "20:00"},
                ],
              },
            ],
            "updatedAt": "2026-09-20T05:53:09.599Z",
          },
          "bookingSettings": {
            "storeId": "49f12be1-6632-4132-8de6-7cafd3a38154",
            "bookingIntervalMinutes": 30,
            "minimumNoticeMinutes": 0,
            "maximumAdvanceDays": 30,
            "bufferEnabled": false,
            "allowUnassignedBooking": true,
            "maxConcurrentUnassignedBookings": null,
          },
        };

        final model = StoreDetailModel.fromJson(json);
        expect(model.id, "49f12be1-6632-4132-8de6-7cafd3a38154");
        expect(model.name, "Aura Fix 2");
        expect(model.businessHours.length, 2);
        expect(model.businessHours[0].dayName, "Monday");
        expect(model.businessHours[0].isOpen, false);
        expect(model.businessHours[1].dayName, "Wednesday");
        expect(model.businessHours[1].isOpen, true);
        expect(model.businessHours[1].openTime, "08:30");
        expect(model.businessHours[1].closeTime, "20:00");
        expect(model.bookingSettings?.minBookingNoticeMinutes, 0);
        expect(model.bookingSettings?.maxBookingAdvanceDays, 30);
      },
    );

    test('ServiceModel parses backend payload with basePrice successfully', () {
      final json = {
        "id": "10f7c059-7852-4935-a033-577db8ae3bca",
        "name": "Hair Cut",
        "description": "Cact toc nam nu",
        "durationMinutes": 60,
        "basePrice": 70000,
        "categoryId": "50a168b5-160c-4e5f-8b8d-e9644daae11f",
      };

      final model = ServiceModel.fromJson(json);
      expect(model.id, "10f7c059-7852-4935-a033-577db8ae3bca");
      expect(model.name, "Hair Cut");
      expect(model.price, 70000);
      expect(model.durationMinutes, 60);
      expect(model.categoryId, "50a168b5-160c-4e5f-8b8d-e9644daae11f");
    });
  });
}
