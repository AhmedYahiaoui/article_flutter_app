# article_flutter_app

A new Flutter project.

for caching, i used CachedImageNetwork (cache the images)
Animation for displaying the details of article

For unit test
run this : flutter test test/unit_test/article_service.test.dart

For widget test
flutter test test/widget_test/article_screen.test.dart

Why this Architecture :
For the state management : Provider due to its simplicity and performance and since the test is simple and doesn't required a large scale state management system.
for the folder/file structure : Modularized services and models for reusability and maintainability.
