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
        var txtApeMaterno = document.getElementById("txtApeMaterno");
        var txtApePaterno = document.getElementById("txtApePaterno");
        var txtTelefono = document.getElementById("txtTelefono");
        var txtFechaCon = document.getElementById("txtFechaCon");

        if (txtNombre.value == "") {
            mensaje += "<li>Ingresa el Nombre</li>";
        }
        if (txtApeMaterno.value == "") {
            mensaje += "<li>Ingresa el ApeMaterno</li>";
        }
        if (txtApePaterno.value == "") {
            mensaje += "<li>Ingresa el ApePaterno</li>";
        }
        if (txtTelefono.value == "") {
            mensaje += "<li>Ingresa el Teléfono</li>";
        }
        if (txtFechaCon.value == "") {
            mensaje += "<li>Ingresa la Fecha de Contratación</li>";
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