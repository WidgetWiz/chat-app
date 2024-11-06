import 'package:chat_app/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/auth_service.dart';
import '../chat/chat_service.dart';
import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // Logging out the user
  void logout(BuildContext context) async {
    try {
      await _authService.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged out successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error logging out: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("ERROR"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final userData = snapshot.data![index];
            return _buildUserListItem(userData, context);
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
        );
      },
    );
  }
}

Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    tileColor: Colors.grey[100],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    leading: CircleAvatar(
      backgroundColor: Colors.blueAccent,
      child: Text(
        userData["email"][0].toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
    title: Text(
      userData["email"],
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            reciverEmail: userData["email"],
          ),
        ),
      );
    },
  );
}
