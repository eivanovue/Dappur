import 'package:dappur/models/story_model.dart';
import 'package:dappur/models/chat_model.dart';
import 'package:dappur/models/message_model.dart';

List<StoryModel> getStories() {

  List<StoryModel> stories = new List();
  StoryModel storyModel = new StoryModel();

  //1
  storyModel.imgUrl = 'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80';
  storyModel.username = "Sanskar";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //1
  storyModel.imgUrl = 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80';
  storyModel.username = "Jamie";
  stories.add(storyModel);

  storyModel = new StoryModel();
  
  //1
  storyModel.imgUrl = 'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80';
  storyModel.username = "Joshua";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //1
  storyModel.imgUrl = 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80';
  storyModel.username = "Mark";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //1
  storyModel.imgUrl = 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80';
  storyModel.username = "Ella";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //1
  storyModel.imgUrl = 'https://images.unsplash.com/photo-1531251445707-1f000e1e87d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=881&q=80';
  storyModel.username = "Shikha";
  stories.add(storyModel);

  storyModel = new StoryModel();

  return stories;

}

List<ChatModel> getChats() {
  List<ChatModel> chats = new List();
  ChatModel chatModel = new ChatModel();

  //1
  chatModel.name = "Alex Anton";
  chatModel.imgUrl ="https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1270&q=80";
  chatModel.lastMessage = "Oh hey there, Anna. I'm all good. How are you?";
  chatModel.lastSeenTime = "5m";
  chatModel.haveunreadmessages = true;
  chatModel.unreadmessages = 1;
  chats.add(chatModel);

  chatModel = new ChatModel();

  //1
  chatModel.name = "Ella Rose";
  chatModel.imgUrl ="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80";
  chatModel.lastMessage = "The workout was really tiring yestarday.";
  chatModel.lastSeenTime = "23m";
  chatModel.haveunreadmessages = false;
  chatModel.unreadmessages = 1;
  chats.add(chatModel);

  chatModel = new ChatModel();

  //1
  chatModel.name = "Mark Olson";
  chatModel.imgUrl ="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80";
  chatModel.lastMessage = "Congrats you just hit your goal! Lets share this with...";
  chatModel.lastSeenTime = "3h";
  chatModel.haveunreadmessages = false;
  chatModel.unreadmessages = 1;
  chats.add(chatModel);

  chatModel = new ChatModel();

  //1
  chatModel.name = "Shikha Jalil";
  chatModel.imgUrl ="https://images.unsplash.com/photo-1531251445707-1f000e1e87d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=881&q=80";
  chatModel.lastMessage = "I cannot believe she actually did that!";
  chatModel.lastSeenTime = "55m";
  chatModel.haveunreadmessages = false;
  chatModel.unreadmessages = 1;
  chats.add(chatModel);

  chatModel = new ChatModel();

  //1
  chatModel.name = "Joshua Hunt";
  chatModel.imgUrl ="https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80";
  chatModel.lastMessage = "How are you?";
  chatModel.lastSeenTime = "1h";
  chatModel.haveunreadmessages = false;
  chatModel.unreadmessages = 1;
  chats.add(chatModel);

  chatModel = new ChatModel();


  //1
  chatModel.name = "Senskar Tiwari";
  chatModel.imgUrl ="https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80";
  chatModel.lastMessage = "Hey long time no see.. Lets catch up soon!";
  chatModel.lastSeenTime = "2h";
  chatModel.haveunreadmessages = false;
  chatModel.unreadmessages = 1;
  chats.add(chatModel);

  chatModel = new ChatModel();






  return chats;
}

List<MessageModel> getMessages() {
  List<MessageModel> messages = new List();
  MessageModel messageModel = new MessageModel();

  //1
  messageModel.isByMe = false;
  messageModel.message = "Thank you. Bye.";
  messages.add(messageModel);

  messageModel = new MessageModel();

  //1
  messageModel.isByMe = true;
  messageModel.message = "Hey Alex, what's up?";
  messages.add(messageModel);

  messageModel = new MessageModel();

  //1
  messageModel.isByMe = false;
  messageModel.message = "Oh hey there, Sanska. I'm all good. How are you?";
  messages.add(messageModel);

  messageModel = new MessageModel();

  return messages;
}

