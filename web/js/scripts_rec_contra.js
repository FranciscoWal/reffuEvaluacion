var formulario = document.getElementById("formulario");

formulario.addEventListener('submit',(e)=>{
    e.preventDefault();
    var correo = document.getElementById("email").value;
    if(correo==""){
        var errorEmail = document.getElementById("errorEmail");
        errorEmail.classList.remove("novisible");
        errorEmail.classList.add("sivisible");
    }
});

var email = document.getElementById("email");    

email.addEventListener("click", ()=>{
    var errorEmail = document.getElementById("errorEmail");
    errorEmail.classList.remove("sivisible");
    errorEmail.classList.add("novisible");
});