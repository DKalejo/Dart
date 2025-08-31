import 'package:flutter/material.dart';

class Menu extends StatelessWidget implements PreferredSizeWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 90,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      backgroundColor: Colors.white,
      // image
      leading: Padding(
        padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/images/profilePicture.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      // title
      title: const Text('Store Name'),
      titleTextStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Color(0xFF3561FE),
      ),
      actions: [
        // bell icon
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFD2E4FF), width: 1),
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.notifications,
                    size: 22,
                    color: Color(0xFF3561FE),
                  ),
                  onPressed: () {},
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              right: 8,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFF93839),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        // more icon
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFD2E4FF), width: 1),
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.more_vert_sharp,
                    size: 26,
                    color: Color(0xFF3561FE),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
