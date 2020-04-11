// API
class API {
  constructor() {
    this.baseURL = "http://localhost:5000/";
  }

  getCityList = async () => {
    const response = await fetch(this.baseURL + "city/list");
    const data = await response.json();
    return data.result;
  };

  getMovieListByCity = async (id) => {
    const response = await fetch(this.baseURL + "movie/list/" + id);
    const data = await response.json();
    return data.result;
  };

  getTheatreListByCity = async (cityId, movieId) => {
    const response = await fetch(
      this.baseURL + "movie/theatre/" + cityId + "/" + movieId
    );
    const data = await response.json();
    return data.result;
  };

  getShowListByCity = async (cityId, movieId) => {
    const response = await fetch(
      this.baseURL + "movie/show/" + cityId + "/" + movieId
    );
    const data = await response.json();
    return data.result;
  };
}

const api = new API();

document.addEventListener("DOMContentLoaded", async () => {
  let cities = await api.getCityList();
  console.log(cities);
  let dropdown = document.getElementById("selectCity");
  // create dropdown list
  // let defaultOption = document.createElement("option");
  // defaultOption.value = "";
  // defaultOption.innerHTML = "SELECT CITY";
  // defaultOption.setAttribute("selected", "true");
  // defaultOption.setAttribute("disabled", "true");
  // dropdown.appendChild(defaultOption);
  cities.forEach((city) => {
    let option = document.createElement("option");
    option.value = city.id;
    option.textContent = city.city_name;
    dropdown.appendChild(option);
  });
  dropdown.addEventListener("change", fetchMovieByCity);
});

const fetchMovieByCity = async (e) => {
  let id = e.target.value;
  let movieList = await api.getMovieListByCity(id);
  console.log(movieList);
  let dropdown = document.getElementById("selectMovie");
  // create dropdown list
  movieList.forEach((movie) => {
    let option = document.createElement("option");
    option.value = movie.fk_movie_id;
    option.textContent = movie.movie_name;
    dropdown.appendChild(option);
  });
};

const fetchShow = async (e) => {
  e.preventDefault();
  let cityId = document.getElementById("selectCity").value;
  let movieId = document.getElementById("selectMovie").value;
  let theatreList = await api.getTheatreListByCity(cityId, movieId);
  let showList = await api.getShowListByCity(cityId, movieId);
  console.log(theatreList);
  console.log(showList);
  let theatreDiv = document.getElementById("theatreList");

  theatreList.forEach((theatre) => {
    let col = document.createElement("div");
    col.setAttribute("class", "col-lg-4");

    let card = document.createElement("div");
    card.setAttribute("class", "card");

    let cardBody = document.createElement("div");
    cardBody.setAttribute("class", "card-body");

    let h5 = document.createElement("h5");
    h5.setAttribute("class", "card-title");
    h5.textContent = theatre.theatre_name;

    let select = document.createElement("select");
    select.setAttribute("class", "form-control form-control-lg");

    let defaultOption = document.createElement("option");
    defaultOption.value = "";
    defaultOption.textContent = "SELECT SHOW";
    defaultOption.setAttribute("selected", "true");
    defaultOption.setAttribute("disabled", "true");
    select.appendChild(defaultOption);

    showList.forEach((show) => {
      if (theatre.fk_theatre_id === show.fk_theatre_id) {
        let option = document.createElement("option");
        option.value = show.id;
        option.textContent = show.start_time;
        select.appendChild(option);
      }
    });
    select.addEventListener("change", showDetail);

    cardBody.appendChild(h5);
    cardBody.appendChild(select);

    card.appendChild(cardBody);
    col.appendChild(card);
    theatreDiv.appendChild(col);
  });
};

const showDetail = (e) => {
  e.preventDefault();
  let id = e.target.value;
  localStorage.setItem("show_id", id);
  window.location.href = "seat.html";
};

// add event listener to button
let searchMovieBtn = document.getElementById("searchMovie");
searchMovieBtn.addEventListener("click", fetchShow);
