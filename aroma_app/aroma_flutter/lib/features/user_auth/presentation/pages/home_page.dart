import 'package:aroma_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:aroma_flutter/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// TODO: build out home page UI
/* 
  3. add graphs of live data in the dashboard
  4. build api and add dummy data
*/

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hello, User'),
          actions: <Widget>[
            const Text('Logout'),
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                showToast(message: 'Logged out');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              // Desktop layout: 1 row of 4 cards (equal width)
              return Row(
                children: [
                  // Navigation menu...
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          for (int i = 0; i < 4; i++) // Loop to create 4 cards
                            Expanded(
                              child: DashboardCard(
                                title: 'Card ${i + 1} Title',
                                value: '${i + 1}00',
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              // Mobile layout: 2 rows of 2 cards (equal width)
              return const SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DashboardCard(
                              title: 'Most common in your area',
                              value: '123',
                            ),
                          ),
                          SizedBox(width: 10.0), // spacing between cards
                          Expanded(
                            child: DashboardCard(
                              title: 'Trending near you',
                              value: '456',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DashboardCard(
                              title: 'Not too sure what this will be yet',
                              value: '789',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Your Smell Map",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Expanded(child: DashboardMapCard()),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            // link to report page
            Navigator.pushNamed(context, '/newreport')
          },
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// Replace this with your actual dashboard card widget
class DashboardCard extends StatelessWidget {
  final String title;
  final String value;

  const DashboardCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title),
            Text(value, style: const TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}

class DashboardMapCard extends StatelessWidget {
  const DashboardMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Placeholder(),
    );
  }
}
