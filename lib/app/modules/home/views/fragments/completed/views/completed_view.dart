import '../../../../../../../imports.dart';

class CompletedView extends StatelessWidget{
  CompletedView({super.key});

  CompletedController controller = Get.put(CompletedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(controller.name),
            ],
          ),
        )
    );
  }

}