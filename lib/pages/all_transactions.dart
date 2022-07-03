import 'package:bank_app/models/trans.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:bank_app/providers/trans_provider.dart';
import 'package:bank_app/widget/textfield.dart';
import 'package:bank_app/widget/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  var searchController = TextEditingController();
  bool switchFilter = true;
  late Future<List<Trans>> filterList;
  late Future<List<Trans>> filterList1;
  int type = 0;
  @override
  Widget build(BuildContext context) {
    Future<List<Trans>> search(String query) {
      setState(() {
        // this.query = query.toLowerCase();
        filterList = context.read<TransProvider>().searchAmount(query);
      });
      print("searchFunction");
      return filterList;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      resizeToAvoidBottomInset: false,
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "All Transactions",
                style: TextStyle(fontSize: 25),
              ),
            ),
            IconButton(
                onPressed: () async {
                  await showPopupMenu();
                },
                icon: Icon(
                  Icons.filter_alt,
                  color: Colors.blueAccent,
                ))
          ],
        ),
        TextField(
          controller: searchController,
          onChanged: search,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search by Amount',
            prefixIcon: Icon(Icons.search),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.5),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.5),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
            ),
          ),
        ),
        Expanded(
            child: switchFilter
                ? FutureBuilder(
                    future: searchController.text.isEmpty
                        ? context.read<TransProvider>().getTransProviders()
                        : context
                            .read<TransProvider>()
                            .searchAmount(searchController.text),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("No Transactions",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ))
                                      ]),
                                )
                              ]),
                        );
                      } else {
                        List<Trans> profileTrans = searchController.text.isEmpty
                            ? Provider.of<TransProvider>(context, listen: true)
                                .trans
                            : Provider.of<TransProvider>(context, listen: true)
                                .filteredList;
                        return ListView.builder(
                            itemCount: profileTrans.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TransTile(
                                  transaction: profileTrans[index]);
                            });
                      }
                    }))
                : FutureBuilder(
                    future: context.read<TransProvider>().filteredAmount(type),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Container(
                          height: 150,
                          child: Card(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("No Transactions",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ))
                                        ]),
                                  )
                                ]),
                          ),
                        );
                      } else {
                        List<Trans> profileTrans =
                            Provider.of<TransProvider>(context, listen: true)
                                .filteredList1;
                        return ListView.builder(
                            itemCount: profileTrans.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TransTile(
                                  transaction: profileTrans[index]);
                            });
                      }
                    })))
      ]),
    );
  }

  showPopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 110.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            value: '1',
            child: const Text('All'),
            onTap: () {
              setState(() {
                // this.query = query.toLowerCase();
                type = 0;
                switchFilter = true;
              });
            }),
        PopupMenuItem<String>(
            value: '1',
            child: const Text("Deposits"),
            onTap: () {
              setState(() {
                // this.query = query.toLowerCase();
                type = 1;
                filterList1 =
                    context.read<TransProvider>().filteredAmount(type);
                switchFilter = false;
                print("testing deposit");
              });
            }),
        PopupMenuItem<String>(
          value: '2',
          child: const Text('Withdraws'),
          onTap: () {
            setState(() {
              // this.query = query.toLowerCase();
              type = 2;
              filterList1 = context.read<TransProvider>().filteredAmount(type);
              switchFilter = false;
              print("testing withdraw");
            });
          },
        ),
        PopupMenuItem<String>(
          value: '3',
          child: const Text('Transfers'),
          onTap: () {
            setState(() {
              // this.query = query.toLowerCase();
              type = 3;
              filterList1 = context.read<TransProvider>().filteredAmount(type);
              switchFilter = false;
              print("testing transfer");
            });
          },
        ),
      ],
      elevation: 8.0,
    );
  }
}
