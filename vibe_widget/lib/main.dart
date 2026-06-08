import 'package:flutter/material.dart';

void main() {
  runApp(const VibeApp());
}

class VibePost {
  final String message;
  final String tag;
  final DateTime time;
  VibePost({required this.message, required this.tag, required this.time});
}

class VibeApp extends StatelessWidget {
  const VibeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibe Board',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        backgroundColor: Color(0xFF0F0F1A),
        body: Center(child: VibeBoardWidget()),
      ),
    );
  }
}

class VibeBoardWidget extends StatefulWidget {
  const VibeBoardWidget({super.key});
  @override
  State<VibeBoardWidget> createState() => _VibeBoardWidgetState();
}

class _VibeBoardWidgetState extends State<VibeBoardWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<VibePost> _posts = [
    VibePost(message: 'Just shipped my first Flutter widget!', tag: '🚀', time: DateTime.now()),
    VibePost(message: 'Coffee + code = perfect morning', tag: '☕', time: DateTime.now()),
    VibePost(message: 'Anyone else debugging at midnight?', tag: '😅', time: DateTime.now()),
  ];
  String _selectedTag = '🔥';
  final List<String> _tags = ['🔥', '💡', '😅', '🚀', '☕', '🎉', '💬', '🌍'];

  void _submitPost() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _posts.insert(0, VibePost(message: text, tag: _selectedTag, time: DateTime.now()));
    });
    _controller.clear();
  }

  String _formatTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '\${diff.inMinutes}m ago';
    return '\${diff.inHours}h ago';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 580,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C30),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.25),
            blurRadius: 40,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white10)),
              ),
              child: Row(
                children: [
                  const Text('🌐', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vibe Board', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('share what is on your mind', style: TextStyle(color: Colors.white38, fontSize: 11)),
                    ],
                  ),
                  const Spacer(),
                  Builder(builder: (context) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('\${_posts.length} vibes', style: const TextStyle(color: Color(0xFF6C63FF), fontSize: 11)),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF13132A),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      maxLength: 80,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      decoration: const InputDecoration(
                        hintText: "What is your vibe right now?",
                        hintStyle: TextStyle(color: Colors.white30),
                        border: InputBorder.none,
                        isDense: true,
                        counterStyle: TextStyle(color: Colors.white24, fontSize: 10),
                      ),
                      onSubmitted: (_) => _submitPost(),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: _tags.map((tag) {
                                final selected = tag == _selectedTag;
                                return GestureDetector(
                                  onTap: () => setState(() => _selectedTag = tag),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    margin: const EdgeInsets.only(right: 6),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: selected ? const Color(0xFF6C63FF) : Colors.white10,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(tag, style: const TextStyle(fontSize: 16)),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _submitPost,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Color(0xFF6C63FF), Color(0xFFFF6584)]),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text('Post', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13132A),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.tag, style: const TextStyle(fontSize: 22)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.message, style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4)),
                              const SizedBox(height: 4),
                              Text(_formatTime(post.time), style: const TextStyle(color: Colors.white30, fontSize: 11)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
