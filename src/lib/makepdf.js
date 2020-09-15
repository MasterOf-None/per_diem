
// Import
const { jsPDF } = require("jspdf");

// Inicializar instancia de PDF
const doc = new jsPDF();

function makePDF(text) {
  doc.text(text, 10, 10);
  doc.save('viaticos.pdf');
}

module.exports = makePDF;