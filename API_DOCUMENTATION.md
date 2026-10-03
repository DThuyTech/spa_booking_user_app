# 📖 TÀI LIỆU TOÀN DIỆN API BACKEND — SPA BOOKING SYSTEM
> **Phiên bản:** 1.0  
> **Base URL:** http://localhost:3000/api/v1 (hoặc http://192.168.1.104:3000/api/v1 trên mạng LAN)  
> **Swagger UI:** http://localhost:3000/api/docs  
> **Cấu trúc Response Chuẩn:**
> `json
> {
>   "code": 200,
>   "statusCode": 200,
>   "message": "Success",
>   "data": { ... }
> }
> `
> Mọi request yêu cầu xác thực cần gửi Header: Authorization: Bearer <access_token>

---

## 📦 Module: App

### **GET /api/v1**
**Mô tả:** 

**📌 Parameters:** Không có

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 

---

### **GET /api/v1/health**
**Mô tả:** 

**📌 Parameters:** Không có

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 

---


## 📦 Module: User

### **GET /api/v1/users/me**
**Mô tả:** Get current authenticated user details

**📌 Parameters:** Không có

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: Return current user details.
`json
{
    "id":  "507f1f77bcf86cd799439011",
    "roles":  [
                  "CUSTOMER"
              ],
    "createdAt":  "\u003cstring\u003e",
    "updatedAt":  "\u003cstring\u003e",
    "status":  "ACTIVE",
    "email":  "user@example.com"
}
``n* **Status 401**: Unauthorized.
* **Status 404**: User not found.

---

### **PATCH /api/v1/users/me**
**Mô tả:** Update current authenticated user details

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "dummyField":  "\u003cstring\u003e"
}
``n
**📥 Responses:**

* **Status 200**: User updated successfully.
`json
{
    "id":  "507f1f77bcf86cd799439011",
    "roles":  [
                  "CUSTOMER"
              ],
    "createdAt":  "\u003cstring\u003e",
    "updatedAt":  "\u003cstring\u003e",
    "status":  "ACTIVE",
    "email":  "user@example.com"
}
``n* **Status 400**: Bad Request.
* **Status 401**: Unauthorized.
* **Status 404**: User not found.

---


## 📦 Module: Auth

### **POST /api/v1/auth/customer/register**
**Mô tả:** Register a new customer account

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "password":  "StrongP@ss123",
    "email":  "customer@example.com"
}
``n
**📥 Responses:**

* **Status 201**: 
`json
{
    "user":  "\u003cUserPayload\u003e",
    "accessToken":  "\u003cstring\u003e",
    "tokenType":  "\u003cstring\u003e",
    "refreshToken":  "\u003cstring\u003e",
    "expiresIn":  "\u003cnumber\u003e"
}
``n
---

### **POST /api/v1/auth/customer/login**
**Mô tả:** Login as a customer

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "password":  "StrongP@ss123",
    "email":  "customer@example.com"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "user":  "\u003cUserPayload\u003e",
    "accessToken":  "\u003cstring\u003e",
    "tokenType":  "\u003cstring\u003e",
    "refreshToken":  "\u003cstring\u003e",
    "expiresIn":  "\u003cnumber\u003e"
}
``n
---

### **POST /api/v1/auth/store/register-owner**
**Mô tả:** Register a new store and owner account

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "phoneNumber":  "+1234567890",
    "email":  "owner@example.com",
    "firstName":  "John",
    "password":  "StrongP@ss123",
    "lastName":  "Doe",
    "storeName":  "My Awesome Store"
}
``n
**📥 Responses:**

* **Status 201**: 
`json
{
    "user":  "\u003cUserPayload\u003e",
    "accessToken":  "\u003cstring\u003e",
    "tokenType":  "\u003cstring\u003e",
    "refreshToken":  "\u003cstring\u003e",
    "expiresIn":  "\u003cnumber\u003e"
}
``n
---

### **POST /api/v1/auth/store/login**
**Mô tả:** Login to the Store App

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "password":  "StrongP@ss123",
    "email":  "owner@example.com"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "user":  "\u003cUserPayload\u003e",
    "accessToken":  "\u003cstring\u003e",
    "tokenType":  "\u003cstring\u003e",
    "refreshToken":  "\u003cstring\u003e",
    "expiresIn":  "\u003cnumber\u003e"
}
``n
---

### **POST /api/v1/auth/admin/login**
**Mô tả:** Login as an Admin

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "password":  "Admin@123456",
    "email":  "admin@spabooking.com"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "user":  "\u003cUserPayload\u003e",
    "accessToken":  "\u003cstring\u003e",
    "tokenType":  "\u003cstring\u003e",
    "refreshToken":  "\u003cstring\u003e",
    "expiresIn":  "\u003cnumber\u003e"
}
``n
---

### **POST /api/v1/auth/store/activate-invitation**
**Mô tả:** Activate a staff invitation

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "phoneNumber":  "+1234567890",
    "token":  "abc123xyz",
    "email":  "staff@example.com",
    "firstName":  "Jane",
    "password":  "StrongP@ss123",
    "lastName":  "Doe"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "user":  "\u003cUserPayload\u003e",
    "accessToken":  "\u003cstring\u003e",
    "tokenType":  "\u003cstring\u003e",
    "refreshToken":  "\u003cstring\u003e",
    "expiresIn":  "\u003cnumber\u003e"
}
``n
---

### **POST /api/v1/auth/refresh**
**Mô tả:** Refresh access and refresh tokens

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "refreshToken":  "\u003cstring\u003e"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "user":  "\u003cUserPayload\u003e",
    "accessToken":  "\u003cstring\u003e",
    "tokenType":  "\u003cstring\u003e",
    "refreshToken":  "\u003cstring\u003e",
    "expiresIn":  "\u003cnumber\u003e"
}
``n
---

### **POST /api/v1/auth/logout**
**Mô tả:** Logout and revoke current refresh session

**📌 Parameters:** Không có

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 

---

### **GET /api/v1/auth/me**
**Mô tả:** Get current authenticated user identity

**📌 Parameters:** Không có

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "phoneNumber":  "+84912345678",
    "storeRole":  "OWNER",
    "id":  "1b5410c4-523f-4a63-b8ac-df03affbb742",
    "roles":  [
                  "OWNER"
              ],
    "avatarUrl":  "https://example.com/avatar.jpg",
    "firstName":  "Thuy",
    "lastName":  "Do",
    "staffStatus":  "ACTIVE",
    "fullName":  "Thuy Do",
    "storeId":  "49f12be1-6632-4132-8de6-7cafd3a38154",
    "status":  "ACTIVE",
    "email":  "dthuytech2@gmail.com"
}
``n
---


## 📦 Module: Stores

### **GET /api/v1/stores/me**
**Mô tả:** Get stores the current user belongs to

**📌 Parameters:** Không có

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
[ <StoreResDto> ]
``n
---

### **GET /api/v1/stores/{storeId}**
**Mô tả:** Get store details by ID

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "description":  "Premium relaxation and skin care sanctuary",
    "createdAt":  "2026-09-08T10:00:00.000Z",
    "name":  "Luxury Spa \u0026 Salon",
    "slug":  "luxury-spa-salon-1710000000000",
    "reviewedByAdminId":  "65f1c2b5e39d4e5f8a987654",
    "logoUrl":  "https://example.com/images/logo.png",
    "address":  "123 Nguyen Hue, District 1, Ho Chi Minh City",
    "coverImageUrl":  "https://example.com/images/cover.jpg",
    "reviewStatus":  "PENDING",
    "businessLicenseUrl":  "https://example.com/docs/license.pdf",
    "updatedAt":  "2026-09-08T10:00:00.000Z",
    "id":  "65f1c2b5e39d4e5f8a123456",
    "status":  "PENDING_APPROVAL",
    "rejectionReason":  "Missing business registration document",
    "phoneNumber":  "+84987654321",
    "reviewedAt":  "2026-09-08T10:00:00.000Z",
    "email":  "contact@luxuryspa.com"
}
``n
---

### **PATCH /api/v1/stores/{storeId}**
**Mô tả:** Update store profile and details

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "phoneNumber":  "+84987654321",
    "description":  "Premium relaxation and skin care sanctuary",
    "businessLicenseUrl":  "https://example.com/docs/license.pdf",
    "logoUrl":  "https://example.com/images/logo.png",
    "coverImageUrl":  "https://example.com/images/cover.jpg",
    "name":  "Luxury Spa \u0026 Beauty Salon",
    "address":  "123 Nguyen Hue, District 1, Ho Chi Minh City",
    "email":  "contact@luxuryspa.com"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "description":  "Premium relaxation and skin care sanctuary",
    "createdAt":  "2026-09-08T10:00:00.000Z",
    "name":  "Luxury Spa \u0026 Salon",
    "slug":  "luxury-spa-salon-1710000000000",
    "reviewedByAdminId":  "65f1c2b5e39d4e5f8a987654",
    "logoUrl":  "https://example.com/images/logo.png",
    "address":  "123 Nguyen Hue, District 1, Ho Chi Minh City",
    "coverImageUrl":  "https://example.com/images/cover.jpg",
    "reviewStatus":  "PENDING",
    "businessLicenseUrl":  "https://example.com/docs/license.pdf",
    "updatedAt":  "2026-09-08T10:00:00.000Z",
    "id":  "65f1c2b5e39d4e5f8a123456",
    "status":  "PENDING_APPROVAL",
    "rejectionReason":  "Missing business registration document",
    "phoneNumber":  "+84987654321",
    "reviewedAt":  "2026-09-08T10:00:00.000Z",
    "email":  "contact@luxuryspa.com"
}
``n
---

### **POST /api/v1/stores/{storeId}/resubmit-review**
**Mô tả:** Resubmit store profile for admin review (if previously rejected)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: Store profile resubmitted for review
`json
{
    "description":  "Premium relaxation and skin care sanctuary",
    "createdAt":  "2026-09-08T10:00:00.000Z",
    "name":  "Luxury Spa \u0026 Salon",
    "slug":  "luxury-spa-salon-1710000000000",
    "reviewedByAdminId":  "65f1c2b5e39d4e5f8a987654",
    "logoUrl":  "https://example.com/images/logo.png",
    "address":  "123 Nguyen Hue, District 1, Ho Chi Minh City",
    "coverImageUrl":  "https://example.com/images/cover.jpg",
    "reviewStatus":  "PENDING",
    "businessLicenseUrl":  "https://example.com/docs/license.pdf",
    "updatedAt":  "2026-09-08T10:00:00.000Z",
    "id":  "65f1c2b5e39d4e5f8a123456",
    "status":  "PENDING_APPROVAL",
    "rejectionReason":  "Missing business registration document",
    "phoneNumber":  "+84987654321",
    "reviewedAt":  "2026-09-08T10:00:00.000Z",
    "email":  "contact@luxuryspa.com"
}
``n
---

### **GET /api/v1/stores/{storeId}/business-hours**
**Mô tả:** Get weekly business hours for a store

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "updatedAt":  "\u003cstring\u003e",
    "days":  "\u003carray\u003e",
    "storeId":  "store-uuid"
}
``n
---

### **PUT /api/v1/stores/{storeId}/business-hours**
**Mô tả:** Set or update complete weekly business hours (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "days":  "\u003carray\u003e"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "updatedAt":  "\u003cstring\u003e",
    "days":  "\u003carray\u003e",
    "storeId":  "store-uuid"
}
``n
---


## 📦 Module: Admin Stores

### **GET /api/v1/admin/stores**
**Mô tả:** List all stores with filters and pagination (Admin)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=reviewStatus; required=False; in=query; description=Filter by review status; schema=}.name) | $(@{name=reviewStatus; required=False; in=query; description=Filter by review status; schema=}.in) | ❌ Không | $type | Filter by review status |
| $(@{name=status; required=False; in=query; description=Filter by store status; schema=}.name) | $(@{name=status; required=False; in=query; description=Filter by store status; schema=}.in) | ❌ Không | $type | Filter by store status |
| $(@{name=page; required=False; in=query; schema=}.name) | $(@{name=page; required=False; in=query; schema=}.in) | ❌ Không | $type | - |
| $(@{name=limit; required=False; in=query; schema=}.name) | $(@{name=limit; required=False; in=query; schema=}.in) | ❌ Không | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: Paginated list of stores
`json
{
    "page":  1,
    "limit":  10,
    "items":  "\u003carray\u003e",
    "total":  42,
    "totalPages":  5
}
``n
---

### **GET /api/v1/admin/stores/{storeId}**
**Mô tả:** Get store application details for review (Admin)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: Store details
`json
{
    "description":  "Premium relaxation and skin care sanctuary",
    "createdAt":  "2026-09-08T10:00:00.000Z",
    "name":  "Luxury Spa \u0026 Salon",
    "slug":  "luxury-spa-salon-1710000000000",
    "reviewedByAdminId":  "65f1c2b5e39d4e5f8a987654",
    "logoUrl":  "https://example.com/images/logo.png",
    "address":  "123 Nguyen Hue, District 1, Ho Chi Minh City",
    "coverImageUrl":  "https://example.com/images/cover.jpg",
    "reviewStatus":  "PENDING",
    "businessLicenseUrl":  "https://example.com/docs/license.pdf",
    "updatedAt":  "2026-09-08T10:00:00.000Z",
    "id":  "65f1c2b5e39d4e5f8a123456",
    "status":  "PENDING_APPROVAL",
    "rejectionReason":  "Missing business registration document",
    "phoneNumber":  "+84987654321",
    "reviewedAt":  "2026-09-08T10:00:00.000Z",
    "email":  "contact@luxuryspa.com"
}
``n* **Status 404**: Store not found

---

### **PATCH /api/v1/admin/stores/{storeId}/review**
**Mô tả:** Approve or reject a store profile (Admin)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "rejectionReason":  "Business license document is unclear or expired.",
    "action":  "APPROVE"
}
``n
**📥 Responses:**

* **Status 200**: Store review decision applied
`json
{
    "description":  "Premium relaxation and skin care sanctuary",
    "createdAt":  "2026-09-08T10:00:00.000Z",
    "name":  "Luxury Spa \u0026 Salon",
    "slug":  "luxury-spa-salon-1710000000000",
    "reviewedByAdminId":  "65f1c2b5e39d4e5f8a987654",
    "logoUrl":  "https://example.com/images/logo.png",
    "address":  "123 Nguyen Hue, District 1, Ho Chi Minh City",
    "coverImageUrl":  "https://example.com/images/cover.jpg",
    "reviewStatus":  "PENDING",
    "businessLicenseUrl":  "https://example.com/docs/license.pdf",
    "updatedAt":  "2026-09-08T10:00:00.000Z",
    "id":  "65f1c2b5e39d4e5f8a123456",
    "status":  "PENDING_APPROVAL",
    "rejectionReason":  "Missing business registration document",
    "phoneNumber":  "+84987654321",
    "reviewedAt":  "2026-09-08T10:00:00.000Z",
    "email":  "contact@luxuryspa.com"
}
``n* **Status 400**: Bad Request / Invalid action
* **Status 404**: Store not found

---


## 📦 Module: Staff Management

### **GET /api/v1/staff/me/profile**
**Mô tả:** Get current staff profile

**📌 Parameters:** Không có

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 

---

### **PATCH /api/v1/staff/me/profile**
**Mô tả:** Update current staff profile

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "phoneNumber":  "\u003cstring\u003e",
    "firstName":  "\u003cstring\u003e",
    "lastName":  "\u003cstring\u003e"
}
``n
**📥 Responses:**

* **Status 200**: 

---

### **GET /api/v1/stores/{storeId}/staff**
**Mô tả:** List all staff for a store

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 

---

### **POST /api/v1/stores/{storeId}/staff/invitations**
**Mô tả:** Invite a new staff member

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "email":  "\u003cstring\u003e",
    "phoneNumber":  "\u003cstring\u003e",
    "lastName":  "\u003cstring\u003e",
    "firstName":  "\u003cstring\u003e",
    "role":  "MANAGER | STAFF"
}
``n
**📥 Responses:**

* **Status 201**: 

---

### **GET /api/v1/stores/{storeId}/staff/{staffProfileId}**
**Mô tả:** Get details of a specific staff member

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 

---

### **PATCH /api/v1/stores/{storeId}/staff/{staffProfileId}**
**Mô tả:** Update a staff member role

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "role":  "MANAGER | STAFF"
}
``n
**📥 Responses:**

* **Status 200**: 

---

### **POST /api/v1/stores/{storeId}/staff/{staffProfileId}/suspend**
**Mô tả:** Suspend a staff member

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 201**: 

---

### **POST /api/v1/stores/{storeId}/staff/{staffProfileId}/activate**
**Mô tả:** Activate a suspended staff member

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 201**: 

---

### **POST /api/v1/stores/{storeId}/staff/{staffProfileId}/archive**
**Mô tả:** Archive a staff member

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 201**: 

---

### **POST /api/v1/stores/{storeId}/staff/invitations/{invitationId}/revoke**
**Mô tả:** Revoke a pending staff invitation

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=invitationId; required=True; in=path; schema=}.name) | $(@{name=invitationId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 201**: 

---

### **GET /api/v1/stores/{storeId}/staff/{staffProfileId}/services**
**Mô tả:** Get all services assigned to a staff member

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
[ <StaffServiceCapabilityResDto> ]
``n
---

### **PUT /api/v1/stores/{storeId}/staff/{staffProfileId}/services**
**Mô tả:** Assign services to a staff member (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "serviceIds":  [
                       "service-uuid-1",
                       "service-uuid-2"
                   ]
}
``n
**📥 Responses:**

* **Status 200**: 
`json
[ <StaffServiceCapabilityResDto> ]
``n
---

### **GET /api/v1/stores/{storeId}/staff/{staffProfileId}/schedule**
**Mô tả:** Get weekly working schedule for a staff member

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "updatedAt":  "\u003cstring\u003e",
    "days":  "\u003carray\u003e",
    "storeId":  "store-uuid",
    "staffProfileId":  "staff-profile-uuid"
}
``n
---

### **PUT /api/v1/stores/{storeId}/staff/{staffProfileId}/schedule**
**Mô tả:** Set or update weekly working schedule for a staff member (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=staffProfileId; required=True; in=path; schema=}.name) | $(@{name=staffProfileId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "days":  "\u003carray\u003e"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "updatedAt":  "\u003cstring\u003e",
    "days":  "\u003carray\u003e",
    "storeId":  "store-uuid",
    "staffProfileId":  "staff-profile-uuid"
}
``n
---


## 📦 Module: Services

### **GET /api/v1/stores/{storeId}/services**
**Mô tả:** List services with pagination, search and filters

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=page; required=False; in=query; schema=}.name) | $(@{name=page; required=False; in=query; schema=}.in) | ❌ Không | $type | - |
| $(@{name=limit; required=False; in=query; schema=}.name) | $(@{name=limit; required=False; in=query; schema=}.in) | ❌ Không | $type | - |
| $(@{name=search; required=False; in=query; description=Search by service name; schema=}.name) | $(@{name=search; required=False; in=query; description=Search by service name; schema=}.in) | ❌ Không | $type | Search by service name |
| $(@{name=categoryId; required=False; in=query; description=Filter by category ID; schema=}.name) | $(@{name=categoryId; required=False; in=query; description=Filter by category ID; schema=}.in) | ❌ Không | $type | Filter by category ID |
| $(@{name=status; required=False; in=query; description=Filter by status; schema=}.name) | $(@{name=status; required=False; in=query; description=Filter by status; schema=}.in) | ❌ Không | $type | Filter by status |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "page":  1,
    "limit":  10,
    "items":  "\u003carray\u003e",
    "total":  42,
    "totalPages":  5
}
``n
---

### **POST /api/v1/stores/{storeId}/services**
**Mô tả:** Create a new service (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "description":  "Complete haircut and professional blowdry treatment",
    "durationMinutes":  60,
    "imageUrl":  "https://example.com/haircut.jpg",
    "basePrice":  200000,
    "name":  "Haircut \u0026 Blowdry",
    "categoryId":  "category-uuid-123",
    "status":  "ACTIVE | INACTIVE"
}
``n
**📥 Responses:**

* **Status 201**: 
`json
{
    "updatedAt":  "\u003cstring\u003e",
    "id":  "f8c5b364-c71e-450b-8d19-4b2a309e7d9b",
    "createdAt":  "\u003cstring\u003e",
    "durationMinutes":  60,
    "imageUrl":  "https://example.com/haircut.jpg",
    "basePrice":  200000,
    "description":  "Complete haircut and styling",
    "name":  "Haircut \u0026 Blowdry",
    "categoryId":  "category-uuid",
    "status":  "ACTIVE",
    "storeId":  "store-uuid"
}
``n
---

### **GET /api/v1/stores/{storeId}/services/{serviceId}**
**Mô tả:** Get service by ID

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=serviceId; required=True; in=path; schema=}.name) | $(@{name=serviceId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "updatedAt":  "\u003cstring\u003e",
    "id":  "f8c5b364-c71e-450b-8d19-4b2a309e7d9b",
    "createdAt":  "\u003cstring\u003e",
    "durationMinutes":  60,
    "imageUrl":  "https://example.com/haircut.jpg",
    "basePrice":  200000,
    "description":  "Complete haircut and styling",
    "name":  "Haircut \u0026 Blowdry",
    "categoryId":  "category-uuid",
    "status":  "ACTIVE",
    "storeId":  "store-uuid"
}
``n
---

### **PATCH /api/v1/stores/{storeId}/services/{serviceId}**
**Mô tả:** Update a service (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=serviceId; required=True; in=path; schema=}.name) | $(@{name=serviceId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "description":  "Updated description",
    "durationMinutes":  90,
    "imageUrl":  "https://example.com/haircut-new.jpg",
    "basePrice":  250000,
    "name":  "Deluxe Haircut \u0026 Styling",
    "categoryId":  "category-uuid-123",
    "status":  "ACTIVE | INACTIVE"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "updatedAt":  "\u003cstring\u003e",
    "id":  "f8c5b364-c71e-450b-8d19-4b2a309e7d9b",
    "createdAt":  "\u003cstring\u003e",
    "durationMinutes":  60,
    "imageUrl":  "https://example.com/haircut.jpg",
    "basePrice":  200000,
    "description":  "Complete haircut and styling",
    "name":  "Haircut \u0026 Blowdry",
    "categoryId":  "category-uuid",
    "status":  "ACTIVE",
    "storeId":  "store-uuid"
}
``n
---

### **DELETE /api/v1/stores/{storeId}/services/{serviceId}**
**Mô tả:** Deactivate a service (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=serviceId; required=True; in=path; schema=}.name) | $(@{name=serviceId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: Service deactivated successfully

---


## 📦 Module: Service Categories

### **GET /api/v1/stores/{storeId}/service-categories**
**Mô tả:** List all service categories for a store

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
[ <ServiceCategoryResDto> ]
``n
---

### **POST /api/v1/stores/{storeId}/service-categories**
**Mô tả:** Create a new service category (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "status":  "ACTIVE | INACTIVE",
    "description":  "Hair cutting, coloring and styling services",
    "name":  "Hair Care"
}
``n
**📥 Responses:**

* **Status 201**: 
`json
{
    "id":  "b6f28b49-56d1-4b19-8eb2-b36fe7d42cf3",
    "createdAt":  "\u003cstring\u003e",
    "description":  "Hair cutting, coloring and styling services",
    "name":  "Hair Care",
    "updatedAt":  "\u003cstring\u003e",
    "status":  "ACTIVE",
    "storeId":  "store-uuid"
}
``n
---

### **GET /api/v1/stores/{storeId}/service-categories/{categoryId}**
**Mô tả:** Get service category by ID

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=categoryId; required=True; in=path; schema=}.name) | $(@{name=categoryId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "id":  "b6f28b49-56d1-4b19-8eb2-b36fe7d42cf3",
    "createdAt":  "\u003cstring\u003e",
    "description":  "Hair cutting, coloring and styling services",
    "name":  "Hair Care",
    "updatedAt":  "\u003cstring\u003e",
    "status":  "ACTIVE",
    "storeId":  "store-uuid"
}
``n
---

### **PATCH /api/v1/stores/{storeId}/service-categories/{categoryId}**
**Mô tả:** Update a service category (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=categoryId; required=True; in=path; schema=}.name) | $(@{name=categoryId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "status":  "ACTIVE | INACTIVE",
    "description":  "Updated description for hair services",
    "name":  "Hair Care \u0026 Treatments"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "id":  "b6f28b49-56d1-4b19-8eb2-b36fe7d42cf3",
    "createdAt":  "\u003cstring\u003e",
    "description":  "Hair cutting, coloring and styling services",
    "name":  "Hair Care",
    "updatedAt":  "\u003cstring\u003e",
    "status":  "ACTIVE",
    "storeId":  "store-uuid"
}
``n
---

### **DELETE /api/v1/stores/{storeId}/service-categories/{categoryId}**
**Mô tả:** Delete a service category (fails if services are attached)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=categoryId; required=True; in=path; schema=}.name) | $(@{name=categoryId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: Category deleted successfully

---


## 📦 Module: Customers

### **GET /api/v1/customers/me/profile**
**Mô tả:** Get current customer profile

**📌 Parameters:** Không có

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: Return current customer profile.
`json
{
    "phoneNumber":  "+1234567890",
    "id":  "507f1f77bcf86cd799439011",
    "createdAt":  "\u003cstring\u003e",
    "firstName":  "John",
    "lastName":  "Doe",
    "dateOfBirth":  "1990-01-01T00:00:00.000Z",
    "updatedAt":  "\u003cstring\u003e",
    "userId":  "507f1f77bcf86cd799439011"
}
``n* **Status 401**: Unauthorized.
* **Status 404**: Customer profile not found.

---

### **POST /api/v1/customers/me/profile**
**Mô tả:** Create customer profile after registration

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "phoneNumber":  "+1234567890",
    "dateOfBirth":  "1990-01-01",
    "firstName":  "John",
    "lastName":  "Doe"
}
``n
**📥 Responses:**

* **Status 201**: Customer profile created.
`json
{
    "phoneNumber":  "+1234567890",
    "id":  "507f1f77bcf86cd799439011",
    "createdAt":  "\u003cstring\u003e",
    "firstName":  "John",
    "lastName":  "Doe",
    "dateOfBirth":  "1990-01-01T00:00:00.000Z",
    "updatedAt":  "\u003cstring\u003e",
    "userId":  "507f1f77bcf86cd799439011"
}
``n* **Status 400**: Bad Request.
* **Status 401**: Unauthorized.
* **Status 409**: Profile already exists.

---

### **PATCH /api/v1/customers/me/profile**
**Mô tả:** Update customer profile

**📌 Parameters:** Không có

**📤 Request Body (pplication/json):**
`json
{
    "phoneNumber":  "+1234567890",
    "dateOfBirth":  "1990-01-01",
    "firstName":  "John",
    "lastName":  "Doe"
}
``n
**📥 Responses:**

* **Status 200**: Customer profile updated.
`json
{
    "phoneNumber":  "+1234567890",
    "id":  "507f1f77bcf86cd799439011",
    "createdAt":  "\u003cstring\u003e",
    "firstName":  "John",
    "lastName":  "Doe",
    "dateOfBirth":  "1990-01-01T00:00:00.000Z",
    "updatedAt":  "\u003cstring\u003e",
    "userId":  "507f1f77bcf86cd799439011"
}
``n* **Status 400**: Bad Request.
* **Status 401**: Unauthorized.
* **Status 404**: Customer profile not found.

---


## 📦 Module: Locations

### **GET /api/v1/locations/provinces**
**Mô tả:** Get list of Vietnam provinces and cities

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=search; required=False; in=query; description=Search by province name or code; schema=}.name) | $(@{name=search; required=False; in=query; description=Search by province name or code; schema=}.in) | ❌ Không | $type | Search by province name or code |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: List of 63 provinces/cities
`json
[ <ProvinceResDto> ]
``n
---

### **GET /api/v1/locations/provinces/{code}**
**Mô tả:** Get province details by code including districts

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=code; required=True; in=path; schema=}.name) | $(@{name=code; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: Province detail with districts
`json
{
    "districts":  "\u003carray\u003e",
    "divisionType":  "thanh_pho_trung_uong",
    "fullName":  "Thành phố Hà Nội",
    "name":  "Hà Nội",
    "phoneCode":  24,
    "code":  "01"
}
``n
---

### **GET /api/v1/locations/provinces/{code}/districts**
**Mô tả:** Get districts by province code

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=code; required=True; in=path; schema=}.name) | $(@{name=code; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=search; required=False; in=query; description=Search district by name or code; schema=}.name) | $(@{name=search; required=False; in=query; description=Search district by name or code; schema=}.in) | ❌ Không | $type | Search district by name or code |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: List of districts for specified province
`json
[ <DistrictResDto> ]
``n
---


## 📦 Module: Merchant Bookings

### **GET /api/v1/stores/{storeId}/bookings**
**Mô tả:** List and filter store bookings (supports daily calendar query)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=date; required=False; in=query; description=Filter by specific date (YYYY-MM-DD); schema=}.name) | $(@{name=date; required=False; in=query; description=Filter by specific date (YYYY-MM-DD); schema=}.in) | ❌ Không | $type | Filter by specific date (YYYY-MM-DD) |
| $(@{name=fromDate; required=False; in=query; description=Start range in ISO 8601; schema=}.name) | $(@{name=fromDate; required=False; in=query; description=Start range in ISO 8601; schema=}.in) | ❌ Không | $type | Start range in ISO 8601 |
| $(@{name=toDate; required=False; in=query; description=End range in ISO 8601; schema=}.name) | $(@{name=toDate; required=False; in=query; description=End range in ISO 8601; schema=}.in) | ❌ Không | $type | End range in ISO 8601 |
| $(@{name=status; required=False; in=query; description=Filter by booking status; schema=}.name) | $(@{name=status; required=False; in=query; description=Filter by booking status; schema=}.in) | ❌ Không | $type | Filter by booking status |
| $(@{name=staffProfileId; required=False; in=query; description=Filter by specialist staffProfileId; schema=}.name) | $(@{name=staffProfileId; required=False; in=query; description=Filter by specialist staffProfileId; schema=}.in) | ❌ Không | $type | Filter by specialist staffProfileId |
| $(@{name=search; required=False; in=query; description=Search customer name, phone or booking code; schema=}.name) | $(@{name=search; required=False; in=query; description=Search customer name, phone or booking code; schema=}.in) | ❌ Không | $type | Search customer name, phone or booking code |
| $(@{name=page; required=False; in=query; schema=}.name) | $(@{name=page; required=False; in=query; schema=}.in) | ❌ Không | $type | - |
| $(@{name=limit; required=False; in=query; schema=}.name) | $(@{name=limit; required=False; in=query; schema=}.in) | ❌ Không | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "page":  1,
    "limit":  20,
    "items":  "\u003carray\u003e",
    "total":  10,
    "totalPages":  1
}
``n
---

### **POST /api/v1/stores/{storeId}/bookings**
**Mô tả:** Create a new booking manually from Merchant App (Walk-in/Phone)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "paymentStatus":  "PENDING | PAID | REFUNDED | FAILED",
    "note":  "Customer requested quiet room",
    "serviceIds":  [
                       "service-uuid-1"
                   ],
    "customerPhone":  "+84912345678",
    "staffProfileId":  "staff-uuid-1",
    "customerId":  "\u003cstring\u003e",
    "customerName":  "Anna Nguyen",
    "startAt":  "2026-09-18T10:00:00.000Z"
}
``n
**📥 Responses:**

* **Status 201**: 
`json
{
    "startedAt":  "\u003cobject\u003e",
    "updatedAt":  "\u003cstring\u003e",
    "endAt":  "2026-09-18T11:00:00.000Z",
    "storeId":  "store-uuid-1",
    "createdAt":  "\u003cstring\u003e",
    "paidAt":  "\u003cobject\u003e",
    "subtotal":  350000,
    "checkedInAt":  "\u003cobject\u003e",
    "confirmedAt":  "\u003cobject\u003e",
    "completedAt":  "\u003cobject\u003e",
    "totalAmount":  350000,
    "cancelledBy":  "CUSTOMER | STAFF | SYSTEM",
    "staffProfileId":  "staff-uuid-1",
    "customerId":  "customer-uuid-1",
    "discountAmount":  0,
    "paymentMethod":  "CASH",
    "paymentStatus":  "PENDING",
    "customerSnapshot":  "\u003cCustomerSnapshotDto\u003e",
    "services":  "\u003carray\u003e",
    "status":  "CONFIRMED",
    "id":  "booking-uuid-1",
    "bookingCode":  "BK-20260918-1234",
    "startAt":  "2026-09-18T10:00:00.000Z",
    "cancelledAt":  "\u003cobject\u003e",
    "staffSnapshot":  "\u003cStaffSnapshotDto\u003e",
    "bookingSource":  "MERCHANT",
    "note":  "Customer requested quiet room",
    "cancellationReason":  "\u003cobject\u003e"
}
``n
---

### **GET /api/v1/stores/{storeId}/bookings/{bookingId}**
**Mô tả:** Get booking details by ID

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=bookingId; required=True; in=path; schema=}.name) | $(@{name=bookingId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "startedAt":  "\u003cobject\u003e",
    "updatedAt":  "\u003cstring\u003e",
    "endAt":  "2026-09-18T11:00:00.000Z",
    "storeId":  "store-uuid-1",
    "createdAt":  "\u003cstring\u003e",
    "paidAt":  "\u003cobject\u003e",
    "subtotal":  350000,
    "checkedInAt":  "\u003cobject\u003e",
    "confirmedAt":  "\u003cobject\u003e",
    "completedAt":  "\u003cobject\u003e",
    "totalAmount":  350000,
    "cancelledBy":  "CUSTOMER | STAFF | SYSTEM",
    "staffProfileId":  "staff-uuid-1",
    "customerId":  "customer-uuid-1",
    "discountAmount":  0,
    "paymentMethod":  "CASH",
    "paymentStatus":  "PENDING",
    "customerSnapshot":  "\u003cCustomerSnapshotDto\u003e",
    "services":  "\u003carray\u003e",
    "status":  "CONFIRMED",
    "id":  "booking-uuid-1",
    "bookingCode":  "BK-20260918-1234",
    "startAt":  "2026-09-18T10:00:00.000Z",
    "cancelledAt":  "\u003cobject\u003e",
    "staffSnapshot":  "\u003cStaffSnapshotDto\u003e",
    "bookingSource":  "MERCHANT",
    "note":  "Customer requested quiet room",
    "cancellationReason":  "\u003cobject\u003e"
}
``n
---

### **PATCH /api/v1/stores/{storeId}/bookings/{bookingId}/status**
**Mô tả:** Update booking status (Confirm, Check-in, Start, Complete, Cancel, No-show)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=bookingId; required=True; in=path; schema=}.name) | $(@{name=bookingId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "status":  "CONFIRMED",
    "cancellationReason":  "Customer called to cancel due to schedule conflict"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "startedAt":  "\u003cobject\u003e",
    "updatedAt":  "\u003cstring\u003e",
    "endAt":  "2026-09-18T11:00:00.000Z",
    "storeId":  "store-uuid-1",
    "createdAt":  "\u003cstring\u003e",
    "paidAt":  "\u003cobject\u003e",
    "subtotal":  350000,
    "checkedInAt":  "\u003cobject\u003e",
    "confirmedAt":  "\u003cobject\u003e",
    "completedAt":  "\u003cobject\u003e",
    "totalAmount":  350000,
    "cancelledBy":  "CUSTOMER | STAFF | SYSTEM",
    "staffProfileId":  "staff-uuid-1",
    "customerId":  "customer-uuid-1",
    "discountAmount":  0,
    "paymentMethod":  "CASH",
    "paymentStatus":  "PENDING",
    "customerSnapshot":  "\u003cCustomerSnapshotDto\u003e",
    "services":  "\u003carray\u003e",
    "status":  "CONFIRMED",
    "id":  "booking-uuid-1",
    "bookingCode":  "BK-20260918-1234",
    "startAt":  "2026-09-18T10:00:00.000Z",
    "cancelledAt":  "\u003cobject\u003e",
    "staffSnapshot":  "\u003cStaffSnapshotDto\u003e",
    "bookingSource":  "MERCHANT",
    "note":  "Customer requested quiet room",
    "cancellationReason":  "\u003cobject\u003e"
}
``n
---

### **PATCH /api/v1/stores/{storeId}/bookings/{bookingId}/assign-staff**
**Mô tả:** Assign or reassign staff specialist (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=bookingId; required=True; in=path; schema=}.name) | $(@{name=bookingId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "staffProfileId":  "staff-uuid-1"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "startedAt":  "\u003cobject\u003e",
    "updatedAt":  "\u003cstring\u003e",
    "endAt":  "2026-09-18T11:00:00.000Z",
    "storeId":  "store-uuid-1",
    "createdAt":  "\u003cstring\u003e",
    "paidAt":  "\u003cobject\u003e",
    "subtotal":  350000,
    "checkedInAt":  "\u003cobject\u003e",
    "confirmedAt":  "\u003cobject\u003e",
    "completedAt":  "\u003cobject\u003e",
    "totalAmount":  350000,
    "cancelledBy":  "CUSTOMER | STAFF | SYSTEM",
    "staffProfileId":  "staff-uuid-1",
    "customerId":  "customer-uuid-1",
    "discountAmount":  0,
    "paymentMethod":  "CASH",
    "paymentStatus":  "PENDING",
    "customerSnapshot":  "\u003cCustomerSnapshotDto\u003e",
    "services":  "\u003carray\u003e",
    "status":  "CONFIRMED",
    "id":  "booking-uuid-1",
    "bookingCode":  "BK-20260918-1234",
    "startAt":  "2026-09-18T10:00:00.000Z",
    "cancelledAt":  "\u003cobject\u003e",
    "staffSnapshot":  "\u003cStaffSnapshotDto\u003e",
    "bookingSource":  "MERCHANT",
    "note":  "Customer requested quiet room",
    "cancellationReason":  "\u003cobject\u003e"
}
``n
---

### **PATCH /api/v1/stores/{storeId}/bookings/{bookingId}/reschedule**
**Mô tả:** Reschedule booking start time (Owner/Manager only)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=bookingId; required=True; in=path; schema=}.name) | $(@{name=bookingId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "startAt":  "2026-09-18T14:30:00.000Z"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "startedAt":  "\u003cobject\u003e",
    "updatedAt":  "\u003cstring\u003e",
    "endAt":  "2026-09-18T11:00:00.000Z",
    "storeId":  "store-uuid-1",
    "createdAt":  "\u003cstring\u003e",
    "paidAt":  "\u003cobject\u003e",
    "subtotal":  350000,
    "checkedInAt":  "\u003cobject\u003e",
    "confirmedAt":  "\u003cobject\u003e",
    "completedAt":  "\u003cobject\u003e",
    "totalAmount":  350000,
    "cancelledBy":  "CUSTOMER | STAFF | SYSTEM",
    "staffProfileId":  "staff-uuid-1",
    "customerId":  "customer-uuid-1",
    "discountAmount":  0,
    "paymentMethod":  "CASH",
    "paymentStatus":  "PENDING",
    "customerSnapshot":  "\u003cCustomerSnapshotDto\u003e",
    "services":  "\u003carray\u003e",
    "status":  "CONFIRMED",
    "id":  "booking-uuid-1",
    "bookingCode":  "BK-20260918-1234",
    "startAt":  "2026-09-18T10:00:00.000Z",
    "cancelledAt":  "\u003cobject\u003e",
    "staffSnapshot":  "\u003cStaffSnapshotDto\u003e",
    "bookingSource":  "MERCHANT",
    "note":  "Customer requested quiet room",
    "cancellationReason":  "\u003cobject\u003e"
}
``n
---

### **PATCH /api/v1/stores/{storeId}/bookings/{bookingId}/payment**
**Mô tả:** Mark cash payment as PAID

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=bookingId; required=True; in=path; schema=}.name) | $(@{name=bookingId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body (pplication/json):**
`json
{
    "paymentMethod":  "CASH",
    "paymentStatus":  "PAID"
}
``n
**📥 Responses:**

* **Status 200**: 
`json
{
    "startedAt":  "\u003cobject\u003e",
    "updatedAt":  "\u003cstring\u003e",
    "endAt":  "2026-09-18T11:00:00.000Z",
    "storeId":  "store-uuid-1",
    "createdAt":  "\u003cstring\u003e",
    "paidAt":  "\u003cobject\u003e",
    "subtotal":  350000,
    "checkedInAt":  "\u003cobject\u003e",
    "confirmedAt":  "\u003cobject\u003e",
    "completedAt":  "\u003cobject\u003e",
    "totalAmount":  350000,
    "cancelledBy":  "CUSTOMER | STAFF | SYSTEM",
    "staffProfileId":  "staff-uuid-1",
    "customerId":  "customer-uuid-1",
    "discountAmount":  0,
    "paymentMethod":  "CASH",
    "paymentStatus":  "PENDING",
    "customerSnapshot":  "\u003cCustomerSnapshotDto\u003e",
    "services":  "\u003carray\u003e",
    "status":  "CONFIRMED",
    "id":  "booking-uuid-1",
    "bookingCode":  "BK-20260918-1234",
    "startAt":  "2026-09-18T10:00:00.000Z",
    "cancelledAt":  "\u003cobject\u003e",
    "staffSnapshot":  "\u003cStaffSnapshotDto\u003e",
    "bookingSource":  "MERCHANT",
    "note":  "Customer requested quiet room",
    "cancellationReason":  "\u003cobject\u003e"
}
``n
---


## 📦 Module: Merchant Dashboard

### **GET /api/v1/stores/{storeId}/dashboard/overview**
**Mô tả:** Get merchant home dashboard overview (Summary + Upcoming Bookings + Store Header)

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=date; required=False; in=query; description=Target business date (YYYY-MM-DD). Defaults to store current local date in UTC+07:00.; schema=}.name) | $(@{name=date; required=False; in=query; description=Target business date (YYYY-MM-DD). Defaults to store current local date in UTC+07:00.; schema=}.in) | ❌ Không | $type | Target business date (YYYY-MM-DD). Defaults to store current local date in UTC+07:00. |
| $(@{name=upcomingLimit; required=False; in=query; description=Maximum number of upcoming bookings to return (1 to 20); schema=}.name) | $(@{name=upcomingLimit; required=False; in=query; description=Maximum number of upcoming bookings to return (1 to 20); schema=}.in) | ❌ Không | $type | Maximum number of upcoming bookings to return (1 to 20) |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "summary":  "\u003cDashboardSummaryDto\u003e",
    "upcomingBookings":  "\u003carray\u003e",
    "store":  "\u003cStoreHeaderDto\u003e"
}
``n
---


## 📦 Module: Merchant Notifications

### **GET /api/v1/stores/{storeId}/notifications/unread-count**
**Mô tả:** Get unread notification count badge for store home

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "unreadCount":  3
}
``n
---

### **GET /api/v1/stores/{storeId}/notifications**
**Mô tả:** List notifications with pagination and status/type filter

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=page; required=False; in=query; schema=}.name) | $(@{name=page; required=False; in=query; schema=}.in) | ❌ Không | $type | - |
| $(@{name=limit; required=False; in=query; schema=}.name) | $(@{name=limit; required=False; in=query; schema=}.in) | ❌ Không | $type | - |
| $(@{name=status; required=False; in=query; schema=}.name) | $(@{name=status; required=False; in=query; schema=}.in) | ❌ Không | $type | - |
| $(@{name=type; required=False; in=query; schema=}.name) | $(@{name=type; required=False; in=query; schema=}.in) | ❌ Không | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "items":  "\u003carray\u003e",
    "pagination":  "\u003cNotificationPaginationMetaDto\u003e"
}
``n
---

### **PATCH /api/v1/stores/{storeId}/notifications/{notificationId}/read**
**Mô tả:** Mark a notification as read

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |
| $(@{name=notificationId; required=True; in=path; schema=}.name) | $(@{name=notificationId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "id":  "notification-uuid",
    "isRead":  true
}
``n
---

### **PATCH /api/v1/stores/{storeId}/notifications/read-all**
**Mô tả:** Mark all unread store notifications as read

**📌 Parameters (Path / Query):**

| Tên Param | Vị trí (In) | Bắt buộc | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| $(@{name=storeId; required=True; in=path; schema=}.name) | $(@{name=storeId; required=True; in=path; schema=}.in) | ✅ Có | $type | - |

**📤 Request Body:** Không yêu cầu

**📥 Responses:**

* **Status 200**: 
`json
{
    "updatedCount":  3
}
``n
---


