
window.addEventListener("DOMContentLoaded", function () {
   let menuBox = document.querySelector('#menu_box');
   let menuSon = document.querySelectorAll('#menu_box>li ul');
   let menu_bg = document.querySelector('#menu_bg');

   menuBox.addEventListener("mouseover", function () {
      menuSon.forEach(ele => {
         ele.classList.remove("display-none");
      });

      menu_bg.classList.remove("display-none");
   })

   menu_bg.addEventListener("mouseover", function () {
      menuSon.forEach(ele => {
         ele.classList.remove("display-none");
      });

      menu_bg.classList.remove("display-none");
   })

   menuBox.addEventListener("mouseout", function () {
      menuSon.forEach(ele => {
         ele.classList.add("display-none");
      });
      menu_bg.classList.add("display-none");
   })


   menu_bg.addEventListener("mouseout", function () {
      menuSon.forEach(ele => {
         ele.classList.add("display-none");
      });
      menu_bg.classList.add("display-none");
   })
})

$(function () {
   let moMenuBox = $("#mo-menu-box");
   let moMenuBoxLi = $("#mo-menu-box>li");
   let icon = $("#icon");
   let leftBg = $("#left-bg");
   let sonMenuBg = $("#son-menu-bg");
   moMenuBox.hide();
   leftBg.hide();
   sonMenuBg.hide();

   moMenuBoxLi.each(function (idx, ele) {
      let menuSon = $(ele).find(".menu-son");
      menuSon.hide();

      $(ele).on("click", function () {
         moMenuBoxLi.each(function (idx_1, ele_1) {
            let menuSon_1 = $(ele_1).find(".menu-son");
            menuSon_1.hide();
         });
         // 클릭한 요소의 .menu-son 토글
         menuSon.toggle();
      });
   });

   icon.on("click", function () {
      moMenuBox.toggle();
      sonMenuBg.toggle();
      leftBg.toggle();
   });

   // Check window width on window resize
   $(window).resize(function () {
      moMenuBox.hide();
      leftBg.hide();
      sonMenuBg.hide();
   });
});



