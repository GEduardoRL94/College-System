window.onload = function () {
    document.getElementById("imgCerrar").onclick =
    document.getElementById("imgCancelar").onclick =
    function () {
        window.parent.document.getElementById("ifrPopup").src = "";
        window.parent.document.getElementById("divPopupFondo").style.display = "none";
    }
    document.getElementById("imgGuardar").onclick = function () {
        var mensaje = "";
        var txtFechaExamen = document.getElementById("txtFechaExamen");
        var txtNota = document.getElementById("txtNota");
        if (txtFechaExamen.value == "") {
            mensaje += "<li>Ingresa el Fecha</li>";
        }
        if (txtNota.value == "") {
            mensaje += "<li>Ingresa la Nota</li>";
        }
        if (isNaN(txtNota.value)) {
            mensaje += "<li>La Nota debe ser un número</li>";
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