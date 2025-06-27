import 'package:flutter/material.dart';

class ProfileRow extends StatefulWidget {
  final String name;
  final String detail;
  final String label;
  final VoidCallback onDelete;

  const ProfileRow({super.key, required this.name, required this.detail, required this.label, required this.onDelete});

  @override
  State<ProfileRow> createState() => _ProfileRowState();
}

class _ProfileRowState extends State<ProfileRow> {
  bool _showDetail = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150'), radius: 24),
            const SizedBox(width: 12),
            Expanded(child: Text(widget.name)),
            _showDetail
                ? Text(widget.detail)
                : InkWell(
                    onTap: () => setState(() => _showDetail = true),
                    child: Text('View', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline))),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: widget.onDelete,
            )
          ],
        ),
      ),
    );
  }
}
