
console.log("Welcome to the Community Portal");

window.onload = () => {
    alert("Page Fully Loaded");
};
const eventName = "Music Festival";
const eventDate = "2026-07-15";
let seats = 50;
console.log(`Event: ${eventName} | Date: ${eventDate} | Seats: ${seats}`);
function reserveSeat() {
    seats--;
    console.log("Remaining Seats:", seats);
}
class Event {
    constructor(name, category, seats) {
        this.name = name;
        this.category = category;
        this.seats = seats;
    }
}
Event.prototype.checkAvailability = function () {
    return this.seats > 0;
};
let events = [
    new Event("Music Night", "Music", 20),
    new Event("Baking Workshop", "Workshop", 15),
    new Event("Football Match", "Sports", 0)
];
events.push(new Event("Art Exhibition", "Art", 10));
const musicEvents = events.filter(
    event => event.category === "Music"
);
console.log(musicEvents);
const displayNames = events.map(
    event => `Workshop on ${event.name}`
);
console.log(displayNames);
events.forEach(event => {
    if (event.seats > 0) {
        console.log(event.name);
    }
});
function registerUser(eventObj) {
    try {
        if (eventObj.seats <= 0) {
            throw new Error("No seats available");
        }
        eventObj.seats--;
        renderEvents();
    } catch (error) {
        alert(error.message);
    }
}
function addEvent(name, category, seats) {
    events.push(new Event(name, category, seats));
    renderEvents();
}
function filterEventsByCategory(category, callback) {
    const result = events.filter(
        e => e.category === category
    );
    callback(result);
}
function registrationCounter() {
    let count = 0;
    return function () {
        count++;
        return count;
    };
}
const musicCounter = registrationCounter();
function renderEvents() {
    const container =
    document.querySelector("#eventContainer");
    if (!container) return;
    container.innerHTML = "";
    events.forEach(event => {
        const card =
        document.createElement("div");
        card.className = "eventCard";
        card.innerHTML = `
            <h3>${event.name}</h3>
            <p>Category: ${event.category}</p>
            <p>Seats: ${event.seats}</p>
            <button onclick="registerUserByName('${event.name}')">
                Register
            </button>
        `;
        container.appendChild(card);
    });
}
function registerUserByName(name) {
    const eventObj =
    events.find(e => e.name === name);

    registerUser(eventObj);
}
document.addEventListener("DOMContentLoaded", () => {
    renderEvents();
    const filter =
    document.querySelector("#categoryFilter");
    if (filter) {
        filter.onchange = function () {
            const selected =
            this.value;
            const cards =
            [...events];
            console.log(cards);
            filterEventsByCategory(
                selected,
                result => console.log(result)
            );
        };
    }
    const search =
    document.querySelector("#searchBox");
    if (search) {
        search.addEventListener(
            "keydown",
            () => console.log("Searching...")
        );
    }
});
fetch("https://jsonplaceholder.typicode.com/users")
.then(response => response.json())
.then(data => console.log(data))
.catch(error => console.error(error));
async function loadEvents() {
    try {
        document.getElementById("loading").innerHTML =
        "Loading...";
        const response =
        await fetch(
            "https://jsonplaceholder.typicode.com/users"
        );
        const data =
        await response.json();
        console.log(data);
        document.getElementById("loading").innerHTML =
        "";
    } catch (error) {
        console.error(error);
    }
}
function showEvent(
    name = "Unknown Event"
) {
    console.log(name);
}
const sample = events[0];
const { name, category } = sample;
console.log(name, category);
const clonedEvents = [...events];
function submitRegistration(event) {
    event.preventDefault();
    const form =
    document.forms["registrationForm"];
    const username =
    form.elements["username"].value;
    const email =
    form.elements["email"].value;
    if (
        username === "" ||
        email === ""
    ) {
        document.getElementById("errorMsg")
        .innerHTML =
        "Please fill all fields";
        return;
    }
    document.getElementById("errorMsg")
    .innerHTML = "";
    sendRegistration({
        username,
        email
    });
}
function sendRegistration(user) {
    setTimeout(() => {
        fetch(
            "https://jsonplaceholder.typicode.com/posts",
            {
                method: "POST",
                headers: {
                    "Content-Type":
                    "application/json"
                },
                body: JSON.stringify(user)
            }
        )
        .then(response => response.json())
        .then(data => {

            document.getElementById(
                "successMsg"
            ).innerHTML =
            "Registration Successful";

            console.log(data);
        })
        .catch(() => {

            document.getElementById(
                "successMsg"
            ).innerHTML =
            "Registration Failed";
        });

    }, 2000);
}
$("#registerBtn").click(function(){

    $(".eventCard").fadeOut();

    $(".eventCard").fadeIn();
});
