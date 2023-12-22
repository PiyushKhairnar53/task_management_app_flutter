import 'package:task_management_app/imports.dart';

class InProgressView extends StatelessWidget{
  InProgressView({super.key});

  InProgressController controller = Get.put(InProgressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body:Center(
          child: Text(controller.name),
        )
    );
  }
}