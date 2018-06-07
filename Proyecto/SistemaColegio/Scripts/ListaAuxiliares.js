window.onload = function () {
    document.getElementById("imgNuevo").onclick = function () {
        mostrarPopupAuxiliar(-1);
    }
}

function mostrarAuxiliar(indice) {
    mostrarPopupAuxiliar(indice);
}

function mostrarPopupAuxiliar(indice) {
    document.getElementById("divPopupFondo").style.display = "inline";
    document.getElementById("ifrPopup").src = "DetalleAuxiliar.aspx/?indice=" + indice;
}