import 'package:flutter/material.dart';
import 'utils/color_utils.dart';
import 'utils/text_utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // list for the events on top
  var list1 = [
    {'type': 'Gig', 'date': 'April 5, 2025', 'place': 'The Roxy', 'img': 'https://placehold.co/50'},
    {'type': 'Rehearsal', 'date': 'April 9, 2025', 'place': 'Studio B', 'img': 'https://placehold.co/50'},
  ];

  // requests part, needs delete to work
  var list2 = [
    {'title': 'Mixing session', 'status': 'Pending'},
    {'title': 'Photo Shoot', 'status': 'Pending'},
  ];

  final _formKey = GlobalKey<FormState>();
  final t1 = TextEditingController(); // venue
  final t2 = TextEditingController(); // date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // sidebar navigation thing
          Container(
            width: 80,
            color: AppColors.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.home, color: Colors.white), onPressed: () {}),
                SizedBox(height: 20),
                
                // button to open the dialog
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text('Plan a Gig', style: AppTextStyles.headingSmall),
                          content: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: t1,
                                  style: AppTextStyles.body,
                                  decoration: InputDecoration(
                                    labelText: 'Venue Name',
                                    labelStyle: AppTextStyles.bodySmall,
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                  ),
                                  validator: (v) {
                                    if (v!.isEmpty) return 'Required';
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: t2,
                                  style: AppTextStyles.body,
                                  decoration: InputDecoration(
                                    labelText: 'Date (YYYY-MM-DD)',
                                    labelStyle: AppTextStyles.bodySmall,
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                  ),
                                  validator: (v) {
                                    if (v!.isEmpty) return 'Required';
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Cancel', style: TextStyle(color: Colors.grey))),
                            
                            // save button logic
                            TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // adding to the list so it shows up
                                  setState(() {
                                    list1.add({
                                      'type': 'Gig',
                                      'date': t2.text,
                                      'place': t1.text,
                                      'img': 'https://placehold.co/50'
                                    });
                                  });
                                  
                                  t1.clear();
                                  t2.clear();
                                  Navigator.pop(ctx);

                                  // show success message
                                  showDialog(context: context, builder: (_) => AlertDialog(
                                      title: Text('Success'),
                                      content: Text('Gig added successfully!'),
                                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                                    ),
                                  );
                                }
                              },
                              child: Text('Save', style: TextStyle(color: AppColors.button)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 20),
                IconButton(icon: Icon(Icons.queue_music, color: Colors.white), onPressed: (){}),
                SizedBox(height: 20),
                IconButton(icon: Icon(Icons.attach_money, color: Colors.white), onPressed: (){}),
                SizedBox(height: 20),

                // go to calendar
                IconButton(
                  icon: Icon(Icons.calendar_month, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/calendar');
                  },
                ),
              ],
            ),
          ),

          // main content area
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset('assets/images/logo.png', height: 60),
                  ),
                  Text("Crimson Echo", style: AppTextStyles.heading),
                  SizedBox(height: 20),
                  Text("Upcoming Events", style: AppTextStyles.headingSmall),
                  SizedBox(height: 10),

                  // using listview builder here for the events
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: list1.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          elevation: 3,
                          child: ListTile(
                            leading: Container(width: 50, height: 50, color: AppColors.primaryLight, child: Icon(Icons.music_note, color: Colors.white)),
                            title: Text(list1[index]['type']!, style: TextStyle(color: AppColors.button, fontWeight: FontWeight.bold)),
                            subtitle: Text("${list1[index]['date']}\n${list1[index]['place']}", style: AppTextStyles.bodySmall),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20),
                  Text("Meeting Requests", style: AppTextStyles.headingSmall),
                  SizedBox(height: 10),

                  // requests list, has delete button
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: list2.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          elevation: 3,
                          child: ListTile(
                            title: Text(list2[index]['title']!, style: AppTextStyles.body),
                            subtitle: Text(list2[index]['status']!, style: AppTextStyles.bodySmall),
                            trailing: IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  list2.removeAt(index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Request declined')));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}