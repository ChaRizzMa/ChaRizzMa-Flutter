import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Approve Rizzults"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                // if item count is greater than 6, the 6th one will goto a detail view
                // TODO:
                return ListTile(
                  onTap: () {},
                  dense: true,
                  title: Text("From @username"),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.check),
                          splashRadius: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.close),
                          splashRadius: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
