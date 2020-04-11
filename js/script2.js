// API
const showID = localStorage.getItem("show_id");
class API {
  constructor() {
    this.baseURL = "http://localhost:5000/";
  }

  getShowListByID = async () => {
    const response = await fetch(
      this.baseURL + "movie/show/info/" + Number(showID)
    );
    const data = await response.json();
    return data.result;
  };

  getBookedTicketByID = async () => {
    const response = await fetch(
      this.baseURL + "movie/show/booked/" + Number(showID)
    );
    const data = await response.json();
    return data.result;
  };
}

const api = new API();

document.addEventListener("DOMContentLoaded", async () => {
  let info = await api.getShowListByID();
  let bookedTicket = await api.getBookedTicketByID();
  console.log(info);
  console.log(bookedTicket);

  let bookedTicketArr = [];
  bookedTicket.forEach((x) => {
    bookedTicketArr.push(...x.seats.split(",").map(Number));
  });
  console.log(bookedTicketArr);
  let seatDiv = document.getElementById("seatDiv");
  let showInfo = document.getElementById("showInfo");

  let details = `<div class="row text-left">
                  <div class="col-6">
                    <img src="https://picsum.photos/400/600/?blur" class="img-fluid" />
                  </div>
                  <div class="col-6">
                  <h5>${info[0].movie_name}</h5>
                  <ul class="list-unstyled">
                    <li><strong>Genre:</strong> ${info[0].genre}</li>
                    <li><strong>Language:</strong> ${info[0].language}</li>
                    <li><strong>Rating:</strong> ${info[0].rating}/5</li>
                  </ul>
                </div>`;
  showInfo.innerHTML = details;
  for (let i = 1; i <= info[0].total_seats; i++) {
    let seat = document.createElement("div");
    seat.setAttribute("id", `seat${i}`);
    seat.setAttribute("data-value", i);
    if (bookedTicketArr.includes(i) == true) {
      seat.setAttribute("class", "seat booked");
    } else {
      seat.setAttribute("class", "seat");
      seat.addEventListener("click", selectSeat);
    }

    seatDiv.appendChild(seat);
  }

  // dropdown.addEventListener("change", fetchMovieByCity);
});

const count = document.getElementById("count");
const total = document.getElementById("total");

// select seat
const selectSeat = (e) => {
  let x = e.target;
  x.classList.toggle("selected");
  const selectedSeats = document.querySelectorAll("#seatDiv .selected");
  count.textContent = selectedSeats.length;
  total.textContent = 100 * selectedSeats.length;
};

const bookTicket = (e) => {
  e.preventDefault();
  const selectedSeats = document.querySelectorAll("#seatDiv .selected");
  let arr = [];
  for (var i = 0; i < selectedSeats.length; i++) {
    arr.push(selectedSeats[i].getAttribute("data-value"));
  }
  let today = new Date();
  let D = today.getDate();
  let M = today.getMonth();
  let Y = today.getFullYear();
  let obj = {
    fk_show_id: showID,
    date: Y + "-" + M + "-" + D,
    ticket_number: Math.floor(Math.random() * 10000) + 1,
    seats: arr.join(","),
    amount: Number(total.innerText),
  };
  // console.log(obj);
  ticketDetails = JSON.stringify(obj);

  const xhr = new XMLHttpRequest();
  xhr.open("POST", "http://localhost:5000/movie/book");
  xhr.setRequestHeader("Content-type", "application/json; charset=utf-8");
  console.log(ticketDetails);
  xhr.send(ticketDetails);
  xhr.onload = function () {
    if (xhr.status == 201) {
      console.log(xhr.response);
      alert(xhr.response);
      window.location.href = "index.html";
    } else {
      console.log(xhr.status);
    }
  };
};

// add event listener to button
let bookTicketBtn = document.getElementById("bookTicket");
bookTicketBtn.addEventListener("click", bookTicket);
