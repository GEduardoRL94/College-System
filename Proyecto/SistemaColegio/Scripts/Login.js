window.onload = function () {
    var nombre = document.getElementById("nombre");
    var pass = document.getElementById("pass");
    var btnEnviar = document.getElementById("btn-submit");

    btnEnviar.onclick = function () {
        if (nombre.value == "." && pass.value == "123") {
            window.location.assign("ListaAuxiliares.aspx")
        }
    }
}