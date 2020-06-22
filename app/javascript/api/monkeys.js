import axios from 'axios';

function getMonkeyAttributes(monkeys) {
  return monkeys.map((monkey) => ({ id: monkey.id, ...monkey.attributes }));
}
export default function getMonkeys(casinoId) {
  return axios
    .get(`/api/v1/casinos/${casinoId}/monkeys`)
    .then((response) => (getMonkeyAttributes(response.data.data)));
}
