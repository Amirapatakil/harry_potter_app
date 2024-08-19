import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContentList extends StatefulWidget {
  const ContentList({
    super.key,
    this.image,
    required this.isPersom,
    this.text,
    this.color,
    this.emoji,
    this.index,
  });

  final String? image;
  final String? text;
  final String? emoji;
  final bool isPersom;
  final Color? color;
  final String? index;

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: widget.isPersom
            ? BorderRadius.circular(30)
            : BorderRadius.circular(10),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: widget.image ?? '',
          placeholder: (context, url) => Image.network(
              width: 100,
              height: 50,
              fit: BoxFit.cover,
              'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0='),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
