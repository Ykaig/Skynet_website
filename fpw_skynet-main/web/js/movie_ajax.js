/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var offset = 0;

$('#prevMovie').click(function(){
    if(offset > 0)
        offset--;
    $.ajax({
        url:"movies",
        data:{
            offsetId: offset
        },
        dataType: "json",
        success: function(data, state) {
            aggiornaMovie(data);
        },
        error: function(data, state){}
    });
});


$('#nextMovie').click(function(){
    offset++;
    $.ajax({
        url:"movies",
        data: {
            offsetId: offset
        },
        dataType: "json",
        success: function(data, state) {
            if(data.user_id === ""){ 
                offset--;
            }else
                aggiornaMovie(data);
        },
        error: function(data, state){}
    });
});

function aggiornaMovie(movie){
    $(".film-thumbnail").attr("src", movie.photo);
    $(".film-thumbnail").attr("alt",movie.title+" thumbnail");
    $(".film-titolo").text(movie.title);
    $(".film-desc").text(movie.description);
    $(".film-dataUscita").text("Data di uscita: "+movie.releaseDate+"📅");
    $(".film-durata").text("Durata:"+movie.runningTime+"min🕒");
    $(".film-prezzo").text("Punteggio: "+movie.score+"⭐");
    $(".film-user").text("Aggiunto da utente:" +movie.user_id+"👤");
    $(".film-submit").text("Prenota a "+movie.price+"€");    
}