import axios from 'axios';
import getAttributes from './helper';

export default function getMonkeys(casinoId) {
  return axios
    .get(`/api/v1/casinos/${casinoId}/monkeys`)
    .then((response) => (getAttributes(response.data.data)));
}
