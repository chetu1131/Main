function openTech(evt, techName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(techName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
// document.getElementById("defaultOpen").click();

// console.log(document.getElementById("slide-left"));

// let sliderCount = 1;
// function nextFyn(slider) {
//   let result = document.getElementById(slider);
//   let totalLength = result.children.length;
//   if (sliderCount <= totalLength - 4) {
//     for (let i = 0; i < totalLength; i++)
//       result.children[i].style.display = "none";
//     if (i >= sliderCount && i <= sliderCount + 4) {
//       result.children[i].style.display = "block";
//     }
//   }
//   sliderCount++;
// }

// function prevFyn(slider) {
//   let result = document.getElementById(slider);
//   let totalLength = result.children.length;
//   if (sliderCount >= 3) {
//     for (let i = 0; i < totalLength; i++)
//       result.children[i].style.display = "none";
//     if (i >= sliderCount && i <= sliderCount - 3) {
//       result.children[i].style.display = "block";
//     }
//   }
//   sliderCount--;
// }
