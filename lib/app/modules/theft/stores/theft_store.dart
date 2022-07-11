import 'package:flutter_triple/flutter_triple.dart';
import 'package:appfurtos/app/core/models/ocurrency_model.dart';

class TheftStore extends NotifierStore<Exception, OcurrencyModel> {
  TheftStore() : super(OcurrencyModel(status: 1));

  Future<void> registerTheft() {
    setLoading(true);

    setLoading(false);

    throw Exception();
  }
}
