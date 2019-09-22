import 'package:flutter_app/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('test', () {
    Bloc bloc = Bloc();

    bloc.testMethod();

    expect(bloc.i, 1);
  });
}
