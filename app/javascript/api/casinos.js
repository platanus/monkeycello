import axios from 'axios';
import getAttributes from './helper';

export default function getCasinos() {
  return axios
    .get('/api/v1/casinos')
    .then((response) => getAttributes(response.data.data));
}
