import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_clean/modules/home/domain/repositories/home_repository.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

@GenerateMocks([HomeRepository])
void main() {
  
}
