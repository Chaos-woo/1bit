import 'package:qkit/network/errors/error_handle.dart';

class Github401ErrorHandle extends DioResponseErrorHandle {
  Github401ErrorHandle()
      : super(handle: (String? message) {
          return ContinuePaasErrorSelection.yes;
        });

  @override
  List<int> get httpStatusCodes => [401];
}
