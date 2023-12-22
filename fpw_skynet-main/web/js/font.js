/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var textExtraLarge = "2vh";
var textLarge = "1.8vh";
var textNormal = "1.5vh";



$(document).ready(function(){
    
    $("html").css("font-size", textNormal);
    
    $("#modify-fontsize-normal").on('click', function(){
        //console.log($("body").css("font-size")+0.1);
        $("html").css("font-size", textNormal);;
        
    });
    
    $("#modify-fontsize-higher").on('click', function(){
        //console.log($("body").css("font-size")+0.1);
        $("html").css("font-size", textLarge);
        
    });
    
    $("#modify-fontsize-extrahigher").on('click', function(){
        //console.log($("body").css("font-size")-0.1);
        $("html").css("font-size", textExtraLarge);
    });
});