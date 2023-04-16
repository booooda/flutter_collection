import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlideCard extends StatelessWidget {
  final Color color;
  const SlideCard({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              icon: Icons.delete,
              label: 'Delete',
              onPressed: (BuildContext context) {
                //print('dfsfsd');
              },
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(20),
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
              onPressed: (BuildContext context) {
                //print('dfsfsd');
              },
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              icon: Icons.delete,
              label: 'Delete',
              onPressed: (BuildContext context) {
                //rint('dfsfsd');
              },
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(20),
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
              onPressed: (BuildContext context) {
                //print('dfsfsd');
              },
            ),
          ],
        ),
        child: Container(
            width: width(context) * .9,
            height: 80,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Slide me',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
