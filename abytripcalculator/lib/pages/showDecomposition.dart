import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const ShowDecomposition());
}

class ShowDecomposition extends StatefulWidget {
  const ShowDecomposition({super.key});

  @override
  State<ShowDecomposition> createState() => _ShowDecompositionState();
}

class _ShowDecompositionState extends State<ShowDecomposition> {
  @override
  Widget build(BuildContext context) {
    final dynamic map = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title:  Text(
            'Décompositon du calcul',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange[400],
          elevation: 0,

          iconTheme: const IconThemeData(
            color: Colors.white, // Change the color here
          ),

        ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
              scrollDirection: Axis.horizontal,
            children :[ SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,
                ),
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Tranche Km')),
                    DataColumn(label: Text('Frais €')),
                    DataColumn(label: Text('Result €')),
                  ],
                  rows: List<DataRow>.generate(
                    map.length,
                        (index) => DataRow(
                      cells: [
                        DataCell(Text(map[index]['Tranche'])),
                        DataCell(Text(map[index]['Frais'])),
                        DataCell(Text(map[index]['Result'].toString())),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ]
          );
        },
      ),
    );

  }
}
