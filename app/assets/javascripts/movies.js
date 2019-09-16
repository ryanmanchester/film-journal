$(document).ready( () => {
  $('form#new_movie').on('submit', (e) => {
    e.preventDefault();
    debugger;
  })
})

 Movie.prototype.formatNewMovie = function() {
  let newMovieHtml = `<div class="container">
  <h1 class="my-4">${this.title}</h1>
  <div class="row">

      <div class="col-md-8">
        <img class="img-fluid" src="${this.image}" >
      </div>

      <div class="col-md-4">
        <h3 class="my-3">Synopsis:</h3>
        <p>${this.synopsis}</p>
        <h3 class="my-3">Starring:</h3>
        <p>${this.starring}</p>
        <h3 class="my-3">Release Year:</h3>
        <p>${this.release_year}</p>
        <h3 class="my-3">Director:</h3>
        <p>${this.director}</p>

      </div>


      </div>
  `
  return newMovieHtml;
}

function Movie(movie) {
  this.id = movie.id;
  this.title = movie.title;
  this.release_year = movie.release_year;
  this.starring = movie.starring;
  this.synopsis = movie.synopsis;
  this.image = movie.image;
  this.director = movie.director;
}
