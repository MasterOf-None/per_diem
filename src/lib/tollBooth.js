const toll = [
  'fortin_CdMendoza_Cordoba',
  'fortin_CdMendoza_Fortin',
  'cuitlahuac_Cuitlahuac_LaTinaja',
  'pasoDelToro_LaTinaja_Veracruz',
  'laAntigua_Cardel_Veracruz',
  'planDelRio',
  'libramientoDeXalapa',
  'puenteNautla',
  'totomoxtle',
  'tuxpan_Tihuatlan_Tuxpan',
  'alamo_PuenteJoseLopezPortillo',
  'naranjos_Tuxpan_Naranjos',
  'huayacocotla_CasetaGeneral',
  'cosamaloapan_Cosamaloapan_Isla',
  'cosamaloapan_LaTinaja_Isla',
  'acayucan_Acayucan_Cosoleacaque',
  'acayucan_Isla_Cosoleacaque',
  'puenteDovaliJaime',
  'lasChoapas_EntLasChoapas_EntLasChoapasII',
  'lasChoapas_EntLasChoapas_EntNuevoSacrificio'
];

function tollBooth() {
  let tollNames = '';

  for (let x = 0; x < toll.length; x++) {
    if (x == toll.length - 1) {
      tollNames = tollNames + toll[x];
    } else {
      let auxiliar = toll[x] + ', ';
      tollNames += auxiliar;
    }
  }

  return tollNames;
}

module.exports.tollBooth = tollBooth;