window.onload = function () {
    document.getElementById("imgCerrar").onclick =
    document.getElementById("imgCancelar").onclick =
    function () {
        window.parent.document.getElementById("ifrPopup").src = "";
        window.parent.document.getElementById("divPopupFondo").style.display = "none";
    }
    document.getElementById("imgGuardar").onclick = function () {
        var mensaje = "";
        var txtNombre = document.getElementById("txtNombre");

        if (txtNombre.value == "") {
            mensaje += "<li>Ingresa el Nombre</li>";
        }
        if (mensaje != "") {
            document.getElementById("lblMensaje").innerHTML = "<ul>" + mensaje + "</ul>";
            return false;
        }
        else {
            document.getElementById("lblMensaje").innerHTML = "";
            return true;
        }
    }
}