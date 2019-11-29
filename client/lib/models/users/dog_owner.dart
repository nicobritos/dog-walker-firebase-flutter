import 'package:dogwalker2/models/db_object.dart';
import 'package:dogwalker2/models/users/address.dart';

import 'dogs/dog.dart';

class DogOwner extends DBObject {
  String _name;
  String _surname;
  String _email;
  Address _address;
  DateTime _birthday;
  String _phone;
  double _ratingAvg;
  bool _verified;
  List<Dog> _dogs;

  DogOwner(id, this._name, this._surname, this._email, this._address, this._birthday, this._phone, this._ratingAvg, this._verified) : super(id);

  bool get verified => _verified;

  double get ratingAvg => _ratingAvg;

  List<Dog> get dogs => _dogs;

  addDog(Dog dog) {
    if (_dogs == null)
      _dogs = [];
    _dogs.add(dog);
  }

  addDogs(Iterable<Dog> dogs) {
    if (_dogs == null)
      _dogs = [];
    _dogs.addAll(dogs);
  }

  String get phone => _phone;

  DateTime get birthday => _birthday;

  Address get address => _address;

  String get surname => _surname;

  String get name => _name;

  String get email => _email;
}
