import 'package:flutter_test/flutter_test.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';

void main() {
  test('test name', () {
    final finaInicio = DateTime(2000, 1, 10);
    final finafinal = DateTime(2000, 1, 20);

    expect(DateTime(2000, 1, 1).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 2).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 3).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 4).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 5).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 6).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 7).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 8).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 9).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 10).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 11).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 12).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 13).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 14).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 15).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 16).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 17).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 18).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 19).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 20).between(finaInicio, finafinal), true);
    expect(DateTime(2000, 1, 21).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 22).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 23).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 24).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 25).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 26).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 27).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 28).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 29).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 30).between(finaInicio, finafinal), false);
    expect(DateTime(2000, 1, 31).between(finaInicio, finafinal), false);
  });
}
