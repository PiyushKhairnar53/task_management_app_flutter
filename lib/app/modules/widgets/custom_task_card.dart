import 'package:task_management_app/imports.dart';

class CustomTaskCard extends StatelessWidget{

  final String? title,priority,todoUserRole,firstName,lastName;
  final dynamic estimatedTime,createdAt;

  // CustomTaskCard({
  //   Key? key,
  //   this.title,
  //   this.priority,
  //   this.todoUserRole,
  //   this.firstName,
  //   this.lastName,
  //   this.estimatedTime,
  //   this.createdAt
  // }) : super(key: key);

  const CustomTaskCard(
      {super.key,
        this.title,
        this.priority,
        this.todoUserRole,
        this.firstName,
        this.lastName,
        this.estimatedTime,
        this.createdAt
      });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$title",
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text("Priority",style: TextStyle(color: Colors.grey),),
                      Text('$priority',style: const TextStyle(fontSize: 16),),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Estimate",style: TextStyle(color: Colors.grey),),
                      Text('$estimatedTime hrs',style: const TextStyle(fontSize: 16),),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("$todoUserRole",style: const TextStyle(color: Colors.grey),),
                      Text('$firstName $lastName',style: const TextStyle(fontSize: 16),),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(Get.context as BuildContext).size.width/1.5,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon( // <-- Icon
                            Icons.edit,
                            size: 24.0,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor,
                          ),
                          label: const Text('Change Status',style: TextStyle(color: Colors.white,fontSize: 16),), // <-- Text
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Updated At - $createdAt",style: const TextStyle(color: Colors.grey),)
                ],
              ),
            ],
          ),
        ),
    );
  }

}