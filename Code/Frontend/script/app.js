const lanIP = `${window.location.hostname}:5000`;
const socket = io(`http://${lanIP}`);

//#region ***  DOM references                           ***********
let htmlDrank,
htmltemperatuur,
htmlhistoriek
//#endregion
//#region ***  Callback-Visualisation - show___         ***********
const showDranken = function (jsonObject) {
    console.log(jsonObject)
    let htmlstring_drank = "";
    for (const drank of jsonObject.dranken){
        htmlstring_drank += `<div id="drinks_sprite" class="info__box__drinks">${drank.naam} </div>`;
    }
    htmlDrank.innerHTML = htmlstring_drank;
    listenToClickDranken();
};
const showTemperature = function (jsonObject) {
    console.log(jsonObject)
    let htmlstring_temperature = "";
    for (const temperature of jsonObject.temperatures){
        htmlstring_temperature += `<div id="temp_outside" class="info__box__temp">${temperature.waarde}</div>`;
    }
    htmltemperatuur.innerHTML = htmlstring_temperature;
    listenToClickTemperatuur();
};
const showHistoriek = function (jsonObject) {
    console.log(jsonObject)
    let htmlstring_historiek = "";
    for (const verbruik of jsonObject.verbruiken){
        htmlstring_historiek += `<div class="title"> ${verbruik.DrankID}</div>
        <div class="datum"> ${verbruik.datum} </div>
        <div class="aantal_dranken"> Je nam ${verbruik.verbruikID} drankjes </div>`;
    }
    htmlhistoriek.innerHTML = htmlstring_historiek;
    listenToClickDranken();
};
//#endregion

//#region ***  Callback-No Visualisation - callback___  ***********
//#endregion
//#region ***  Data Access - get___                     ***********
const getDranken = function(){
    handleData("http://127.0.0.1:5000/api/v1/dranken", showDranken);
};
const getTemperature = function(){
    handleData("http://127.0.0.1:5000/api/v1/temperatuur", showTemperature);
};
const getHistoriek = function(){
    handleData("http://127.0.0.1:5000/api/v1/verbruik", showHistoriek);
};
//#endregion
//#region ***  Event Listeners - listenTo___            ***********
//#endregion
//#region ***  Init / DOMContentLoaded                  ***********
const init = function () {
    htmlDrank = document.querySelector(".info__box");
    htmltemperatuur = document.querySelector(".info__box");
    htmlhistoriek = document.querySelector(".info__box");

    if (htmlDrank) {
        getDranken();
        getTemperature();
        getHistoriek();
    };
};
//#endregion
document.addEventListener("DOMContentLoaded", init);
//#endregion