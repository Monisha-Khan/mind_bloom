import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  Map<int, int?> selectedOptions = {};

  final List<String> _optionsStep1 = [
    "😊 To feel better",
    "🧠 For mental clarity",
    "💪 To improve focus",
    "😌 To manage stress"
  ];

  final List<String> _optionsStep2 = [
    "😴 Poor sleep",
    "😟 Feeling anxious",
    "🤯 Overthinking",
    "📉 Low motivation"
  ];

  final List<OptionData> _optionsStep3 = [
    OptionData('I want to manage stress and anxiety better', 'assets/icons/brain.svg'),
    OptionData('I want to improve my relationships', 'assets/icons/heart_hand.svg'),
    OptionData('I want to better understand how emotions work', 'assets/icons/emotions.svg'),
    OptionData('I want to feel more positive each day', 'assets/icons/sun.svg'),
    OptionData('Something else', 'assets/icons/question.svg'),
  ];

  final List<OptionData> _optionsStep4 = [
    OptionData('Guided meditation sessions', 'assets/icons/meditation.svg'),
    OptionData('Mood tracking', 'assets/icons/mood.svg'),
    OptionData('Healthy habits & challenges', 'assets/icons/habits.svg'),
    OptionData('Community and group support', 'assets/icons/group.svg'),
    OptionData('Something else', 'assets/icons/question.svg'),
  ];

  final List<OptionData> _optionsStep5 = [
    OptionData('Sleep & relaxation', 'assets/icons/sleep.svg'),
    OptionData('Emotional regulation', 'assets/icons/balance.svg'),
    OptionData('Self-confidence', 'assets/icons/star.svg'),
    OptionData('Motivation & productivity', 'assets/icons/rocket.svg'),
    OptionData('Relationships & connections', 'assets/icons/handshake.svg'),
  ];

  void _nextPage() {
    const totalPages = 6;
    if (currentPage < totalPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // Go directly to homepage when onboarding finishes
      Navigator.pushReplacementNamed(context, '/homepage');
    }
  }

  @override
  Widget build(BuildContext context) {
    const totalPages = 6;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: LinearProgressIndicator(
                value: (currentPage + 1) / totalPages,
                color: Colors.green,
                backgroundColor: Colors.grey[300],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => currentPage = i),
                children: [
                  _buildWelcome(),
                  _buildEmojiOptions(1, "Why are you using Mind Bloom?", _optionsStep1),
                  _buildEmojiOptions(2, "What are you struggling with the most?", _optionsStep2),
                  _buildSvgOptions(3, "What brings you here?", _optionsStep3),
                  _buildSvgOptions(4, "How would you like to start?", _optionsStep4),
                  _buildSvgOptions(5, "What should we focus on together?", _optionsStep5),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _nextPage,
                child: Text(
                  currentPage < totalPages - 1 ? 'Continue' : 'Finish',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Image.asset('assets/images/welcome_illustration.png', height: 200),
          const SizedBox(height: 40),
          const Text(
            "Welcome to Mind Bloom",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            "Let’s understand your needs to provide\na personalized experience",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildEmojiOptions(int step, String question, List<String> options) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ...options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            bool isSelected = selectedOptions[step] == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptions[step] = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green.shade50 : Colors.white,
                  border: Border.all(color: isSelected ? Colors.green : Colors.grey.shade300, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(option, style: const TextStyle(fontSize: 16)),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSvgOptions(int step, String question, List<OptionData> options) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedOptions[step] == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptions[step] = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green.shade50 : Colors.white,
                      border: Border.all(color: isSelected ? Colors.green : Colors.grey[300]!, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          options[index].iconPath,
                          width: 28,
                          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 14),
                        Expanded(child: Text(options[index].label, style: const TextStyle(fontSize: 15))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OptionData {
  final String label;
  final String iconPath;
  OptionData(this.label, this.iconPath);
}
