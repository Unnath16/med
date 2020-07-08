function validateForm1(){
var z = document.forms["registerform"]["Pass1"].value;
var z1 = document.forms["registerform"]["Pass2"].value;

if(z!==z1)
{
   alert("Passwords Does Not Match");
   return false
   
}
}

function myFunction(x) {
    var y = x.rowIndex;
        location.replace("Medicines.jsp?val="+y);
}    


function cart(x) {
    var y = x.rowIndex;
    
        location.reload("cart.jsp?val1="+y);
}    













function send1(){
var id = document.getElementById("signupDD");
var op = id.options[id.selectedIndex].text;    
        
location.replace("Login.jsp?va="+op);
}


