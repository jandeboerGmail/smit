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
    document.getElementById("id4").style.color = "red";
}

// document.getElementById("demo").innerHTML = x(4, 3);
// setTextcolor()

const table = document.getElementById("myTable");

const now = new Date();
const currentHour = now.getHours();

if (currentHour >= 6 && currentHour < 18) {
  table.classList.add("table-day");
} else {
  table.classList.add("table-night");
}
