
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


var Wochentagname = new Array("Sonntag", "Montag", "Dienstag", "Mittwoch","Donnerstag", "Freitag", "Samstag");
function ZeitAnzeigen () {
    var Jetzt = new Date();
    var Tag = Jetzt.getDate();
    var Monat = Jetzt.getMonth() + 1;
    var Jahr = Jetzt.getFullYear();
    var Stunden = Jetzt.getHours();
    var Minuten = Jetzt.getMinutes();
    var Sekunden = Jetzt.getSeconds();
    var WoTag = Jetzt.getDay();
    var Vortag = ((Tag < 10) ? "0" : "");
    var Vormon = ((Monat < 10) ? ".0" : ".");
    var Vorstd = ((Stunden < 10) ? "0" : "");
    var Vormin = ((Minuten < 10) ? ":0" : ":");
    var Vorsek = ((Sekunden < 10) ? ":0" : ":");
    var Datum = Vortag + Tag + Vormon + Monat + "." + Jahr;
    var Uhrzeit = Vorstd + Stunden + Vormin + Minuten + Vorsek + Sekunden;
    document.all.Uhr.innerHTML =  Wochentagname[WoTag] + "<br>" + Datum + "<br>" + Uhrzeit ;
    window.setTimeout("ZeitAnzeigen()", 1000);
}




