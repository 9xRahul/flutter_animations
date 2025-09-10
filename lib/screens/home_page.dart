import 'package:flutter/material.dart';
import 'package:flutter_animations/models/activity_model.dart';
import 'package:flutter_animations/screens/details.dart';
import 'package:flutter_animations/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> activities = [];

  @override
  void initState() {
    // TODO: implement initState
    activities = [
      Activity(
        name: "Dating",
        location: "Goa",
        imageUrl: "assets/img/dating.jpg",
        price: 500,
      ),
      Activity(
        name: "massage",
        location: "Goa",
        imageUrl: "assets/img/massage.jpg",
        price: 500,
      ),
      Activity(
        name: "Pub",
        location: "Goa",
        imageUrl: "assets/img/pub.jpg",
        price: 500,
      ),
      Activity(
        name: "Off Road",
        location: "Goa",
        imageUrl: "assets/img/off.jpg",
        price: 500,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff162035),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TweenAnimationBuilder(
              duration: Duration(seconds: 2),
              tween: Tween<double>(begin: 0, end: 1),
              child: AppText(
                data: "Pick your\nfavourite activity",
                color: Colors.white,
                size: 28,
              ),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Padding(
                    padding: EdgeInsets.only(top: value * 50, left: value * 10),
                    child: child,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  Activity activity = activities[index];
                  return buildCard(activity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(Activity activity) {
    return Card(
      color: Color(0xff59567B),
      child: Container(
        height: 100,
        child: Center(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(activity: activity),
                ),
              );
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: 'activity-img-${activity.imageUrl}',
                child: Image.asset(activity.imageUrl, height: 100),
              ),
            ),
            trailing: AppText(
              data: activity.price.toString(),
              color: Colors.white,
            ),
            title: AppText(data: activity.name, color: Colors.white),
            subtitle: AppText(data: activity.location, color: Colors.white54),
          ),
        ),
      ),
    );
  }
}
