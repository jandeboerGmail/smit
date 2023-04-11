// Get the current hour
var currentHour = new Date().getHours();

// Set the color based on the current hour
if (currentHour >= 6 && currentHour < 12) {
    document.getElementById("time-text").style.color = "orange";
} else if (currentHour >= 12 && currentHour < 18) {
    document.getElementById("time-text").style.color = "green";
} else {
    document.getElementById("time-text").style.color = "red";
}
