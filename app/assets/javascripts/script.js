$(document).ready(function(){
  Paloma.start();
});

Paloma.controller('Messages', {
  new: function(){
    //scrolls to the last message
    let lastChatBox = document.querySelectorAll('.content');
    lastChatBox = lastChatBox[lastChatBox.length-1];
    lastChatBox.scrollIntoView();

    //checks if element is in viewport
    let modals = document.querySelector(".modal")

    function elementInViewport2(el) {
      var top = el.offsetTop;
      var left = el.offsetLeft;
      var width = el.offsetWidth;
      var height = el.offsetHeight;

      while(el.offsetParent) {
        el = el.offsetParent;
        top += el.offsetTop;
        left += el.offsetLeft;
      }

      return (
        top < (window.pageYOffset + window.innerHeight) &&
        left < (window.pageXOffset + window.innerWidth) &&
        (top + height) > window.pageYOffset &&
        (left + width) > window.pageXOffset
      );
    }

    //checks if element is scrolled into view
    function isScrolledIntoView(elem){
      var docViewTop = $(window).scrollTop();
      var docViewBottom = docViewTop + $(window).height();

      var elemTop = $(elem).offset().top;
      var elemBottom = elemTop + $(elem).height();

      return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
    }

    //refresh message page periodically
    let messageBox = document.querySelector('.msg-text-area')
    setInterval(() => {
      if (messageBox.value === "" && elementInViewport2(modals) == false && isScrolledIntoView(lastChatBox) == true) {
        location.reload();
      }
    }, 4000)

    //select message-text-area
    messageBox.focus();
    messageBox.select();
  
    $("#message-box").keyup(function(event) {
      if (event.keyCode === 13) {
          $(".message-submit").click();
      }
    });
  }
});