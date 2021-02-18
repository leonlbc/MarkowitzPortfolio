/*
(
FutureBuilder<Map>(
              future: getData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Center(
                      child: Text("Carregando dados...",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0
                          ),
                          textAlign: TextAlign.center),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Erro ao carregar dados!",
                            style: TextStyle(color: Colors.white,
                                fontSize: 25.0),
                            textAlign: TextAlign.center),
                      );
                    } else {
                      ticker = snapshot.data["results"]["$_search"]["symbol"];
                      name = snapshot.data["results"]["$_search"]["company_name"];
                      price = snapshot.data["results"]["$_search"]["price"];
                      variation =
                      snapshot.data["results"]["$_search"]["change_percent"];
                      price = price.toString();
                      variation = variation.toString();
                      return GestureDetector(
                          child: Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                              color: Colors.purple[900],
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Text(ticker, style: TextStyle(
                                              fontSize: 25.0),),
                                          Text(price, style: TextStyle(
                                              fontSize: 25.0))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Text(name, style: TextStyle(
                                              fontSize: 20.0)),
                                          Text("$variation%",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.red[900]))
                                        ],
                                      ),
                                    ],
                                  )
                              )
                          )
                          ),
                        onTap: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => StockPage()));
                        }
                      );
                    }
                }
              })
              )


              (
 */



/* Talvez seja necessário pegar uma função pra puxar os dados da API e adicioná-los
na base de dados e em seguida usar um futurebuilder para a base de dados e não para os dados que vem da api
 */



/*
return GestureDetector(
                        child: Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                                color: Colors.purple[900],
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: <Widget>[
                                            Text(ticker, style: TextStyle(
                                                fontSize: 25.0),),
                                            Text(price, style: TextStyle(
                                                fontSize: 25.0))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: <Widget>[
                                            Text(name, style: TextStyle(
                                                fontSize: 20.0)),
                                            Text("$variation%",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.red[900]))
                                          ],
                                        ),
                                      ],
                                    )
                                )
                            )
                        ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => StockPage()));
                        }
                    );
 */



/*
Database dbStock = await db;
List <Map> maps = await dbStock.query(stocksTable,
      columns: [tickerColumn, nameColumn, priceColumn, variationColumn],
      where: "$tickerColumn = ?",
      whereArgs: [tickerColumn]);
    if(maps.length>0){
      return Stock.fromMap(maps.first);
    } else {
      return null;
    }*/



