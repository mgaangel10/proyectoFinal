let formulario = document.getElementById("formularioE");
formulario.addEventListener('submit', comprobarPassword);

function comprobarPassword(){
    let password1 = document.getElementById("password").value;
    let password2 = document.getElementById("repeatPassword").value;
    let mensajeError = document.getElementById("mensajeError");

    if (password1 !== password2) {
        mensajeError.style.display = "inline-block";
        return event.preventDefault();
    }else{
        return document.getElementById("formularioE").action = "inicio.html";
    }
}