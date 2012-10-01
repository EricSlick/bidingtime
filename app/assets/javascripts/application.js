// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready()
{
    $('.flickerEffect').click(function(){alert("whoot");});
    $('.flickerEffect').hover(function () {
        alert("hover");
        $(this).animate({
            opacity:0.10
        }, 1000, function () {
// Animation complete.
        });
    }, function () {
        alert("out");
        //
        $(this).animate({
                opacity:1.0
            }, 1000, function () {

            }
        );
    });

    $("li").hover(
        function () {
            alert("here");
            $(this).append($("<span> ***</span>"));
        },
        function () {
            alert("there");
            $(this).find("span:last").remove();
        }
    );
}
