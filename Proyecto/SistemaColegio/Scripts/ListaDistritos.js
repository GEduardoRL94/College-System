window.onload = function () {
    document.getElementById("imgNuevo").onclick = function () {
        mostrarPopupDistrito(-1);
    }
}

function mostrarDistrito(indice) {
    mostrarPopupDistrito(indice);
}

function mostrarPopupDistrito(indice) {
    document.getElementById("divPopupFondo").style.display = "inline";
    document.getElementById("ifrPopup").src = "DetalleDistrito.aspx/?indice=" + indice;
}