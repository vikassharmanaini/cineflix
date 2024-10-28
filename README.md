# cineflix

A new Flutter project

# Project Structure

lib/
|-- main.dart
|-- app/
|   |-- app.dart
|   |-- app_routes.dart
|   |-- app_constants.dart
|-- core/
|   |-- services/
|   |   |-- api_service.dart
|   |   |-- database_service.dart
|   |-- utils/
|   |   |-- validators.dart
|   |   |-- date_formatters.dart
|   |-- models/
|   |   |-- user_model.dart
|   |   |-- post_model.dart
|   |-- repositories/
|   |   |-- user_repository.dart
|   |   |-- post_repository.dart
|-- viewmodels/
|   |-- user_view_model.dart
|   |-- post_view_model.dart
|-- views/
|   |-- user/
|   |   |-- user_screen.dart
|   |   |-- user_details_screen.dart
|   |-- post/
|   |   |-- post_screen.dart
|   |   |-- post_details_screen.dart
|   |-- common/
|   |   |-- loading_widget.dart
|   |   |-- error_widget.dart
|   |-- components/
|   |   |-- custom_button.dart
|   |   |-- custom_text_field.dart
|-- widgets/
|   |-- custom_app_bar.dart
|   |-- custom_card.dart
|-- providers/
|   |-- user_provider.dart
|   |-- post_provider.dart
|-- resources/
|   |-- colors.dart
|   |-- strings.dart
|   |-- images.dart
|-- routes/
|   |-- app_routes.dart
|-- tests/
|   |-- viewmodels/
|   |   |-- user_view_model_test.dart
|   |   |-- post_view_model_test.dart
|   |-- views/
|   |   |-- user_screen_test.dart
|   |   |-- post_screen_test.dart
|-- localization/
|   |-- app_localizations.dart

WITH GETX

lib/
|-- main.dart
|-- app/
|   |-- app.dart
|   |-- app_bindings.dart
|   |-- app_routes.dart
|   |-- app_pages.dart
|-- core/
|   |-- services/
|   |   |-- api_service.dart
|   |   |-- storage_service.dart
|   |-- models/
|   |   |-- user_model.dart
|   |   |-- post_model.dart
|   |-- utils/
|   |   |-- validators.dart
|   |   |-- formatters.dart
|   |-- constants/
|   |   |-- app_constants.dart
|   |   |-- app_strings.dart
|   |   |-- app_colors.dart
|-- controllers/
|   |-- user_controller.dart
|   |-- post_controller.dart
|   |-- auth_controller.dart
|-- views/
|   |-- user/
|   |   |-- user_screen.dart
|   |   |-- user_details_screen.dart
|   |-- post/
|   |   |-- post_screen.dart
|   |   |-- post_details_screen.dart
|   |-- common/
|   |   |-- loading_widget.dart
|   |   |-- error_widget.dart
|   |-- components/
|   |   |-- custom_button.dart
|   |   |-- custom_text_field.dart
|-- widgets/
|   |-- custom_app_bar.dart
|   |-- custom_card.dart
|-- bindings/
|   |-- user_binding.dart
|   |-- post_binding.dart
|-- providers/
|   |-- user_provider.dart
|   |-- post_provider.dart
|-- resources/
|   |-- assets/
|   |   |-- images/
|   |-- colors.dart
|   |-- strings.dart
|   |-- images.dart
|-- routes/
|   |-- app_routes.dart
|   |-- app_pages.dart
|-- tests/
|   |-- controllers/
|   |   |-- user_controller_test.dart
|   |   |-- post_controller_test.dart
|   |-- views/
|   |   |-- user_screen_test.dart
|   |   |-- post_screen_test.dart
|-- localization/
|   |-- app_localizations.dart
