/**
* A module exporting functions to access the bank database.
*/
"use strict";

module.exports = {
    showCategorys: showCategorys,
    insertItem: insertItem,
    getOneK: getOneK,
    getOneKM: getOneKM,
    getOneM: getOneM,
    UpdateItemK: UpdateItemK,
    UpdateItemKM: UpdateItemKM,
    UpdateItemM: UpdateItemM,
    deleteItemK: deleteItemK,
    deleteItemKM: deleteItemKM,
    deleteItemM: deleteItemM,
    TheLogg: TheLogg,
    avalibleShelfs: avalibleShelfs,
    addInv: addInv,
    delInv: delInv,
    costumer_list: costumer_list,
    makeTable: makeTable,
    insertOrder: insertOrder,
    orderHistory: orderHistory,
};

const mysql  = require("promise-mysql");
const config = require("../config/db/eshop.json");
let db;



/**
* Main function.
* @async
* @returns void
*/
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();


/**
* Show the log.
*
* @async
* @param {int} number a valid integer.
*
* @returns {RowDataPacket} Resultset from the query.
*/
async function TheLogg(number) {
    let sql = 'CALL `eshop`.`show_log`(?)';
    let res = await db.query(sql, [parseInt(number)]);

    return res;
}

async function avalibleShelfs(row) {
    let sql;
    let res;

    if (row == 1) {
        sql = 'CALL show_storage_1;';
        res = await db.query(sql);
    } else if (row == 2) {
        sql = 'CALL show_storage_2;';
        res = await db.query(sql, [row]);
    } else {
        sql = 'CALL serch_sorage(?);';
        res = await db.query(sql, [row]);
    }
    return res;
}
/**
* Show all categorys.
*
* @async
* @returns {RowDataPacket} Resultset from the query.
*/
async function showCategorys(table) {
    return findAllInTable(table);
}

async function addInv(id, chelf, amount) {
    let sql = 'CALL addInv(?, ?, ?);';

    await db.query(sql, [id, chelf, amount]);
}

async function delInv(id, chelf, amount) {
    let sql = 'CALL delInv(?, ?, ?);';

    await db.query(sql, [id, chelf, amount]);
}

/**
* Show all entries in the selected table.
*
* @async
* @param {string} table A valid table name.
*
* @returns {RowDataPacket} Resultset from the query.
*/
async function findAllInTable(table) {
    let sql = 'CALL SELECT_ALL(?)';
    let res;

    res = await db.query(sql, [table]);
    console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);

    return res[0];
}

/**
 * 
 * @param {list} data 
 * @returns 
 */
async function insertItem(data) {
    let sql = 'CALL `eshop`.`insertInto`(?, ?, ?, ?, ?, ?)';
    let res = await db.query(
        sql, [data.f_produkt_kategori,
            data.f_produktKod, data.f_pris, data.f_namn,
            data.f_kort_beskrivning, data.f_antal]);

    return res;
}

async function getOneK(id) {
    let sql = "CALL SELECT_ALL_where('kaffe', ?);";
    let res = await db.query(sql, [parseInt(id)]);

    return res[0];
}

async function getOneKM(id) {
    let sql = "CALL SELECT_ALL_where('kaffe_mugg', ?);";
    let res = await db.query(sql, [parseInt(id)]);

    return res[0];
}

async function getOneM(id) {
    let sql = "CALL SELECT_ALL_where('misc', ?);";
    let res = await db.query(sql, [parseInt(id)]);

    console.table(res[0]);
    return res[0];
}

async function UpdateItemK(data) {
    let sql = "CALL uppdate_objekt(?, ?, ?, ?, ?, ?);";
    let res = await db.query(
        sql, ['kaffe', parseInt(data.f_pris), data.f_namn, data.f_kort_beskrivning,
            parseInt(data.f_antal),
            parseInt(data.f_produktKod)]
    );

    return res;
}

async function UpdateItemKM(data) {
    let sql = "CALL uppdate_objekt(?, ?, ?, ?, ?, ?);";
    let res = await db.query(
        sql, ['kaffe_mugg', parseInt(data.f_pris), data.f_namn, data.f_kort_beskrivning,
            parseInt(data.f_antal),
            parseInt(data.f_produktKod)]
    );

    return res;
}

async function UpdateItemM(data) {
    let sql = "CALL uppdate_objekt(?, ?, ?, ?, ?, ?);";
    let res = await db.query(
        sql, ['misc', parseInt(data.f_pris), data.f_namn, data.f_kort_beskrivning,
            parseInt(data.f_antal),
            parseInt(data.f_produktKod)]
    );

    return res;
}

async function deleteItemK(id) {
    let sql = "CALL delete_object('kaffe', ?);";
    let res = await db.query(sql, [id.f_produktKod]);

    return res;
}

async function deleteItemKM(id) {
    let sql = "CALL delete_object('kaffe_mugg', ?);";
    let res = await db.query(sql, [id.f_produktKod]);

    return res;
}

async function deleteItemM(id) {
    let sql = "CALL delete_object('misc', ?);";
    let res = await db.query(sql, [id.f_produktKod]);

    return res;
}

/**
 * Show all orders.
 * @returns {RowDataPacket} Resultset from the query.
 * @async
 * 
 */
async function costumer_list() {
    let sql = "CALL costumer_list();";
    let res = await db.query(sql);

    return res[0];
}
/**
 * Show all orders.
 * @async
 * @param {string} data
 * @returns {RowDataPacket} Resultset from the query.
 */
function makeTable(data) {
    const list = JSON.parse(data.data).data;
    return list;
}

/** 
 * Inserts a new order into the database.
 * @param {list} data
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 * 
*/
async function insertOrder(data, kund_id) {
    for (let i = 0; i < data.length; i++) {
        let sql = "CALL insert_order(?, ?, ?, ?);";
        let sql2 = "CALL update_table_amount(?, ?)";
        await db.query(
            sql, [kund_id, data[i].id, data[i].namn, data[i].quantity]
        );
        await db.query(sql2, [parseInt(data[i].id), data[i].antal]);
    }
}

async function orderHistory() {
    let sql = "CALL order_history()";
    let res = await db.query(sql);

    return res[0];
}
