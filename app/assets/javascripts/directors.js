$(document).ready(() => {
    $('p.card-text-director').on('click', (e) => {
        alert('Clicked Button');
        e.preventDefault();
        history.pushState(null, null, '/directors')
        $.getJSON('/directors', (data) => {
          $('#body-container').html('');
          data.forEach((director) => {
            let newDirector = new Director(director);
            let directorHtml = newDirector.formatIndex();
            $('#body-container').append(directorHtml);
          });
        });
      });
      $(document).on('click', '.show-director', function(e) {
        e.preventDefault();
        alert('Show Director');
        let id = $(this).attr('data-id');

        $.getJSON(`/directors/${id}`, (data) => {
          debugger;
        });
      });
    });

  function Director(director){
    this.id = director.id;
    this.name = director.name;
    this.movies = director.movies;
  }

  function getMovie(director) {
    director.movies.forEach((movie) => {
      let movieTitle = movie.title;
    });
    return movieTitle;
  }

  Director.prototype.formatIndex = function () {
    let indexHtml = `
     <a href="/directors/${this.id}" data-id="${this.id}" class="show-director"><h1>${this.name}</h1></a>
    `
    return indexHtml;
  };
