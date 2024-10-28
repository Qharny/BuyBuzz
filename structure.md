# Project Structure Documentation

## Frontend (Flutter) Structure
```
lib/
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   ├── api_paths.dart
│   │   ├── asset_paths.dart
│   │   └── theme_constants.dart
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   ├── api_client.dart
│   │   ├── interceptors/
│   │   └── network_info.dart
│   └── utils/
│       ├── input_validators.dart
│       ├── date_formatter.dart
│       ├── price_formatter.dart
│       └── storage_utils.dart
│
├── config/
│   ├── routes/
│   │   ├── app_router.dart
│   │   └── route_names.dart
│   ├── themes/
│   │   ├── app_theme.dart
│   │   ├── light_theme.dart
│   │   └── dark_theme.dart
│   └── app_config.dart
│
├── data/
│   ├── datasources/
│   │   ├── remote/
│   │   │   ├── auth_remote_data.dart
│   │   │   ├── product_remote_data.dart
│   │   │   └── order_remote_data.dart
│   │   └── local/
│   │       ├── auth_local_data.dart
│   │       └── cart_local_data.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── product_model.dart
│   │   ├── order_model.dart
│   │   ├── cart_model.dart
│   │   └── store_model.dart
│   └── repositories/
│       ├── auth_repository_impl.dart
│       ├── product_repository_impl.dart
│       └── order_repository_impl.dart
│
├── domain/
│   ├── entities/
│   │   ├── user.dart
│   │   ├── product.dart
│   │   ├── order.dart
│   │   └── cart.dart
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   ├── product_repository.dart
│   │   └── order_repository.dart
│   └── usecases/
│       ├── auth/
│       ├── products/
│       └── orders/
│
├── presentation/
│   ├── blocs/
│   │   ├── auth/
│   │   ├── products/
│   │   ├── cart/
│   │   └── orders/
│   ├── widgets/
│   │   ├── common/
│   │   │   ├── custom_button.dart
│   │   │   ├── custom_textfield.dart
│   │   │   └── loading_indicator.dart
│   │   ├── product/
│   │   └── order/
│   └── screens/
│       ├── auth/
│       │   ├── login_screen.dart
│       │   └── register_screen.dart
│       ├── home/
│       │   ├── home_screen.dart
│       │   └── home_components/
│       ├── product/
│       │   ├── product_list_screen.dart
│       │   └── product_detail_screen.dart
│       ├── cart/
│       │   └── cart_screen.dart
│       ├── order/
│       │   ├── order_screen.dart
│       │   └── tracking_screen.dart
│       └── profile/
│           └── profile_screen.dart
│
└── main.dart

## Backend (Node.js) Structure
```
src/
├── config/
│   ├── database.js
│   ├── express.js
│   ├── env.js
│   └── logger.js
│
├── api/
│   ├── routes/
│   │   ├── auth.route.js
│   │   ├── user.route.js
│   │   ├── product.route.js
│   │   ├── order.route.js
│   │   ├── vendor.route.js
│   │   └── payment.route.js
│   │
│   ├── controllers/
│   │   ├── auth.controller.js
│   │   ├── user.controller.js
│   │   ├── product.controller.js
│   │   ├── order.controller.js
│   │   ├── vendor.controller.js
│   │   └── payment.controller.js
│   │
│   ├── middlewares/
│   │   ├── auth.middleware.js
│   │   ├── error.middleware.js
│   │   ├── validate.middleware.js
│   │   └── upload.middleware.js
│   │
│   └── validations/
│       ├── auth.validation.js
│       ├── user.validation.js
│       └── product.validation.js
│
├── models/
│   ├── user.model.js
│   ├── product.model.js
│   ├── order.model.js
│   ├── cart.model.js
│   ├── store.model.js
│   └── payment.model.js
│
├── services/
│   ├── auth.service.js
│   ├── email.service.js
│   ├── payment.service.js
│   ├── notification.service.js
│   └── upload.service.js
│
├── utils/
│   ├── ApiError.js
│   ├── catchAsync.js
│   ├── jwt.js
│   └── logger.js
│
└── app.js

## Additional Folders
```
assets/
├── images/
├── icons/
└── fonts/

test/
├── unit/
├── widget/
└── integration/

docs/
├── api/
└── setup/
```