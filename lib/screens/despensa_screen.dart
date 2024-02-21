import 'package:flutter/material.dart';
import 'package:pmsn2024/database/products_database.dart';
import 'package:pmsn2024/model/products_model.dart';

class DespensaScreen extends StatefulWidget {
  const DespensaScreen({super.key});

  @override
  State<DespensaScreen> createState() => _DespensaScreenState();
}

class _DespensaScreenState extends State<DespensaScreen> {

  ProductsDatabase? productsDB;

  @override
  void initState() {
    super.initState();
    productsDB = new ProductsDatabase();
  }

  @override
  Widget build(BuildContext context) {

    final conNombre = TextEditingController();
    final conCantidad = TextEditingController();

    final txtNombre = TextFormField(
      keyboardType: TextInputType.text,
      controller: conNombre,
    );

    final txtCantidad = TextFormField(
      keyboardType: TextInputType.number,
      controller: conCantidad,
    );

    final space = SizedBox(height: 10,);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi despensa :)'),
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(
              context: context, 
              builder: (context) {
                return ListView(
                  children: [

                  ],
                );
              },
            );
          }, 
          icon: Icon(Icons.shop_sharp))
        ],
      ),
      body: FutureBuilder(
        future: productsDB!.CONSULTAR(),
        builder: (context, AsyncSnapshot<List<ProductosModel>> snapshot) {
          if( snapshot.hasError ){
            return Center(child: Text('Algo salio mal :('),);
          }else{
            if(snapshot.hasData){
              return Center(child: Text('No hay datos'),);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}