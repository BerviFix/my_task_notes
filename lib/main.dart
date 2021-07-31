import 'package:flutter/material.dart';

class Day {
  final int nr;
  String? task;
  Day(this.nr);
}

class Month {
  final String name;
  List<Day>? days;

  Month(this.name, int daysNr) {
    days = List.generate(daysNr, (daysNr) => Day(daysNr + 1));
  }
}

final months = [
  Month('Gennaio', 31),
  Month('Febbraio', 28),
  Month('Marzo', 31),
  Month('Aprile', 30),
  Month('Maggio', 31),
  Month('Giugno', 30),
  Month('Luglio', 31),
  Month('Agosto', 31),
  Month('Settembre', 30),
  Month('Ottobre', 31),
  Month('Novembre', 30),
  Month('Dicembre', 31),
];

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.limeAccent),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMonthIndex = 0;

  void onMonthSelected(int index) {
    setState(() {
      _selectedMonthIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: months[_selectedMonthIndex].days!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: ListTile(
                title: Text(
                  months[_selectedMonthIndex].days![index].nr.toString(),
                ),
                subtitle: Text(
                    months[_selectedMonthIndex].days![index].task ?? 'No Task'),
              ),
            );
          }),
      drawer: Container(
        width: 300,
        color: Colors.white,
        child: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  color: index == _selectedMonthIndex
                      ? Colors.grey.shade300
                      : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      onMonthSelected(index);
                    },
                    title: Text(
                      months[index].name,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.shade300,
                );
              },
              itemCount: months.length),
        ),
      ),
    );
  }
}
