function validateForm1(){
var z = document.forms["registerform"]["Pass1"].value;
var z1 = document.forms["registerform"]["Pass2"].value;

if(z!==z1)
{
   alert("Passwords Does Not Match");
   return false;
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
		function addRow(tableID) {

			var table = document.getElementById(tableID);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var cell1 = row.insertCell(0);
			var element1 = document.createElement("input");
			element1.type = "checkbox";
			element1.name="chkbox[]";
			cell1.appendChild(element1);

			var cell2 = row.insertCell(1);
			cell2.innerHTML = rowCount ;

			var cell3 = row.insertCell(2);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.name = "txtbox[]";
			cell3.appendChild(element2);
			
			var cell4 = row.insertCell(3);
			var element3 = document.createElement("input");
			element3.type = "NUMBER";
			element3.name = "txtbox[]";
			cell4.appendChild(element3);
			
			var cell5 = row.insertCell(4);
			var element4 = document.createElement("input");
			element4.type = "number";
			element4.name = "txtbox[]";
			cell5.appendChild(element4);




		}

		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if(null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
				}


			}
			}catch(e) {
				alert(e);
			}
		}













function send1(){
var id = document.getElementById("signupDD");
var op = id.options[id.selectedIndex].text;    
        
location.replace("Login.jsp?va="+op);
}


