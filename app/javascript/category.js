const categoryList = () => {
  const pullDownButton = document.querySelector(".category-list");
  const pullDownParents = document.getElementById("pull-down");
  pullDownButton.addEventListener('click', () => {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;");
    } else {
      pullDownParents.setAttribute("style", "display:block;");
    }; 
  });
}

window.addEventListener("load", categoryList);
