// Elimina los valores null del arreglo

const clean = (array) => array.reduce((account, element) => {
  if(element) {
    account.push(element);
  }
  return account;
} , []);

module.exports.clean = clean;