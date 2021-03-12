import 'package:witz/models/model.dart';

class DatabaseController {

  var portfolioId;

  saveToDb(String pName, List stockList) async {
    await Portfolio.withFields(pName).save().then((newPortfolioId) {
      print("Saved Portfolio $pName");
      stockList.forEach((stock) async {
        portfolioId = newPortfolioId;
        stock.portfoliosId = newPortfolioId;
        await stock.save().then((stockId) async {
          print("Saved ${stock.ticker} to $pName");
        });
      });
    });
    return portfolioId;
  }

  deleteAll(object) async {
    await object.select().delete();
    print("${object.toString()} deleted");
  }

  sample() async {
    await deleteAll(Portfolio());
    await deleteAll(Stock());

    await Stock().select().toList().then((stockList) {
      if (stockList.length == 0 || stockList == null) {
        var stockOne = Stock.withFields("ITSA4", "Itaú SA", 2.2, 2.2, 1);
        var stockTwo = Stock.withFields("PETR4", "Petrobrás", 2.2, 2.2, 1);
        print("salvando portfolio de exemplo");
        saveToDb("Example Portfolio", [stockOne, stockTwo]);
      }
    });
  }

  getAllPortfolios() async* {
    var portfolios = await Portfolio().select().toList();
    yield portfolios;
  }

  getStocksFromPortfolio(id) async* {
    if (id != null) {
      var stocks = await Stock().select().portfoliosId.equals(id).toList();
      yield stocks;
    }
  }

  findPortfolio(id) async {
    var portfolio = await Portfolio().getById(id);
    return portfolio;
  }

}