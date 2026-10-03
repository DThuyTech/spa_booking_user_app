import 'package:flutter_test/flutter_test.dart';
import 'package:spa_booking/src/data/model/booking/booking_model.dart';

void main() {
  test(
    'BookingModel successfully parses 201 create booking response with null staff and phone key',
    () {
      final responsePayload = {
        "id": "207f6474-b3db-4b9e-92be-96b79cc1f26e",
        "storeId": "bceb5a1a-ec23-4d75-af72-89cbcaed34c3",
        "bookingCode": "BK-20261003-5662",
        "customerId": "0e4608b6-6dbf-4651-9ae9-c5832e7d76c4",
        "customerSnapshot": {"name": "huy", "phone": "+1234567890"},
        "staffProfileId": null,
        "staffSnapshot": null,
        "startAt": "2026-10-03T07:30:00.000Z",
        "endAt": "2026-10-03T08:30:00.000Z",
        "status": "CONFIRMED",
        "bookingSource": "CUSTOMER",
        "services": [
          {
            "id": "fd688684-bb8a-4ba1-8c15-8d5fc06dab9b",
            "serviceId": "25f7e916-91eb-477a-aff7-b2a481cfa06d",
            "name": "Nhuộm",
            "durationMinutes": 60,
            "unitPrice": 350000,
            "discountAmount": 0,
            "totalAmount": 350000,
            "price": 350000,
            "staffProfileId": null,
          },
        ],
        "subtotal": 350000,
        "discountAmount": 0,
        "totalAmount": 350000,
        "paymentMethod": "CASH",
        "paymentStatus": "PENDING",
        "paidAt": null,
        "note":
            "Aug 24, 2026 • First time client. Prefers quiet appointment.; Just now • Allergic to specific hair spray brands.",
        "cancellationReason": null,
        "cancelledBy": null,
        "confirmedAt": "2026-10-03T07:12:03.510Z",
        "checkedInAt": null,
        "startedAt": null,
        "completedAt": null,
        "cancelledAt": null,
        "createdAt": "2026-10-03T07:12:03.513Z",
        "updatedAt": "2026-10-03T07:12:03.513Z",
      };

      final model = BookingModel.fromJson(responsePayload);

      expect(model.id, "207f6474-b3db-4b9e-92be-96b79cc1f26e");
      expect(model.bookingCode, "BK-20261003-5662");
      expect(model.customerSnapshot?.name, "huy");
      expect(model.customerSnapshot?.phoneNumber, "+1234567890");
      expect(model.staffSnapshot, isNull);
      expect(model.services.length, 1);
      expect(model.services.first.name, "Nhuộm");
      expect(model.services.first.duration, 60);
      expect(model.services.first.price, 350000);
      expect(model.totalAmount, 350000);

      final entity = model.toEntity();
      expect(entity.id, "207f6474-b3db-4b9e-92be-96b79cc1f26e");
      expect(entity.customerSnapshot?.phoneNumber, "+1234567890");
    },
  );
}
