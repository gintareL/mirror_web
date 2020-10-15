
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


function ZeitAnzeigen () {
    var Jetzt = new Date();
    var Stunden = Jetzt.getHours();
    var Minuten = Jetzt.getMinutes();
    var Sekunden = Jetzt.getSeconds();
    var Vorstd = ((Stunden < 10) ? "0" : "");
    var Vormin = ((Minuten < 10) ? ":0" : ":");
    var Vorsek = ((Sekunden < 10) ? ":0" : ":");

    var Uhrzeit = Vorstd + Stunden + Vormin + Minuten + Vorsek + Sekunden;
    document.all.Uhr.innerHTML =  Uhrzeit ;
    window.setTimeout("ZeitAnzeigen()", 1000);
}




