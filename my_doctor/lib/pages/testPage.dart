import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "image":
          "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
      "id": 1,
      "name": "Dr. Manu Kumar",
      "des": "Co-founder & CEO @ ",
    },
    {
      "id": 2,
      "name": "BL Kumawat",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png",
    },
    {
      "id": 3,
      "name": "Rohit Kumar",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://sa1s3optim.patientpop.com/assets/images/provider/photos/1888657.jpg",
    },
    {
      "id": 4,
      "name": "Mitesh Raj",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LmG47_W3RM0QBVGI23-vodL_oOOJxLIBrg&usqp=CAU",
    },
    {
      "id": 5,
      "name": "Dr. Manu Kumar",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://img.freepik.com/free-photo/black-man-city_1157-17027.jpg?w=2000",
    },
    {
      "id": 6,
      "name": "Deno James",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://media.gettyimages.com/photos/portrait-of-smiling-mid-adult-man-wearing-tshirt-picture-id985138674?s=612x612",
    },
    {
      "id": 7,
      "name": "Kaviraj Patil",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://image.shutterstock.com/image-photo/handsome-young-man-running-across-260nw-587931092.jpg",
    },
    {
      "id": 8,
      "name": "Raja Ram",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://media.istockphoto.com/photos/portrait-of-young-happy-indian-business-man-executive-looking-at-picture-id1309489745?b=1&k=20&m=1309489745&s=170667a&w=0&h=Wo_7nESC_ePyEYfEsnOm-rP6ElkxbWqIB3Ga4W3nw8M=",
    },
    {
      "id": 9,
      "name": "Caversky",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://media.istockphoto.com/photos/young-man-looking-at-digital-tablet-picture-id1184382530?k=20&m=1184382530&s=612x612&w=0&h=-G67wR9BU2-XqLTR70purl0vb2PFbu3OAg0T7O_ZpiI=",
    },
    {
      "id": 10,
      "name": "Becky",
      "des": "Co-founder & CEO @ ",
      "image":
          "https://e0.365dm.com/22/06/2048x1152/skysports-erling-haaland-man-city_5803257.jpg",
    },
  ];
  List<Map<String, dynamic>> finalselectedUser = [];

  List<Map<String, dynamic>> _foundUsers = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    // _foundUsers = _allUsers;
    _searchController = TextEditingController();
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FocusScope(
              child: TextField(
                onChanged: (value) => _runFilter(value),
                controller: _searchController,
                // focusNode: _searchFocusNode,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Only display search results when the search bar is focused
            _searchController.text != ""
                ? Container(
                    height: 400,
                    width: 500,
                    child: _foundUsers.isNotEmpty
                        ? ListView.builder(
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) => Card(
                              elevation: 1,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              child: ListTile(onTap: (){
                                setState(() {
                                  finalselectedUser.add(
                                    {
                                      "id": _foundUsers[index]["id"],
                                      "name": _foundUsers[index]["name"],
                                      "des": _foundUsers[index]["des"],
                                      "image": _foundUsers[index]["image"],
                                    },
                                  );
                                });
                                _searchController.clear();
                                FocusScope.of(context).unfocus();
                              },
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      NetworkImage(_foundUsers[index]['image']),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(_foundUsers[index]['name']),
                                subtitle: Text('${_foundUsers[index]["des"]}'),
                              ),
                            ),
                          )
                        : InkWell(
                      onTap: (){
                        setState(() {
                          finalselectedUser.add(
                            {
                              "id": "" ,
                              "name": _searchController.text,
                              "des": "",
                              "image": "",
                            },
                          );
                          _searchController.clear();
                          FocusScope.of(context).unfocus();
                        });
                      },
                          child: const Text(
                              'No results found. Please try with a different search',
                              style: TextStyle(fontSize: 24),
                            ),
                        ),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            Container(
              height: 200,
              width: 500,
              child:ListView.builder(
                itemCount: finalselectedUser.length,
                itemBuilder: (context, index) => Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(onTap: (){
                    /*setState(() {
                      finalselectedUser.add(
                        {
                          "id": _foundUsers[index]["id"],
                          "name": _foundUsers[index]["name"],
                          "des": _foundUsers[index]["des"],
                          "image": _foundUsers[index]["image"],
                        },
                      );
                    });
*/
                  },
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                      NetworkImage(finalselectedUser[index]['image']),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(finalselectedUser[index]['name']),
                    subtitle: Text('${finalselectedUser[index]["des"]}'),
                  ),
                ),
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
