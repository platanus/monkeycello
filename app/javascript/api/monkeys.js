import axios from 'axios';
import getAttributes from './helper';

export function getMonkeys(casinoId) {
  return axios
    .get(`/api/v1/casinos/${casinoId}/monkeys`)
    .then((response) => (getAttributes(response.data.data)));
}

export function getAllMonkeys() {
  return axios
    .get('/api/v1/monkeys')
    .then((response) => (getAttributes(response.data.data)));
}

