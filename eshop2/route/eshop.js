/**
* Route for bank.
*/
"use strict";

const express = require("express");
const router  = express.Router();
const eshop    = require("../src/eshop.js");

router.get("/", async (req, res) => {
    let data = {
        title: "index"
    };

    res.render("eshop1/index", data);
});

router.get("/about", (req, res) => {
    let data = {
        title: "about"
    };

    res.render("eshop1/about", data);
});

router.get("/index", async (req, res) => {
    let data = {
        title: "index"
    };

    res.render("eshop1/index", data);
});

router.get("/product", async (req, res) => {
    let data= {
        title: "product"
    };

    data.res1 = await eshop.showCategorys('eshop.kaffe_mugg');
    data.res2 = await eshop.showCategorys('eshop.kaffe');
    data.res3 = await eshop.showCategorys('eshop.misc');
    res.render("eshop1/product", data);
});

router.get("/category", async (req, res) => {
    let data = {
        title: "category"
    };

    res.render("eshop1/category", data);
});

//create
router.get("/create", async (req, res) => {
    let data = {
        title: "create"
    };

    res.render("eshop1/create.ejs", data);
});

router.post("/create", async (req, res) => {
    await eshop.insertItem(req.body);
    res.redirect("index");
});

//update
router.get("/update/Coffee/:id", async (req, res) => {
    let data = {
        title: "create"
    };

    data.eshop = await eshop.getOneK(req.params.id,);
    res.render("eshop1/update.ejs", data);
});

router.get("/update/Coffee_Mugg/:id", async (req, res) => {
    let data = {
        title: "create"
    };

    data.eshop = await eshop.getOneKM(req.params.id);
    res.render("eshop1/update.ejs", data);
});


router.get("/update/Misc/:id", async (req, res) => {
    let data = {
        title: "create"
    };

    data.eshop = await eshop.getOneM(req.params.id);
    res.render("eshop1/update.ejs", data);
});

router.post("/update/Misc/:id", async (req, res) => {
    await eshop.UpdateItemM(req.body);
    res.redirect("../../index");
});

router.post("/update/Coffee_Mugg/:id", async (req, res) => {
    await eshop.UpdateItemKM(req.body);
    res.redirect("../../index");
});

router.post("/update/Coffee/:id", async (req, res) => {
    await eshop.UpdateItemK(req.body);
    res.redirect("../../index");
});

//delete
router.get("/delete/Coffee/:id", async (req, res) => {
    let data = {
        title: "delete"
    };

    data.eshop = await eshop.getOneK(req.params.id);
    res.render("eshop1/delete.ejs", data);
});

router.get("/delete/Coffee_Mugg/:id", async (req, res) => {
    let data = {
        title: "delete"
    };

    data.eshop = await eshop.getOneKM(req.params.id);
    res.render("eshop1/delete.ejs", data);
});

router.get("/delete/Misc/:id", async (req, res) => {
    let data = {
        title: "delete"
    };

    data.eshop = await eshop.getOneM(req.params.id);
    res.render("eshop1/delete.ejs", data);
});

router.post("/delete/Misc/:id", async (req, res) => {
    await eshop.deleteItemM(req.body);
    res.redirect("../../index");
});

router.post("/delete/Coffee_Mugg/:id", async (req, res) => {
    await eshop.deleteItemKM(req.body);
    res.redirect("../../index");
});

router.post("/delete/Coffee/:id", async (req, res) => {
    await eshop.deleteItemK(req.body);
    res.redirect("../../index");
});

router.get("/customer", async (req, res) => {
    let data= {
        title: "Costumer"
    };
    let jason = JSON.stringify(await eshop.orderHistory());


    data.res = await eshop.costumer_list();
    data.res1 = jason;
    res.render("eshop1/customer", data);
});

router.get("/Order/:id", async (req, res) => {
    let data= {
        title: "Costumer"
    };
    let Lst = await eshop.orderHistory();
    console.log(Lst);
    let result = [];

    for (let i = 0; i < Lst.length; i++) {
        if (Lst[i].id_kund == req.params.id) {
            result.push(Lst[i]);
        }
    }
    console.log(result);
    data.res = result;
    res.render("eshop1/order", data);
});

router.get("/customer/Order/:id", async (req, res) => {
    let data= {
        title: "Costumer"
    };
    
    data.res1 = await eshop.showCategorys('eshop.kaffe_mugg');
    data.res2 = await eshop.showCategorys('eshop.kaffe');
    data.res3 = await eshop.showCategorys('eshop.misc');
    data.res = await eshop.costumer_list();
    res.render("eshop1/C_or_id", data);
});
router.post("/customer/Order/:id", async (req, res) => {
    let table = eshop.makeTable(req.body);

    await eshop.insertOrder(table, req.params.id);
    res.redirect("../../index");
});
module.exports = router;
