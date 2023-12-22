/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



$(document).ready(function(){
    
    /*
     * event handler when an input or textarea element is modified
     */
    $('form input,textarea').on('input',function() {
        checkField($(this));
    });
    
    
    /*
     * event handler when an user try to submit the form
     * this event calls the function validateAndSubit and if return false the submit is blocked
     */
    $("form").on('submit', function(event){
       if(!validateAndSubmit($("form"))){
            event.preventDefault();
       }
    });
    
    /*
     * function checkField
     * param : input -> the field that the user is modifing
     * for every type of input there is a function check
     * if a check-function throw an exception print the error-type
     * return a boolean for the validation
     */
    function checkField(input){
        try{
            cancelError(input);
            switch(input.attr("type")){
                case "number":
                    checkEmpty(input);
                    checkNumber(input);                    
                    break;
                case "date":
                case "file":
                    checkEmpty(input);
                    break;
                case "hidden":
                    break;
                case "submit":
                    break;
                default:
                    countChar(input); 
                    checkEmpty(input);
                    checkLength(input);
                    break;
            }
            return true;
        }
        catch(nonValidInput){
            printError(input,nonValidInput);
            return false;
        }
    }
 
    
    /*
     * function countChar(input)
     * param : input -> the field that the user is modifing
     * if doesn't exit generate a span that show in the field the remaining chars
     * and refresh it
     */
    function countChar(input){
        if(input.next().attr("class") !== "remainingchars"){
            if(input.prop("tagName") === "TEXTAREA") {
                $(input).after('<span class="remainingchars" maxLength="200"></span>');
            }
            else {
                $(input).after('<span class="remainingchars" maxLength="50"></span>');
            }
        }
        
        var countingChar = $(input.next());
        countingChar.text(input.val().length + "/" + (countingChar.attr('maxLength')));
    }
    
    /* function checkLength(input)
     * param : input -> the field that the user is modifing
     * function used for text field: if the user write a string longer than the maxLength
     * throw an error
     */
    function checkLength(input){
        if(input.val().length > input.next().attr('maxLength')){
            throw("Superato il limite di caratteri");
        }
        
    }
    
    /* function checkEmpty(input)
     * param : input -> the field that the user is modifing
     * if a field is empty throw an error
     */
    function checkEmpty(input){
        if(input.val().length === 0 ){
            throw("Il campo non può essere vuoto");
        }
    }
    
    /* function checkNumber(input)
     * param : input -> the field that the user is modifing
     * function used for number type fields
     * if a numerical value is equal o lower than 0 throw an error
     */
    function checkNumber(input){
        if($(input).val() <= 0 ){
            throw("Inserire un valore maggiore di 0");
        }
       
    }
    
    /* function printError(input, error)
     * param: input -> the field that the user is modifing
     *        error -> error-type
     * function that print error
     */
    function printError(input,error){
        //if the field isn't a text type the message error is immediately the next element
        if(input.next().attr("class") !== "clientside-error"){
            $(input).after('<p class="clientside-error">' + error + '</p>');
        } // else the field is a text type the message is next to the span that count the chars -> netx().next()
        else if(input.next().next().attr("class") !== "clientside-error"){
            $(input).next().after('<p class="clientside-error">' + error + '</p>');
        }
    }
    
    
    /* function cancelError(input)
     * param: input -> the field that the user is modifing
     * function that print error
     */
    function cancelError(input){
        //if the field isn't a text type the message error to removen is immediately the next element
        if(input.next().attr("class") === "clientside-error"){
            $(input).next().remove("p");
        } // else the field is a text type the message error to remove is next to the span that count the chars -> netx().next()
        else if(input.next().next().attr("class") === "clientside-error"){
            $(input).next().next().remove("p");
        }
    }
    
    
    /* function  validateAndSubmit(form)
     * param: form -> the form to submit
     * the function is called when a submit is tried
     * check every field in a form with the function each and checkField
     * return false if exist a field error else return true 
     */
    function validateAndSubmit(form){
        var check = true;
        form.find('input, div>input , div>textarea').each(function(){
            if(!(checkField($(this)))){
                check = false;
            }
        });   
        return check;
    }
});   

    
        

   




