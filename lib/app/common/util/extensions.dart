
import '../../../imports.dart';

abstract class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );

  BorderSide borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      BorderSide(
        color: color ?? Colors.white,
        width: toDouble(),
        style: style ?? BorderStyle.solid,
      );
}

extension FutureExt<T> on Future<Response<T>?>{
  void futureValue(
      Function(T value) response,{
        Function(String error)? onError,
        VoidCallback? retryFunction,
        bool showLoading = true
      }){
      final _interface = Get.find<ApiInterfaceController>();
      _interface.error = null;

      // if(showLoading)

      timeout(
        Constants.timeout,
        onTimeout: (){
          Utils.showSnackbar(Strings.connectionTimeout);
          _retry(_interface, retryFunction!);
          throw const ApiError(
            type: ErrorType.connectTimeout,
            error: Strings.connectionTimeout,
          );
        }
      ).then((value) {
        // LoadingDialog.closeLoadingDialog();
        if (value?.body != null) {
          final result = ApiResponse.getResponse<T>(value!);
          if (result != null) {
            response(result);
          }
        }
        _interface.update();
      }).catchError((e) {

        if (e == null) return;

        final String errorMessage = e is ApiError ? e.message : e.toString();

        if (e is ApiError) {
          if ((e.type == ErrorType.connectTimeout ||
              e.type == ErrorType.noConnection)) {
            _interface.error = e;

            _retry(_interface, retryFunction!);
          } else {
            Utils.showDialog(
              errorMessage,
              onTap: errorMessage != Strings.unauthorize
                  ? null
                  : () {
                Storage.clearStorage();
                Get.offAllNamed(
                  Routes.LOGIN,
                  //change the ROUTE to the LOGIN or SPLASH screen so that the
                  //user can login again on UnauthorizeError error
                );
              },
            );
          }
        }

        if (onError != null) {
          onError(errorMessage);
        }

        printError(info: 'catchError: error: $e\nerrorMessage: $errorMessage');

      });
  }
  void _retry(
      ApiInterfaceController _interface,
      VoidCallback retryFunction,
      ) {
    _interface.retry = retryFunction;
    _interface.update();
  }

}
