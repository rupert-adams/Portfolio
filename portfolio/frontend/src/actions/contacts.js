import axios from 'axios';

import { ADD_CONTACT } from './types';

// ADD_CONTACT
export const addContact = (contact) => dispatch => {
    axios.post('/api/enquiry/', contact)
        .then(res => {
            dispatch({
                type: ADD_CONTACT,
                payload: res.data
            })
        }).catch(err => console.log(err));
}