import 'package:abytripcalculator/services/CalculateFundsByTrancheService.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("fund should calculated", ()   {
    CalculateFund instance = CalculateFund();
      double numbreOfKilom = 122;
      double funds = instance.calculate(numbreOfKilom);
      expect(funds, 29.95);
  });


}