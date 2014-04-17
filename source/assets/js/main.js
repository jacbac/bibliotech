

$(document).ready(function() {

  // Bootstrap affix
  var $aside = $('.post-aside');
  $aside.affix({
    offset: {
      top: function () {
        var offsetTop      = $aside.offset().top;
        var asideMargin    = $('.post-banner').height();
        var navOuterHeight = $('.navbar-fixed-top').height();

        return (this.top = offsetTop + navOuterHeight + asideMargin);
      },
      bottom: function () {
        return (this.bottom = $('.affix-footer').outerHeight(true) + 100);
      }
    }
  });

  // Bootstrap scrollspy
  var $window = $(window);
  var $body   = $(document.body);

  var navHeight = $('.navbar').outerHeight(true) + 100;

  $body.scrollspy({
    offset: navHeight
  });

  $window.on('load', function () {
    $body.scrollspy('refresh')
  });

  // Search functionnality
  // see inspiration : http://designbyjoel.com/blog/2012-11-23-middleman-search/
  $('.search-submit').on('click', function(e) {
    var search_term;
    e.preventDefault();
    search_term = $('.search-term').val().toLowerCase();
    
    return $.getJSON('/entries.json', function(data) {
      var article, result, results, value, ii, jj, _len, _len1, _results;
      results = [];
      for (ii = 0, _len = Object.size(data); ii < _len; ii++) {
        article = data[ii];
        value = 0;
        if (article.title.toLowerCase().split(search_term).length - 1 !== 0) {
          value = 15;
        }
        if (article.date.toLowerCase().split(search_term).length - 1 !== 0) {
          value = 15;
        }
        // if (article.authors.toLowerCase().split(search_term).length - 1 !== 0) {
        //   value = 10;
        // }
        // if (article.categories.toLowerCase().split(search_term).length - 1 !== 0) {
        //   value = 10;
        // }
        // if (article.tags.toLowerCase().split(search_term).length - 1 !== 0) {
        //   value = 10;
        // }
        if (article.content.toLowerCase().split(search_term).length - 1 !== 0) {
          value += (article.content.toLowerCase().split(search_term).length - 1) * 5;
        }
        if (value !== 0) {
          article.value = value;
          results.push(article);
        }
      }

      $('.search-results').html('<h3>Résultats de la recherche</h3>');
      if (results[0] != null) {
        // $('.search-results').append('<ul>');
        _results = [];
        for (jj = 0, _len1 = results.length; jj < _len1; jj++) {
          result = results[jj];
          _results.push($('.search-results').append('<li><a href="' + result.url + '">' + result.title + '</a></li>'));
        }
        // $('.search-results').append('</ul>');
        return _results;
      } else {
        return $('.search-results').append('<p>Aucun résultats n\'a été trouvé. C\'est triste mais il ne manque qu\'à vous de régler ce problème en faisant une nouvelle documentation :).</p>');
      }
    });
  });

Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};

});
