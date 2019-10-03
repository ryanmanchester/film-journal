$(document).ready(() => {
  showDirector();
  getDirectors();
  sortDirectors();
});

  function Director(director){
    this.id = director.id;
    this.name = director.name;
    this.movies = director.movies;
  }

  Director.prototype.formatIndex = function () {
    let indexHtml = `
     <h1>${this.name}</h1>
    `
    return indexHtml;
  };

  Director.prototype.formatShow = function() {
    let showHtml = `
    <h3>Movies by ${this.name}:</h3>
    <a href="/directors/${this.id}" data-id="${this.id}" class="all-directors"><p>See All Directors of Your Movies</p></a>

    `
    return showHtml;
  };

  function getDirectors(){
       $(document).on('click', '.all-directors', function(e) {
        e.preventDefault();
        history.pushState(null, null, '/directors')
        $.getJSON('/directors', (data) => {
          clearDom();
          data.forEach((director) => {
            let newDirector = new Director(director);
            let directorHtml = newDirector.formatIndex();
            $('#body-container').append(directorHtml);
          });
        });
      });
    }

  function showDirector() {
     $('a.directors').on('click', function(e) {
      e.preventDefault();
    let id = $(this).attr('data-id');
    $.getJSON(`/directors/${id}`, (data) => {
      clearDom();
      history.pushState(null, null, `directors/${id}`)
      let newDirector = new Director(data);
      let directorHtml = newDirector.formatShow();
      $('#body-container').append(directorHtml);
      showDirectorMovies(newDirector);
    });
  });
}

function clearDom() {
  let domClear = $('#body-container').html('');
  return domClear;
}

function showDirectorMovies(director){
  director.movies.forEach((movie) => {
    let movieFormat = $('#body-container').append(movieHtml(movie));
    return movieFormat;
  });
}

function sortDirectors() {
  $('.sort-directors').on('click', function() {
    fetch('/directors.json')
     .then(resp => resp.json())
     .then(directors => {
       directors.sort(function(a, b) {
         let nameA = a.name.toUpperCase();
         let nameB = b.name.toUpperCase();
       if (nameA < nameB) {
         return -1;
       }
       if (nameA > nameB) {
         return 1;
       }
       return 0;
     });
   clearDom();
   directors.forEach((director) => {
     let newDirector = new Director(director);
     let directorHtml = newDirector.formatIndex();
     $('#body-container').append(directorHtml);
   })
 })
})
}

function movieHtml(movie){
  let movieHtml = `
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-sm-6 mb-4">
          <div class="card h-100">
           <img class="card-img-top" src="${movie.image}" alt="">
            <div class="card-body">
             <h4 class="card-title">
               ${movie.title}
               </h4>
             <p class="card-text">${movie.synopsis}</p>
             </div>
          </div>
       </div>
    </div>
 </div>
  `
  return movieHtml;
}
