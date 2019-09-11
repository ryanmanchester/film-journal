$(document).ready( () => {
  $('#new_movie').on('submit', (e) => {
    e.preventDefault();
    alert('Submit');
    $('#body-container').html('');
    $('#body-container').html(formatNewMovie());
  })
})

function formatNewMovie() {
  let newMovieHtml = `<div class="container">
  <h1 class="my-4">Title</h1>
  <div class="row">

      <div class="col-md-8">
        <img class="img-fluid" src="" alt="">
      </div>

      <div class="col-md-4">
        <h3 class="my-3">Synopsis:</h3>
        <p></p>
        <h3 class="my-3">Starring:</h3>
        <p></p>
        <h3 class="my-3">Release Year:</h3>
        <p></p>
        <h3 class="my-3">Director:</h3>
        <p></p>

      </div>


      </div>
  `
  return newMovieHtml;
}
