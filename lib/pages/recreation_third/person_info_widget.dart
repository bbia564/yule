import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

class PersonInfoWidget extends StatefulWidget {
  const PersonInfoWidget({required this.allTopicNum,Key? key}) : super(key: key);
  final int allTopicNum;

  @override
  State<PersonInfoWidget> createState() => _PersonInfoWidgetState();
}

class _PersonInfoWidgetState extends State<PersonInfoWidget> {

  String userName = 'user-0015';
  int keepDays = 0;

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        userName = prefs.getString('userName') ?? '-';
        final now = DateTime.now();
        final createTime = prefs.getString('createTime');
        keepDays = now.difference(DateTime.tryParse(createTime ?? '') ?? DateTime.now()).inDays;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: <Widget>[
        Image.asset(
          'assets/defaultAvatar.webp',
          width: 61,
          height: 61,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: <Widget>[
              Text(
                userName,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              <Widget>[
                <Widget>[
                  const Text(
                    'Used',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$keepDays days',
                    style: const TextStyle(fontSize: 14),
                  )
                ].toRow(),
                const SizedBox(
                  width: 20,
                ),
                <Widget>[
                  const Text(
                    'Topic',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.allTopicNum.toString(),
                    style: const TextStyle(fontSize: 14),
                  )
                ].toRow()
              ].toRow()
            ].toColumn(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start))
      ].toRow(),
    ).decorated(color: Colors.white, borderRadius: BorderRadius.circular(10));
  }
}
