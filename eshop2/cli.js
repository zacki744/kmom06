/**
 * bank menue prompt
 * @author Zackarias
 */

const readline = require('readline');
const hp = require("./src/eshop");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function exitProgram(code) {
    code = code || 0;
    console.info("Exit with status: " + code);
    process.exit(code);
}
let showMenu = `

Välj något av alternativen:

exit, quit              Exit program
menu, help              Visa denna meny

about                   
log <number>            visa senaste händelserna
product                 visar alla producter som finns  

shelf                   visar vilka lagerhyllor som finns på lagret
inv 
inv <str>

invadd <productid> <shelf> <number>
invdel <productid> <shelf> <number>
`;

/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    console.log(showMenu);
    rl.setPrompt("Enter somthing: ");
    rl.prompt();

    rl.on("close", exitProgram);
    rl.on("line", async (input) => {
        input.trim();
        let part = input.split(" ");
        let res;
        let data = {};

        switch (part[0]) {
            case "exit":
            case "quit":
            case "q":
                exitProgram();
                break;
            case "menu":
            case "help":
                console.log(showMenu);
                break;
            case "about":
                console.log("zackarias Sjöström");
                break;
            case "log":
                if (part.length > 1) {
                    res = await hp.TheLogg(part[1]);
                } else {
                    res = await hp.TheLogg(10);
                }
                console.table(res[0]);
                break;
            case "product":
                data[0] = await hp.showCategorys('kaffe');
                data[1] = await hp.showCategorys('kaffe_mugg');
                data[2] = await hp.showCategorys('misc');
                console.log("kaffe\n");
                console.table(data[0]);
                console.log("kaffe muggar\n");
                console.table(data[1]);
                console.log("andra produkter\n");
                console.table(data[2]);
                break;
            case "shelf":
                res = await hp.avalibleShelfs(2);
                console.table(res[0]);
                break;
            case "inv":
                if (part.length == 1) {
                    res = await hp.avalibleShelfs(1);
                    console.table(res[0]);
                } else {
                    res = await hp.avalibleShelfs(part[1]);
                    console.table(res[0]);
                }
                break;
            case "invadd":
                if (part.length != 4) {
                    break;
                }
                await hp.addInv(part[1], part[2], part[3]);
                break;
            case "invdel":
                if (part.length != 4) {
                    break;
                }
                await hp.delInv(part[1], part[2], part[3]);
                break;
        }
        rl.prompt();
    });
})();
