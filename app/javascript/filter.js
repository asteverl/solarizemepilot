if (document.querySelector(".category-choice")) {
  $(document).ready(function(){
    $(".category-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
}
