var formulario = document.getElementById("formulario");

formulario.addEventListener('submit',(e)=>{
    var nombre = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    
    if(nombre!="" && password!=""){
    }else{
        e.preventDefault();
        if(nombre==""){
        var errorNombre = document.getElementById("errorNombre");
        errorNombre.classList.remove("novisible");
        errorNombre.classList.add("sivisible");
        }
        if(password==""){
            var errorPassword = document.getElementById("errorPassword");
            errorPassword.classList.remove("novisible");
            errorPassword.classList.add("sivisible");
        }
    }
});

var nombre = document.getElementById("email");

nombre.addEventListener("click", ()=>{
    var errorNombre = document.getElementById("errorNombre");
    errorNombre.classList.remove("sivisible");
    errorNombre.classList.add("novisible");
});

var password = document.getElementById("password");

password.addEventListener("click", ()=>{
    var errorPassword = document.getElementById("errorPassword");
    errorPassword.classList.remove("sivisible");
    errorPassword.classList.add("novisible");
});