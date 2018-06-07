window.onload = function () {
    document.getElementById("imgNuevo").onclick = function () {
        mostrarPopupExamen(-1);
    }
}

function mostrarExamen(indice) {
    mostrarPopupExamen(indice);
}

function mostrarPopupExamen(indice) {
    document.getElementById("divPopupFondo").style.display = "inline";
    document.getElementById("ifrPopup").src = "DetalleExamen.aspx/?indice=" + indice;
}