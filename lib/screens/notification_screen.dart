import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/bookmark_cotroller.dart';
import 'package:getx_tutorial_app/widgets/empty_state_widget.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final BookmarkController controller = Get.find<BookmarkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return EmptyStateWidget(
            icon: Icons.notifications_off_outlined,
            text: "No Notification",
            subtext: "",
          );
        }
        return ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),

                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF211B2D)
                        : const Color(0x1A4861E0),

                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                title: Text(
                  controller.notifications[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),

                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
