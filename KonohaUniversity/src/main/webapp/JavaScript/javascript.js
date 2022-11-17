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

function validateName()
{
  var fname = document.getElementById('inputname');

  if(fname.value.length >= 3 && /^[ a-zA-Z\-/']+$/.test(fname.value))
  {
    fname.style.border="2px solid #4BB543";
    
    return true;
  }
  else
  {
    fname.style.border="2px solid #FF0000";

    return false;
  }
}

function validateNIC()
{
  var nic = document.getElementById('nic');

  if(/^[0-9].{8,11}$/.test(nic.value))
  {
    nic.style.border="2px solid #4BB543";
    
    return true;
  }
  else
  {
    nic.style.border="2px solid #FF0000";

    return false;
  }
}


function validateFaculty()
{
  var faculty = document.getElementById('faculty');

  if(faculty.value == "FOC" || faculty.value == "FOE" || faculty.value == "FOB" || faculty.value == "FOHS")
  {
	faculty.style.border="2px solid #4BB543";
    
    return true;
  }
  else
  {
    faculty.style.border="2px solid #FF0000";

    return false;
  }

}


function validateYear()
{
  var year = document.getElementById('stuyear');

  if(year.value == "1" || year.value == "2" || year.value == "3" || year.value == "4")
  {
	year.style.border="2px solid #4BB543";


    return true;
  }
  else
  {
    year.style.border="2px solid #FF0000";

    return false;
  }
  
}



function validateYear2()
{

  var year = document.getElementById('modyear');

  if(year.value == "1" || year.value == "2" || year.value == "3" || year.value == "4" )
  {
	year.style.border="2px solid #4BB543";
    
    return true;
  }
  else
  {
    year.style.border="2px solid #FF0000";

    return false;
  }
  
}

function validateSemester()
{
  var sem = document.getElementById('semester');

  if(sem.value == "1" || sem.value == "2")
  {
	sem.style.border="2px solid #4BB543";
    
    return true;
  }
  else
  {
    sem.style.border="2px solid #FF0000";

    return false;
  }

}

function validateSemester2()
{
  var sem = document.getElementById('semester');

  if(sem.value == "1" || sem.value == "2")
  {
	sem.style.border="2px solid #4BB543";
    
    return true;
  }
  else
  {
    sem.style.border="2px solid #FF0000";

    return false;
  }

}

function validateForm()
{
  if(!validateName() || !validateNIC() || !validateFaculty() || !validateYear() || !validateSemester())
  {
    return false;
  }
  else
  {
    return true;
  }
}

function validateLForm()
{
  if(!validateName() || !validateNIC() || !validateFaculty())
  {
    return false;
  }
  else
  {
    return true;
  }
}


function validateDate() {
	
  var date = document.getElementById("ExamDate");
  
  if(date.value != "")
  {
 	 date.style.border = "2px solid #4BB543";
 	 return true;
  }
  else
  {
	 date.style.border = "2px solid #FF0000";
 	 return false;
  }

}

function validateLIC() {
	
  var lic = document.getElementById("LIC");

  lic.style.border = "2px solid #4BB543";
  return true;
}

function validateMCode() {
	
  var mcode = document.getElementById("MCode");

  if(mcode.value.length > 0)
  {
 	mcode.style.border = "2px solid #4BB543";
  	return true;
  }
  else
  {
	mcode.style.border = "2px solid #FF0000";
  	return false;
  }
}

function validateMName() {
	
  var mname = document.getElementById("MName");

  if(mname.value.length > 0)
  {
 	mname.style.border = "2px solid #4BB543";
  	return true;
  }
  else
  {
	mname.style.border = "2px solid #FF0000";
  	return false;
  }
}

function validateMForm()
{
  if(!validateMCode() || !validateMName() || !validateFaculty() || !validateYear2() || !validateSemester2() || !validateLIC())
  {
    return false;
  }
  else
  {
    return true;
  }
}

function validateEForm()
{
  if(!validateMCode() || !validateDate())
  {
    return false;
  }
  else
  {
    return true;
  }
}

function validateQuestion()
{
  var question = document.getElementById("Question");

  if(question.value.length > 0)
  {
 	question.style.border = "2px solid #4BB543";
  	return true;
  }
  else
  {
	question.style.border = "2px solid #FF0000";
  	return false;
  }
}

function validateOption1()
{
  var option = document.getElementById("Option1");

  if(option.value.length > 0)
  {
 	option.style.border = "2px solid #4BB543";
  	return true;
  }
  else
  {
	option.style.border = "2px solid #FF0000";
  	return false;
  }
}

function validateOption2()
{
  var option = document.getElementById("Option2");

  if(option.value.length > 0)
  {
 	option.style.border = "2px solid #4BB543";
  	return true;
  }
  else
  {
	option.style.border = "2px solid #FF0000";
  	return false;
  }
}

function validateOption3()
{
  var option = document.getElementById("Option3");

  if(option.value.length > 0)
  {
 	option.style.border = "2px solid #4BB543";
  	return true;
  }
  else
  {
	option.style.border = "2px solid #FF0000";
  	return false;
  }
}


function validateOption4()
{
  var option = document.getElementById("Option4");

  if(option.value.length > 0)
  {
 	option.style.border = "2px solid #4BB543";
  	return true;
  }
  else
  {
	option.style.border = "2px solid #FF0000";
  	return false;
  }
}

function validateAnswer()
{
  var answer = document.getElementById("Answer");

  if(answer.value.length > 0)
  {
 	answer.style.border = "2px solid #4BB543";
  	return true;
  }
  else
  {
	answer.style.border = "2px solid #FF0000";
  	return false;
  }
}


function validateQForm()
{
  if(!validateQuestion() || !validateOption1() || !validateOption2() || !validateOption3() || !validateOption4() || !validateAnswer())
  {
    return false;
  }
  else
  {
    return true;
  }
}




