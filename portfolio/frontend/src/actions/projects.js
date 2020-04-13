import axios from 'axios';

import { GET_PROJECTS } from './types';

// GET PROJECTS
export const getProjects = () => dispatch => {
    axios.get('/api/projects/')
        .then(res => {
            dispatch({
                type: GET_PROJECTS,
                payload: res.data
            })
        }).catch(err => console.log(err));
}
