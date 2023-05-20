import 'package:flutter/material.dart';
import 'package:helpmeout/resources/courselist.dart';
import 'package:helpmeout/components/Course.dart';

class BTech extends StatelessWidget {
  List<Course> Sem1 = [
    Course(title: 'Physics', respath: 'resources/sem1/physics'),
    Course(title: 'Linear Algebra', respath: 'resources/sem1/lal'),
    Course(title: 'Introduction to Programming', respath: 'resources/sem1/itp'),
    Course(title: 'FEE', respath: 'resources/sem1/fee'),
    Course(title: 'Professional Communication', respath: 'resources/sem1/pfc'),
    Course(title: 'Principles of Management', respath: 'resources/sem1/pom'),
  ];

  List<Course> Sem4 = [
    Course(
        title: 'Priciples of Programming Language',
        respath: 'resources/sem4/ppl'),
    Course(title: 'Computer Networks', respath: 'resources/sem4/cn'),
    Course(
        title: 'Database Management Systems', respath: 'resources/sem1/dbms'),
    Course(
        title: 'Design and Analysis of Algorithms',
        respath: 'resources/sem1/daa'),
    Course(title: 'Software Engineering', respath: 'resources/sem1/se'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF68B1D0),
        title: Text('Resources'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Add padding around buttons
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF68B1D0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Courses(courselist: Sem1),
                    ),
                  );
                },
                child: Text('sem 1'),
              ),
              SizedBox(height: 16.0), // Add spacing between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF68B1D0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sem2(),
                    ),
                  );
                },
                child: Text('sem 2'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF68B1D0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sem3(),
                    ),
                  );
                },
                child: Text('sem 3'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF68B1D0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Courses(courselist: Sem4),
                    ),
                  );
                },
                child: Text('Sem 4'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF68B1D0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sem5(),
                    ),
                  );
                },
                child: Text('sem 5'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF68B1D0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sem6(),
                    ),
                  );
                },
                child: Text('sem 6'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF68B1D0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sem7(),
                    ),
                  );
                },
                child: Text('sem 7'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF68B1D0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sem8(),
                    ),
                  );
                },
                child: Text('sem 8'),
              ),
              SizedBox(height: 16.0),
              // Add spacing between buttons
              // Add more buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}

class Sem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester 2'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}

class Sem3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester 3'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}

class Sem4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester 4'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}

class Sem5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester 5'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}

class Sem6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester 6'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}

class Sem7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester 7'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}

class Sem8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester 8'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}
