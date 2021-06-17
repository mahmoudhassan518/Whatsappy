import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

import 'BaseController.dart';
import 'DataResponse.dart';

class BaseActivity extends StatelessWidget {
  Widget _activity;

  final BaseController _controller = Get.find();

  BaseActivity(this._activity);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _activity,
        Obx(
          () => _buildBaseWidget(context),
        )
      ],
    );
  }

  Widget _buildBaseWidget(BuildContext context) {
    switch (_controller.status.status) {
      case Status.Success:
      case Status.Init:
        return SizedBox();
      case Status.Error:
        _onError(_controller);
        return SizedBox();
      case Status.Loading:
        _controller.idle();
        return loadingWidget(context);
      default:
        _controller.idle();
        return SizedBox();
    }
  }

  _onError(BaseController controller) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Add Your Code here.
      showSnackBar(title: "Error", content: "${controller.status.error}");
      controller.idle();
    });
  }

// _onLoading(BuildContext context, BaseController controller) {
//   WidgetsBinding.instance!.addPostFrameCallback((_) {
//     controller.idle();
//   });
}
