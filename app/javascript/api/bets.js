import axios from 'axios';

function getBetAttributes(data) {
  return data.attributes;
}

export default function postBet(casinoId) {
  return axios
    .post(`/api/v1/casinos/${casinoId}/bets`)
    .then((response) => (getBetAttributes(response.data.data)));
}
