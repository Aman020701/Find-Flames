import 'package:flutter/cupertino.dart';

class Chat {

   String imageUrl;
   String message;
   String name;
   String time;
   String chat;

  Chat(this.imageUrl,this.message,this.name,this.time,this.chat);

}

  Chat user1 = Chat('assets/images/31-16-23-013104.png',
                   'Hii!',
                   'Jordan',
                    '13:10',
                      '1');

 Chat user2 = Chat('assets/images/29-16-23-012959.png',
    'Hii!',
    'Tim',
    '13:10',
     '0');

Chat user3 = Chat( 'assets/images/29-16-23-012949.png',
    'Typing...',
    'James',
    '13:10',
       '9');