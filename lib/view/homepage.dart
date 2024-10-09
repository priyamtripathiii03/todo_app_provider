import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_provider/Modals/modal.dart';
import 'package:todo_app_provider/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        title: const Text(
          "Todo App",
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: ListView.builder(
        itemCount: quoteProvidertrue.dataFinalList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            // leading: Text(index.toString()),
            title: Text(quoteProvidertrue.dataFinalList[index].description!),
            subtitle: Text(
              quoteProvidertrue.dataFinalList[index].name!,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    quoteProviderfalse.removeData(index);
                  },
                  icon: const Icon(Icons.edit),
                ),IconButton(
                  onPressed: () {
                    quoteProviderfalse.removeData(index);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController txtDescription = TextEditingController();
          TextEditingController txtName = TextEditingController();
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
                        controller: txtDescription,
                        decoration: const InputDecoration(label: Text('Description'),),
                      ),
                      TextField(
                        controller: txtName,
                        decoration:
                            const InputDecoration(label: Text('Name'),),
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
                    child: const Text('Delete'),
                ),
                TextButton(
                  onPressed: () {
                    ControllerModal model = ControllerModal(
                      description: txtDescription.text,
                      name: txtName.text,
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