var formulario = document.getElementById("formulario");

formulario.addEventListener('submit',(e)=>{
    
    var nombre = document.getElementById("name").value;
    var apellido = document.getElementById("apellido").value;
    var nom_emp = document.getElementById("name_empresa").value;
    var telefono = document.getElementById("telefono").value;
    var correo = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    if(nombre!="" && apellido!="" && nom_emp!="" && telefono!="" && correo!="" && password!="" && document.getElementById("checkbox").checked){
    
        
    } else{
        e.preventDefault(e);
    if(nombre==""){
        var errorNombre = document.getElementById("errorNombre");
        errorNombre.classList.remove("novisible");
        errorNombre.classList.add("sivisible");
    }

    if(apellido==""){
        var errorApellido = document.getElementById("errorApellido");
        errorApellido.classList.remove("novisible");
        errorApellido.classList.add("sivisible");
    }

    if(nom_emp==""){
        var errorNom_emp = document.getElementById("errorNomEmpresa");
        errorNom_emp.classList.remove("novisible");
        errorNom_emp.classList.add("sivisible");
    }
    if(telefono==""){
        var errorTele = document.getElementById("errorTelefono");
        errorTele.classList.remove("novisible");
        errorTele.classList.add("sivisible");
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
    if(!document.getElementById("checkbox").checked){
        alert("Favor de aceptar los terminos y condiciones");
    }
    }
});

var nombre = document.getElementById("name");    
var apellido = document.getElementById("apellido");
var nom_emp = document.getElementById("name_empresa");
var telefono = document.getElementById("telefono");
var correo = document.getElementById("email");
var password = document.getElementById("password");

nombre.addEventListener("click", ()=>{
    var errorNombre = document.getElementById("errorNombre");
    errorNombre.classList.remove("sivisible");
    errorNombre.classList.add("novisible");
});

apellido.addEventListener("click", ()=>{
    var errorApellido = document.getElementById("errorApellido");
    errorApellido.classList.remove("sivisible");
    errorApellido.classList.add("novisible");
});

nom_emp.addEventListener("click", ()=>{
    var errorNomEmpresa = document.getElementById("errorNomEmpresa");
    errorNomEmpresa.classList.remove("sivisible");
    errorNomEmpresa.classList.add("novisible");
});

telefono.addEventListener("click", ()=>{
    var errorTele = document.getElementById("errorTelefono");
    errorTele.classList.remove("sivisible");
    errorTele.classList.add("novisible");
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