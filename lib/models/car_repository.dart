import 'package:ana_rusadze_car_app/data/dummy_data.dart';

import 'car.dart';

class CarRepository {
  void addCar(Car car) {
    DUMMY_DATA.insert(0, car);
  }

  void removeCar(int index) {
    DUMMY_DATA.removeAt(index);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [car]);
  }
}
