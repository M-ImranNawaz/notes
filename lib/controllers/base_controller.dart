import '../helper/dialog_helper.dart';
import '../services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      DialogHelper.hideLoading();
      DialogHelper.showErrorDialog(description: error.message);
    } else if (error is FetchDataException) {
      DialogHelper.hideLoading();
      DialogHelper.showErrorDialog(description: error.message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.hideLoading();
      DialogHelper.showErrorDialog(
          description: 'Oops! It took too long to respond');
    } else if (error is DataAlreadyExistException) {
      DialogHelper.hideLoading();
      DialogHelper.showErrorDialog(
          title: 'Error', description: 'You Have Already Added Your Preferences');
    }
  }

  showLoading({message = 'Loading...'}) {
    DialogHelper.showLoading(message: message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
