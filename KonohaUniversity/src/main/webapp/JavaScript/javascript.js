window.onload = setActiveNavigation;

function myFunction() {
  var x = document.getElementById("topnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}

var n = 0;
function changeTheme() {
  if (n == 0)
  {
    document.body.className = "dark";
    document.getElementById("themebtn").innerHTML = "<i class='fa fa-sun-o'></i>";
    document.getElementById("themebtn").className = "darkthemebtn";
    n++;
  }
  else
  {
    document.body.className = "light";
    document.getElementById("themebtn").innerHTML = "<i class='fa fa-moon-o'></i>";
    document.getElementById("themebtn").className = "themebtn";
    n--;
  }
}

function displayIT(){
  document.getElementById("focdiv").style.display="block";
  document.getElementById("foediv").style.display="none";
  document.getElementById("fobdiv").style.display="none";
  document.getElementById("fohsdiv").style.display="none";
  document.getElementById("focbtn").className="activefacultybtn"
  document.getElementById("foebtn").className="facultybtn"
  document.getElementById("fobbtn").className="facultybtn"
  document.getElementById("fohsbtn").className="facultybtn"
}

function displayEN(){
  document.getElementById("focdiv").style.display="none";
  document.getElementById("foediv").style.display="block";
  document.getElementById("fobdiv").style.display="none";
  document.getElementById("fohsdiv").style.display="none";
  document.getElementById("focbtn").className="facultybtn"
  document.getElementById("foebtn").className="activefacultybtn"
  document.getElementById("fobbtn").className="facultybtn"
  document.getElementById("fohsbtn").className="facultybtn"
}

function displayBM(){
  document.getElementById("focdiv").style.display="none";
  document.getElementById("foediv").style.display="none";
  document.getElementById("fobdiv").style.display="block";
  document.getElementById("fohsdiv").style.display="none";
  document.getElementById("focbtn").className="facultybtn"
  document.getElementById("foebtn").className="facultybtn"
  document.getElementById("fobbtn").className="activefacultybtn"
  document.getElementById("fohsbtn").className="facultybtn"
}

function displayHS(){
  document.getElementById("focdiv").style.display="none";
  document.getElementById("foediv").style.display="none";
  document.getElementById("fobdiv").style.display="none";
  document.getElementById("fohsdiv").style.display="block";
  document.getElementById("focbtn").className="facultybtn"
  document.getElementById("foebtn").className="facultybtn"
  document.getElementById("fobbtn").className="facultybtn"
  document.getElementById("fohsbtn").className="activefacultybtn"
}

function setActiveNavigation() {
  array = document.getElementById('topnav').getElementsByTagName('a');
  for(i=0;i<array.length;i++) {
    if(document.location.href.indexOf(array[i].href)>=0) {
      array[i].className='active';
    }
  }
}