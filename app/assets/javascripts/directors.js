$(document).ready(() => {
    $('a.directors').on('click', (e) => {
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
          $('#body-container').html('');
          history.pushState(null, null, `directors/${id}`)
          let newDirector = new Director(data);
          let directorHtml = newDirector.formatShow();
          $('#body-container').append(directorHtml);
          data.movies.forEach((movie) => {
            let movieHtml = `
             <ul>
               <li>${movie.title}</li>
              </ul>
            `
            $('#body-container').append(movieHtml);

          })

        });
      });
    });

  function Director(director){
    this.id = director.id;
    this.name = director.name;
    this.movies = director.movies;
  }

  Director.prototype.formatIndex = function () {
    let indexHtml = `
     <a href="/directors/${this.id}" data-id="${this.id}" class="show-director"><h1>${this.name}</h1></a>
    `
    return indexHtml;
  };

  Director.prototype.formatShow = function() {
    let showHtml = `
    <h3>Movies by ${this.name}:</h3>

    `
    return showHtml;
  }
