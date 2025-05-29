import 'package:flutter/material.dart';

class ManagementusersViewBody extends StatefulWidget {
  const ManagementusersViewBody({super.key});

  @override
  State<ManagementusersViewBody> createState() =>
      _ManagementusersViewBodyState();
}

class _ManagementusersViewBodyState extends State<ManagementusersViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  String selectedRole = 'Employee';
  final List<String> roles = ['Employee', 'Admin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Manage Facility Users"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // or any custom action
          },
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black, // or your preferred color
            ),
            padding: EdgeInsets.all(8), // adjust for size
            child: Icon(
              Icons.arrow_back,
              color: Colors.white, // arrow color
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search Bar
                  Container(
                    width: 300,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white24),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white54,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,vertical: 6
                        ),
                        hintText: 'Search by Name / ID',
                        hintStyle: const TextStyle(color: Colors.white54,),
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Circular Icon Button
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white24),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.person_add_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: Center(
                                child: Container(
                                  width: 350,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E1E1E),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Header
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Add User',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap:
                                                () =>
                                                    Navigator.of(context).pop(),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),

                                      // Name
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        controller: nameController,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: 'Enter name',
                                          hintStyle: TextStyle(
                                            color: Colors.white38,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white38,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),

                                      // ID & Role
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'ID',
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                                TextField(
                                                  controller: idController,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  decoration: const InputDecoration(
                                                    hintText: 'Enter ID',
                                                    hintStyle: TextStyle(
                                                      color: Colors.white38,
                                                    ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color:
                                                                Colors.white38,
                                                          ),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Role',
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                                DropdownButtonFormField<String>(
                                                  value: selectedRole,
                                                  dropdownColor:
                                                      Colors.grey[900],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  iconEnabledColor:
                                                      Colors.white,
                                                  decoration: const InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color:
                                                                Colors.white38,
                                                          ),
                                                        ),
                                                  ),
                                                  items:
                                                      roles
                                                          .map(
                                                            (role) =>
                                                                DropdownMenuItem(
                                                                  value: role,
                                                                  child: Text(
                                                                    role,
                                                                  ),
                                                                ),
                                                          )
                                                          .toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedRole = value!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 30),

                                      // Add Button
                                      ElevatedButton(
                                        onPressed: () {
                                          // Handle add user logic here
                                          Navigator.of(
                                            context,
                                          ).pop(); // Optional: Close after adding
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFF66F2A4,
                                          ),
                                          foregroundColor: Colors.black,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 12,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Add',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
