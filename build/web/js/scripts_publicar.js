var formulario = document.getElementById("formulario");

formulario.addEventListener('submit',(e)=>{
    var nombre = document.getElementById("titulo").value;
    var apellido = document.getElementById("producto").value;
    var nom_emp = document.getElementById("fecha").value;
    var telefono = document.getElementById("descripcion").value;

    if(nom_emp!="" && apellido!="" && nom_emp!="" && telefono!="" && correo!="" && password!="" && document.getElementById("checkbox").checked){
    }else{
        e.preventDefault();
    }
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

});

var nombre = document.getElementById("titulo").value;
var apellido = document.getElementById("producto").value;
var nom_emp = document.getElementById("fecha").value;
var telefono = document.getElementById("descripcion").value;

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
