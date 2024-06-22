import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});


  final overview = '(From themoviedb.com) One day at work, unsuccessful '
'puppeteer Craig finds a portal into the head of actor John '
'Malkovich. The portal soon becomes a passion for anybody who '
'enters its mad and controlling world of overtaking another human '
'body.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(
      'Details'
    ),),body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(child: buildDetailPageCore(context),),
    ),);
  }
}
