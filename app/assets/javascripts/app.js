$(function(){

  $('.bar').on('click', function(){
    $('.bar1,.bar2').removeClass('bar-ext');
    $(this).addClass('bar-ext');
  });
  $('.bar').mouseover(function(){
    $('.bar').css({'background-color': '#BAD3FF'});
  });
  $('.bar').mouseout(function(){
    $('.bar').css({'background-color': '#FFFFFF'});
  });

  $('.bar1').on('click', function(){
    $('.bar,.bar2').removeClass('bar-ext');
    $(this).addClass('bar-ext');
  });

  $('.bar2').on('click', function(){
    $('.bar,.bar1').removeClass('bar-ext');
    $(this).addClass('bar-ext');
  });

});