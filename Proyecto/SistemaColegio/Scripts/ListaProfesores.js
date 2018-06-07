window.onload = function () {
    document.getElementById("imgNuevo").onclick = function () {
        mostrarPopupProfesor(-1);
    }
}

function mostrarProfesor(indice) {
    mostrarPopupProfesor(indice);
}

function mostrarPopupProfesor(indice) {
    document.getElementById("divPopupFondo").style.display = "inline";
    document.getElementById("ifrPopup").src = "DetalleProfesor.aspx/?indice=" + indice;
}