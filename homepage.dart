import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Top Bar =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B3B3B),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, size: 28),
                    onPressed: () {},
                  )
                ],
              ),

              const SizedBox(height: 4),
              const Text(
                "Message of the day",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 12),
              // ===== Quote Card =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"Don\'t waste time knocking on the wall, hoping to turn it into a door."',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "—Coco Chanel",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // ===== Mood Section =====
              const Text(
                "How are you feeling today?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _MoodItem("😡", "V. Bad"),
                  _MoodItem("😞", "Bad"),
                  _MoodItem("😐", "Neutral"),
                  _MoodItem("😊", "Good"),
                  _MoodItem("😁", "V. Good"),
                ],
              ),

              const SizedBox(height: 24),
              // ===== Daily Stats =====
              const Text(
                "Daily Stats",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Water Tracker
              _StatCard(
                title: "Water",
                value: "1.5L / 2L",
                progress: 0.75,
                cups: 5,
              ),

              const SizedBox(height: 16),

              // Steps Tracker
              _StepsCard(
                steps: 2245,
                goal: 10000,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Mood Widget
class _MoodItem extends StatelessWidget {
  final String emoji;
  final String label;
  const _MoodItem(this.emoji, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 30)),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}

// Water Stat Card
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final double progress;
  final int cups;
  const _StatCard({
    required this.title,
    required this.value,
    required this.progress,
    required this.cups,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: List.generate(
                    cups,
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(Icons.local_drink,
                          size: 28, color: Colors.green[400]),
                    ),
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle, color: Colors.green),
          )
        ],
      ),
    );
  }
}

// Steps Card
class _StepsCard extends StatelessWidget {
  final int steps;
  final int goal;
  const _StepsCard({required this.steps, required this.goal});

  @override
  Widget build(BuildContext context) {
    double progress = steps / goal;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Steps",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            "$steps / $goal",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            color: Colors.green,
            minHeight: 6,
          ),
          const SizedBox(height: 4),
          Text("${(progress * 100).toStringAsFixed(0)}%",
              style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
