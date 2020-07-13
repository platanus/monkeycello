import axios from 'axios';

function getCasinosAttributes(casinos) {
  return casinos.map((casino) => ({ id: casino.id, ...casino.attributes }));
}

export default function getCasinos() {
  return axios
    .get('/api/v1/casinos')
    .then((response) => getCasinosAttributes(response.data.data));
}
