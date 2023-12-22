import '../../../../../../../imports.dart';

class CodeReviewView extends StatelessWidget{
  CodeReviewView({super.key});

  CodeReviewController controller = Get.put(CodeReviewController());

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
              Text(controller.value),
            ],
          ),
        )
    );
  }

}