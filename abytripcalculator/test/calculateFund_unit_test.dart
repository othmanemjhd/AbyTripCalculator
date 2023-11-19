import 'package:abytripcalculator/services/CalculateFundsByTrancheService.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("fund should calculated", ()   {
      int numbreOfKilom = 122;
      double funds = calculateFunds(numbreOfKilom).result;
      expect(funds, 29.95);
  });


}