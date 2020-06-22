import axios from 'axios';

export default function postBet(casinoId) {
  return axios
    .post(`/api/v1/casinos/${casinoId}/bets`)
    .then((response) => (response.data.data));
}
