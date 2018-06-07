window.onload = function () {
    document.getElementById("imgNuevo").onclick = function () {
        mostrarPopupAlumno(-1);
    }
}

function mostrarAlumno(indice) {
    mostrarPopupAlumno(indice);
}

function mostrarPopupAlumno(indice) {
    document.getElementById("divPopupFondo").style.display = "inline";
    document.getElementById("ifrPopup").src = "DetalleAlumnos.aspx/?indice=" + indice;
}