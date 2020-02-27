$(document).ready( () => {
  $('form#new_movie').on('submit',function (e){
    e.preventDefault();
    let postUrl = $(this).attr('action');
    let values = $(this).serialize();
    $.post(postUrl, values)
    .done(function(data) {


      if(data.length <= 6) {
        $('form#new_movie').append(errorHtml(data))
      }else {
        $('#body-container').html('')
        const newMovie = new Movie(data);
        const newMovieHtml = newMovie.formatNewMovie();
        $('#body-container').html(newMovieHtml);
      }
    })
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
        <p>${this.director.name}</p>
        <h3 class="my-3">Your Review:</h3>
        <p>${this.user_movies[0].review}</p>
        <h3 class="my-3">Your Rating:</h3>
        <p>${this.user_movies[0].rating}</p><br></br>

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
  this.user_movies = movie.user_movies;
}

function errorHtml(data) {
  errorsHtml = `
    <div class="error-messages">
      ${data.join(', ')}
    </div>
  `
  return errorsHtml;
}
