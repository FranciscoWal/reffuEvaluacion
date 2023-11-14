var formulario = document.getElementById("formulario");

formulario.addEventListener('submit',(e)=>{
    var nombre = document.getElementById("name").value;
    var usuario = document.getElementById("usuario").value;
    var correo = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var telefono = document.getElementById("telefono").value;

    if(nombre!="" && usuario!="" && telefono!="" && correo!="" && password!="" && document.getElementById("checkbox").checked){
    }else{
        e.preventDefault();
        if(nombre==""){
        var errorNombre = document.getElementById("errorNombre");
        errorNombre.classList.remove("novisible");
        errorNombre.classList.add("sivisible");
    }

    if(usuario==""){
        var errorUsuario = document.getElementById("errorUsuario");
        errorUsuario.classList.remove("novisible");
        errorUsuario.classList.add("sivisible");
    }

    if(correo==""){
        var errorCorreo = document.getElementById("errorCorreo");
        errorCorreo.classList.remove("novisible");
        errorCorreo.classList.add("sivisible");
    }

    if(password==""){
        var errorPassword = document.getElementById("errorContraseña");
        errorPassword.classList.remove("novisible");
        errorPassword.classList.add("sivisible");
    }

    if(telefono==""){
        var errorTele = document.getElementById("errorTelefono");
        errorTele.classList.remove("novisible");
        errorTele.classList.add("sivisible");
    }
    if(!document.getElementById("checkbox").checked){
        alert("Favor de aceptar los terminos y condiciones");
    }
    }
});

var nombre = document.getElementById("name");
var usuario = document.getElementById("usuario");
var correo = document.getElementById("email");
var password = document.getElementById("password");
var telefono = document.getElementById("telefono");

nombre.addEventListener("click", ()=>{
    var errorNombre = document.getElementById("errorNombre");
    errorNombre.classList.remove("sivisible");
    errorNombre.classList.add("novisible");
});

usuario.addEventListener("click", ()=>{
    var errorUsuario = document.getElementById("errorUsuario");
    errorUsuario.classList.remove("sivisible");
    errorUsuario.classList.add("novisible");
});

correo.addEventListener("click", ()=>{
    var errorCorreo = document.getElementById("errorCorreo");
    errorCorreo.classList.remove("sivisible");
    errorCorreo.classList.add("novisible");
});

password.addEventListener("click", ()=>{
    var errorPassword = document.getElementById("errorContraseña");
    errorPassword.classList.remove("sivisible");
    errorPassword.classList.add("novisible");
});

telefono.addEventListener("click", ()=>{
    var errorTelefono = document.getElementById("errorTelefono");
    errorTelefono.classList.remove("sivisible");
    errorTelefono.classList.add("novisible");
});