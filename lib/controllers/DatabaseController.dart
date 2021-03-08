import 'package:witz/models/model.dart';

class DatabaseController {

  saveToDb(String pName, List stockList) async {
    await Portfolio.withFields(pName).save().then((newPortfolioId) {
      print("Saved Portfolio $pName");
      stockList.forEach((stock) async {
        stock.portfoliosId = newPortfolioId;
        await stock.save().then((stockId) async {
          print("Saved ${stock.ticker} to $pName");
        });
      });
    });
  }

  sample() async {
    final stockList = await Stock().select().toList();
    if (stockList == null || stockList == []) {
      var stockOne = Stock.withFields("ITSA4", "Itaú SA", 2.2, 2.2, null);
      var stockTwo = Stock.withFields("Outra", "Nome_Outra", 2.2, 2.2, null);
      saveToDb("Example Portfolio", [stockOne, stockTwo]);
    }
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