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

let fechaInput = document.getElementById('fecha');
		let fechaActual = new Date();
		let dia = fechaActual.getDate();
		let mes = fechaActual.getMonth() + 1;
		let anio = fechaActual.getFullYear();
		let fechaMinima = `${anio}-${mes.toString().padStart(2, '0')}-${dia.toString().padStart(2, '0')}`;
		fechaInput.setAttribute('min', fechaMinima);