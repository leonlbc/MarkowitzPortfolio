import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';

const tablePortfolios = SqfEntityTable(
    tableName: 'portfolios',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    modelName: 'portfolio',
    fields: [
      SqfEntityField('name', DbType.text),
    ]
);

const tableStocks = SqfEntityTable(
    tableName: 'stocks',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    modelName: 'stock',
    fields: [
      SqfEntityField('ticker', DbType.text),
      SqfEntityField('name', DbType.text),
      SqfEntityField('price', DbType.real),
      SqfEntityField('variation', DbType.real),
      SqfEntityFieldRelationship(
          parentTable: tablePortfolios,
          deleteRule: DeleteRule.CASCADE),
    ]
);

@SqfEntityBuilder(dbModel)
const dbModel = SqfEntityModel(
    databaseName: 'main.db',
    databaseTables: [tableStocks, tablePortfolios],
    bundledDatabasePath: null
);
