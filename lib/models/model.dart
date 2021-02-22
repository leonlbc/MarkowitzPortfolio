import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';

const tableStocks = SqfEntityTable(
    tableName: 'stocks',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    modelName: 'stock',
    fields: [
      SqfEntityField('ticker', DbType.text),
      SqfEntityField('name', DbType.text),
      SqfEntityField('price', DbType.real),
      SqfEntityField('variation', DbType.real)
    ]
);

const tablePortfolios = SqfEntityTable(
    tableName: 'portfolios',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    modelName: 'portfolio',
    fields: [
      SqfEntityField('name', DbType.text),
    ]
);

const tablePortfolioStocks = SqfEntityTable(
    tableName: 'portfolio_stock',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    modelName: null,
    fields: [
      SqfEntityField('portfolioId', DbType.integer),
      SqfEntityField('stockId', DbType.integer),
    ]
);

@SqfEntityBuilder(dbModel)
const dbModel = SqfEntityModel(
    databaseName: 'main.db',
    databaseTables: [tableStocks, tablePortfolios, tablePortfolioStocks],
    bundledDatabasePath: null
);
