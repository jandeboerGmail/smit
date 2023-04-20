// Java script

// Set the color based on the current hour
function setTextcolor() {
    // Get the current hour
    var currentHour = new Date().getHours();
    if (currentHour >= 6 && currentHour < 12) {
        document.getElementById("id").style.color = "orange";
    } else if (currentHour >= 12 && currentHour < 18) {
        document.getElementById("id").style.color = "green";
    } else {
        document.getElementById("id").style.color = "red";
    }
}
function changeColor() {
    document.getElementById("id1").style.color = "red";
}

function javaScriptTest () {

}

const x = function (a, b) {return a * b};

document.getElementById("demo").innerHTML = x(4, 3);
setTextcolor()
