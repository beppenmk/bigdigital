import 'dart:math';

import 'package:flutter/material.dart';


class GameOfLifeScreen extends StatefulWidget {
  @override
  _GameOfLifeScreenState createState() => _GameOfLifeScreenState();
}

class _GameOfLifeScreenState extends State<GameOfLifeScreen> {
  final int rows = 20;
  final int cols = 20;
  late  List<List<bool>> grid;

  int generaNumeroCasuale(int min, int max) {
    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }

  @override
  void initState() {
    super.initState();
    initializeGrid();
    startSimulation();
  }

  void initializeGrid() {
    grid = List.generate(rows, (_) => List.generate(cols, (_) => false));
    // Add initial live cells if needed

    int vivi = generaNumeroCasuale(1, rows*cols);

    for (var i = 0; i < vivi; i++) {
      grid[generaNumeroCasuale(0, rows-1)][generaNumeroCasuale(0, cols-1)] = true;
    }






  }

  void startSimulation() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          updateGrid();
        });
        startSimulation();
      }
    });
  }

  void updateGrid() {
    List<List<bool>> newGrid = List.generate(rows, (_) => List.generate(cols, (_) => false));

    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < cols; j++) {
        int neighbors = countNeighbors(i, j);
        if (grid[i][j]) {
          newGrid[i][j] = (neighbors == 2 || neighbors == 3);
        } else {
          newGrid[i][j] = (neighbors == 3);
        }
      }
    }

    grid = newGrid;
  }

  int countNeighbors(int i, int j) {
    int count = 0;
    for (var x = -1; x <= 1; x++) {
      for (var y = -1; y <= 1; y++) {
        if (x == 0 && y == 0) continue; // Skip the current cell
        int newX = i + x;
        int newY = j + y;
        if (newX >= 0 && newX < rows && newY >= 0 && newY < cols && grid[newX][newY]) {
          count++;
        }
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game of Life'),
      ),
      body: GridView.builder(
        itemCount: rows * cols,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols,
        ),
        itemBuilder: (BuildContext context, int index) {
          int i = index ~/ cols;
          int j = index % cols;
          return GestureDetector(
            onTap: () {
              setState(() {
                grid[i][j] = !grid[i][j];
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: grid[i][j] ? Colors.blue : Colors.white,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: initializeGrid,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}