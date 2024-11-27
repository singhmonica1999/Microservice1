# **User Management Service**

####  **About**: 

This microservice is a part of project, '**MediaNest**' - It conveys the idea of a cozy, organized space (a "nest") where users can collect, manage, and track all their favorite media—movies, series, books, and games—in one place. 

It handles user authentication, authorization, and profile management, including user preferences for notifications and media privacy settings.

- **User Profile & Preferences**:
  - Users can register for notifications about new media added in specific genres or types (movies, series, games, books).
  - Store the user’s preferences regarding media notifications.
  - When registering, users can subscribe to notifications for specific genres or types of media (e.g., "Notify me when a new movie in the action genre is added").

- **Endpoints**:
  - `POST /users`: Register a new user.
  - `POST /users/login`: User login and authentication.
  - `GET /users/{id}`: Retrieve user profile details.
  - `PUT /users/{id}`: Update user profile information.
  - `POST /users/logout`: User logout.
  - `POST /users/{id}/notifications/subscribe`: Subscribe the user to specific media genre/type notifications.
  - `GET /users/{id}/notifications/subscriptions`: Retrieve a list of genres/types the user is subscribed to.

---

### **API Specifications**

### **User Management Service API Specifications**

------

### **1. POST /users**

**Description:** Creates a new user with the provided information.

- **Request:**

  ```http
  POST /users HTTP/1.1
  Host: user-management-service.com
  Content-Type: application/json
  Authorization: Bearer <JWT>
  ```

- **Request Body:**

  ```json
  {
    "username": "john_doe",
    "email": "john.doe@example.com",
    "password": "securepassword123"
  }
  ```

- **Response:**

  ```json
  {
    "user_id": "123e4567-e89b-12d3-a456-426614174000",
    "username": "john_doe",
    "email": "john.doe@example.com",
    "is_active": true,
    "created_at": "2024-11-27T10:00:00Z",
    "updated_at": "2024-11-27T10:00:00Z"
  }
  ```

- **Validation:**

  - `username`, `email`, and `password` must be provided.
  - `email` must be unique.
  - `password` must meet minimum complexity (length, special characters, etc.).

------

### **2. GET /users/{user_id}**

**Description:** Fetches details of a specific user by their `user_id`.

- **Request:**

  ```http
  GET /users/{user_id} HTTP/1.1
  Host: user-management-service.com
  Authorization: Bearer <JWT>
  ```

- **Response:**

  ```json
  {
    "user_id": "123e4567-e89b-12d3-a456-426614174000",
    "username": "john_doe",
    "email": "john.doe@example.com",
    "is_active": true,
    "created_at": "2024-11-27T10:00:00Z",
    "updated_at": "2024-11-27T10:00:00Z"
  }
  ```

- **Validation:**

  - The `user_id` should be a valid UUID.
  - Response should return user information or `404 Not Found` if the user does not exist.

------

### **3. PUT /users/{user_id}**

**Description:** Updates user information for the specified `user_id`.

- **Request:**

  ```http
  PUT /users/{user_id} HTTP/1.1
  Host: user-management-service.com
  Content-Type: application/json
  Authorization: Bearer <JWT>
  ```

- **Request Body:**

  ```json
  {
    "username": "john_doe_updated",
    "email": "john.doe.updated@example.com",
    "password": "newsecurepassword456"
  }
  ```

- **Response:**

  ```json
  {
    "user_id": "123e4567-e89b-12d3-a456-426614174000",
    "username": "john_doe_updated",
    "email": "john.doe.updated@example.com",
    "is_active": true,
    "created_at": "2024-11-27T10:00:00Z",
    "updated_at": "2024-11-27T10:05:00Z"
  }
  ```

- **Validation:**

  - `username`, `email`, and `password` are optional in the request body. If provided, they must follow the same validation rules as when creating a user.
  - `email` must be unique (cannot be updated to an already used email).
  - Response should return the updated user details.

------

### **4. POST /users/validate**

**Description:** Validates if a user exists and is active.

- **Request:**

  ```http
  POST /users/validate HTTP/1.1
  Host: user-management-service.com
  Content-Type: application/json
  Authorization: Bearer <JWT>
  ```

- **Request Body:**

  ```json
  {
    "user_id": "123e4567-e89b-12d3-a456-426614174000"
  }
  ```

- **Response:**

  ```json
  {
    "exists": true,
    "is_active": true
  }
  ```

- **Validation:**

  - `user_id` must be a valid UUID.
  - Response will indicate whether the user exists and if the user is active.

------

### **5. DELETE /users/{user_id}**

**Description:** Deletes the user with the specified `user_id`.

- **Request:**

  ```http
  DELETE /users/{user_id} HTTP/1.1
  Host: user-management-service.com
  Authorization: Bearer <JWT>
  ```

- **Response:**

  ```json
  {
    "message": "User deleted successfully"
  }
  ```

- **Validation:**

  - The `user_id` should be valid and existing.
  - This operation will also remove the user's data from other related services.

------

### **6. GET /users/{user_id}/preferences**

**Description:** Fetches the notification preferences of the user (notifications for specific media type or genre).

- **Request:**

  ```http
  GET /users/{user_id}/preferences HTTP/1.1
  Host: user-management-service.com
  Authorization: Bearer <JWT>
  ```

- **Response:**

  ```json
  [
    {
      "media_type": "movie",
      "genre": "action"
    },
    {
      "media_type": "series",
      "genre": "drama"
    }
  ]
  ```

- **Validation:**

  - `user_id` must be valid and existing.
  - Should return a list of notification preferences stored in the Notifications Service.

------

### **7. POST /users/{user_id}/preferences**

**Description:** Allows the user to register their notification preferences (specific media types and genres) with the Notifications Service.

- **Request:**

  ```http
  POST /users/{user_id}/preferences HTTP/1.1
  Host: user-management-service.com
  Content-Type: application/json
  Authorization: Bearer <JWT>
  ```

- **Request Body:**

  ```json
  {
    "media_type": "movie",
    "genre": "comedy"
  }
  ```

- **Response:**

  ```json
  {
    "message": "Preference added successfully"
  }
  ```

- **Validation:**

  - `user_id` must be valid and existing.
  - `media_type` should be one of the predefined values (`movie`, `series`, `book`, `game`).
  - `genre` should be a valid genre name.

------

### **Error Responses**

- **400 Bad Request:** If the request body is missing required fields or contains invalid data.
- **404 Not Found:** If a resource (user or preference) cannot be found.
- **401 Unauthorized:** If the request does not include a valid authorization token.
- **500 Internal Server Error:** For unexpected server errors.

------

### **Notes**

- **Authentication & Authorization**: All endpoints require authentication via a valid JWT token.
- **User Preferences**: The `preferences` for notification are managed and stored in the **Notifications Service**, and the User Management Service communicates with the Notifications Service via API calls for user preference management.

---

### **DB Schema (MySQL)**
Tracks registered users of the system.

| **Field Name**  | **Type**     | **Description**                                         |
| --------------- | ------------ | ------------------------------------------------------- |
| `user_id`       | Primary Key  | Unique identifier for each user.                        |
| `username`      | String (255) | Unique username for the user.                           |
| `email`         | String (255) | User's email address (must be unique).                  |
| `password_hash` | String (255) | Hashed password for authentication.                     |
| `is_active `    | Boolean      | Indicates if the user account is active or deactivated. |
| `created_at`    | Timestamp    | Timestamp of when the user account was created.         |
| `updated_at`    | Timestamp    | Timestamp of the last update to the user information.   |

**Note**:

- `id` as the primary key.
- Connected to `Media` (`created_by_user_id`) and `Notifications` (`user_id`).

---

### **How to Setup the Project**

**Dependencies**

- Java 17+
- Maven
- MySQL



**Steps**

1. Clone the repository
2. Execute: mvn clean install
3. Setup database using the db-setup.sql
4. Run the jar file.

----

### **Contributors**

Thanks to the following contributors for their efforts on this project:

[![Contributors](https://contrib.rocks/image?repo=[singhmonica1999](https://github.com/singhmonica1999)/medianest)](https://github.com/[singhmonica1999](https://github.com/singhmonica1999/medianest/graphs/contributors)