import 'package:flutter/material.dart';
import 'package:ekra/features/shop/screens/home/homesc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFE7E6E1), Color(0xFFFAFAFA)],
        ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Search bar
              Container(
               color: const Color(0xFFE7E6E1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color.fromARGB(255, 110, 110, 110),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          autofillHints: const ["Search"],
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          onEditingComplete: () {
                            HomeeScreen.PreviousSearchs.add(searchController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeeScreen()),
                            );
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search, color: Colors.grey,),
                            filled: true,
                            fillColor: Colors.white,
                             enabledBorder: OutlineInputBorder(
                             borderSide: const BorderSide(color: Colors.grey), // Set the border color to grey
                             borderRadius: BorderRadius.circular(30), // Adjust the border radius as needed
                           ),
                            // Adjust the border radius as needed
                   // Adjust the border radius as needed
                           focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(color: Colors.grey), // Set the border color to grey
                            borderRadius: BorderRadius.circular(30), // Adjust the border radius as needed
                         ),

                            suffixIcon: searchController.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: const Icon(Icons.cancel),
                                    onPressed: () {
                                      searchController.clear();
                                    },
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Previous Searches
              Container(
                color: const Color(0xFFE7E6E1),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: HomeeScreen.PreviousSearchs.length,
                  itemBuilder: (context, index) => PreviousSearchsItem(index, context),
                ),
              ),

              // Search Suggestions
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Search Suggestions",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        searchSuggestionsTime("Truck", context, const Color(0xffFEBD59)),
                        searchSuggestionsTime("Grader", context, const Color(0xffFEBD59)),
                        searchSuggestionsTime("Loaders", context, const Color(0xffFEBD59)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        searchSuggestionsTime("Excavators", context, const Color(0xffFEBD59)),
                        searchSuggestionsTime("Backhoe Loaders", context, const Color(0xffFEBD59)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PreviousSearchsItem(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (DismissDirection dir) {
            HomeeScreen.PreviousSearchs.removeAt(index);
          },
          child: Row(
            children: [
              const Icon(
                Icons.time_to_leave,
                color: Colors.grey,
              ),
              const SizedBox(width: 10),
              Text(
                HomeeScreen.PreviousSearchs[index],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),
              ),
              const Spacer(),
              const Icon(
                Icons.call_made_outlined,
                color: Color.fromARGB(255, 1, 9, 86),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchSuggestionsTime(String text, BuildContext context, Color form) {
    return GestureDetector(
    onTap: () {
      // Handle tap event here, e.g., navigate to a new screen or perform an action
    },
    child: Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: form,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.black),
      ),
     ),
    );
  }
}
