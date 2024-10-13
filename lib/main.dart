import 'package:flutter/material.dart';

// Import the Flutter Material library
void main() {
  // Define the main function as the entry point for the application
  runApp(const MyApp());
  // Run the app with the MyApp widget as the root widget
}

class MyApp extends StatelessWidget {
// Create a StatelessWidget class named MyApp
  const MyApp({super.key});
  // Define a constructor for MyApp

  @override
  // Override the build method to define the widget tree
  Widget build(BuildContext context) {
    // This widget sets the title and theme for the entire app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade Calculator', // Set the title of the app
      theme: ThemeData(
        // Define the theme for the app
        // Here, we set the primarySwatch to pink
        primarySwatch: Colors.pink,
      ),
      home: const HomeScreen(),
      // Set the home property to specify the initial screen of the app
    ); // Use the HomeScreen as the initial screen
  }
}

class HomeScreen extends StatefulWidget {
  // Create a StatefulWidget class named HomeScreen
  const HomeScreen({super.key});
  // Define a constructor for HomeScreen

  @override
  State<HomeScreen> createState() => HomeScreenState();
} // Override the createState method to create a State object

class HomeScreenState extends State<HomeScreen> {
  // Create a State class named HomeScreenState that manages the state of the HomeScreen widget
  final TextEditingController scoreController = TextEditingController();
  // Create a TextEditingController to manage the text input field
  String result =
      ''; // Define a String variable to store the calculated grade result

  @override
  void dispose() {
    scoreController.dispose(); // Dispose of the controller
    super.dispose();
  } // Dispose of the TextEditingController when the widget is no longer used

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Return a Scaffold widget as the root of the UI
      appBar: AppBar(
        title: const Text(
          // title: const Text('Grade Calculator'),

          'Grade Calculator',
          style: TextStyle(
            color: Colors.white, // Set text color to white
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: Colors.pink, // Set background color to pink
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: scoreController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                  prefixIcon: const Icon(Icons.percent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateGrade,
                child: const Text('Calculate',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.pink),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateGrade() {
    if (scoreController.text.isNotEmpty) {
      final scoreText = scoreController.text;
      if (double.tryParse(scoreText) != null) {
        final score = double.parse(scoreText);
        setState(() {
          result = getGrade(score);
        });
      } else {
        setState(() {
          result = 'Invalid Input';
        });
      }
    } else {
      setState(() {
        result = 'Please enter a score';
      });
    }
  }

  String getGrade(double score) {
    if (score >= 90) {
      return 'A';
    } else if (score >= 80) {
      return 'B';
    } else if (score >= 70) {
      return 'C';
    } else if (score >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }
}
