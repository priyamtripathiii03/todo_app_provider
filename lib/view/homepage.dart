import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_provider/Modals/modal.dart';
import 'package:todo_app_provider/provider/home_provider.dart';

class QuoteHomePage extends StatelessWidget {
  const QuoteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteProvider quoteProvidertrue =
        Provider.of<QuoteProvider>(context, listen: true);
    QuoteProvider quoteProviderfalse =
        Provider.of<QuoteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Todo App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: ListView.builder(
        itemCount: quoteProvidertrue.QuotefinalList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            // leading: Text(index.toString()),
            title: Text(quoteProvidertrue.QuotefinalList[index].quote!),
            subtitle: Text(
              quoteProvidertrue.QuotefinalList[index].author!,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              onPressed: () {
                quoteProviderfalse.removeData(index);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController txtQuotes = TextEditingController();
          TextEditingController txtAuthor = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Details'),
              content: Container(
                height: 120,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: txtQuotes,
                        decoration: const InputDecoration(label: Text('Description')),
                      ),
                      TextField(
                        controller: txtAuthor,
                        decoration:
                            const InputDecoration(label: Text('Name')),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Delete')),
                TextButton(
                  onPressed: () {
                    controllerModal model = controllerModal(
                      quote: txtQuotes.text,
                      author: txtAuthor.text,
                    );
                    quoteProviderfalse.addData(model);
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
