import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _myCart =
          prefs.getStringList('ff_myCart')?.map((path) => path.ref).toList() ??
              _myCart;
    });
    _safeInit(() {
      _myCartSummary =
          prefs.getStringList('ff_myCartSummary')?.map(double.parse).toList() ??
              _myCartSummary;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _myCart = [];
  List<DocumentReference> get myCart => _myCart;
  set myCart(List<DocumentReference> _value) {
    _myCart = _value;
    prefs.setStringList('ff_myCart', _value.map((x) => x.path).toList());
  }

  void addToMyCart(DocumentReference _value) {
    _myCart.add(_value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void removeFromMyCart(DocumentReference _value) {
    _myCart.remove(_value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void removeAtIndexFromMyCart(int _index) {
    _myCart.removeAt(_index);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void updateMyCartAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _myCart[_index] = updateFn(_myCart[_index]);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void insertAtIndexInMyCart(int _index, DocumentReference _value) {
    _myCart.insert(_index, _value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  List<double> _myCartSummary = [];
  List<double> get myCartSummary => _myCartSummary;
  set myCartSummary(List<double> _value) {
    _myCartSummary = _value;
    prefs.setStringList(
        'ff_myCartSummary', _value.map((x) => x.toString()).toList());
  }

  void addToMyCartSummary(double _value) {
    _myCartSummary.add(_value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void removeFromMyCartSummary(double _value) {
    _myCartSummary.remove(_value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromMyCartSummary(int _index) {
    _myCartSummary.removeAt(_index);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void updateMyCartSummaryAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _myCartSummary[_index] = updateFn(_myCartSummary[_index]);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void insertAtIndexInMyCartSummary(int _index, double _value) {
    _myCartSummary.insert(_index, _value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
