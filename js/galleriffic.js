jQuery(document).ready(function($) {
  // We only want these styles applied when javascript is enabled
  $('div.navigation').css({'width' : '300px', 'float' : 'left'});
  $('div.content').css('display', 'block'); 

  // Initially set opacity on thumbs and add
  // additional styling for hover effect on thumbs
  var onMouseOutOpacity = 0.67;
  $('#thumbs ul.thumbs li').opacityrollover({
    mouseOutOpacity: onMouseOutOpacity,
    mouseOverOpacity: 1.0,
    fadeSpeed: 'fast',
    exemptionSelector: '.selected'
  }); 

  var gallery = $('#thumbs').galleriffic({
    delay:                     3000, // in milliseconds
      numThumbs:                 15, // The number of thumbnails to show page
      preloadAhead:              40, // Set to -1 to preload all images
      enableTopPager:            true,
      enableBottomPager:         false,
      maxPagesToShow:            7,  // The maximum number of pages to display in either the top or bottom pager
      imageContainerSel:         '#slideshow', // The CSS selector for the element within which the main slideshow image should be rendered
      controlsContainerSel:      '#controls', // The CSS selector for the element within which the slideshow controls should be rendered
      captionContainerSel:       '#caption', // The CSS selector for the element within which the captions should be rendered
      loadingContainerSel:       '#loading', // The CSS selector for the element within which should be shown when an image is loading
      renderSSControls:          false, // Specifies whether the slideshow's Play and Pause links should be rendered
      renderNavControls:         false, // Specifies whether the slideshow's Next and Previous links should be rendered
      playLinkText:              'Play',
      pauseLinkText:             'Pause',
      prevLinkText:              'Previous',
      nextLinkText:              'Next',
      nextPageLinkText:          'Next Page &rsaquo;',
      prevPageLinkText:          '&lsaquo; Previous Page',
      enableHistory:             false, // Specifies whether the url's hash and the browser's history cache should update when the current slideshow image changes
      enableKeyboardNavigation:  true, // Specifies whether keyboard navigation is enabled
      autoStart:                 false, // Specifies whether the slideshow should be playing or paused when the page first loads
      syncTransitions:           true, // Specifies whether the out and in transitions occur simultaneously or distinctly
      defaultTransitionDuration: 900,
      onSlideChange: function(prevIndex, nextIndex) {
        // 'this' refers to the gallery, which is an extension of $('#thumbs')
        this.find('ul.thumbs').children()
          .eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
          .eq(nextIndex).fadeTo('fast', 1.0);
      },
      onPageTransitionOut: function(callback) {
        this.fadeTo('fast', 0.0, callback);
      },
      onPageTransitionIn: function() {
        this.fadeTo('fast', 1.0);
      } 
  });
});
