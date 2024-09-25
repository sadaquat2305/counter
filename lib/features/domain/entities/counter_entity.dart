class CounterEntity {
  int count;
  CounterEntity({required this.count});

  void increment() {
    count++;
  }

  void decreament() {
    count--;
  }
}
